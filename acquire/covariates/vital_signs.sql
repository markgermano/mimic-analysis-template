WITH labels AS (
  SELECT
  CASE WHEN label LIKE '%Heart Rate%' THEN itemid ELSE NULL END AS hr
  , CASE WHEN LOWER(label) LIKE '%systolic%' AND category = 'Routine Vital Signs' THEN itemid ELSE NULL END AS sys
  , CASE WHEN LOWER(label) LIKE '%diastolic%' AND category = 'Routine Vital Signs' THEN itemid ELSE NULL END dia
  , CASE WHEN LOWER(label) LIKE '%arterial blood pressure mean%' THEN itemid ELSE NULL END AS mabp
  , CASE WHEN LOWER(label) LIKE 'respiratory rate' THEN itemid ELSE NULL END AS resp
  , CASE WHEN LOWER(label) LIKE '%o2 saturation%' AND category NOT LIKE 'Alarms' THEN itemid ELSE NULL END AS oxy
  FROM `physionet-data.mimic_icu.d_items`  
)

SELECT ie.subject_id, ie.hadm_id, ie.stay_id
, AVG(CASE WHEN itemid IN (SELECT hr FROM labels) THEN valuenum ELSE NULL END) AS mean_heart_rate
, MIN(CASE WHEN itemid IN (SELECT sys FROM labels) THEN valuenum ELSE NULL END) AS min_systolic_blood_pressure
, MIN(CASE WHEN itemid IN (SELECT dia FROM labels) THEN valuenum ELSE NULL END) AS min_diastolic_blood_pressure
, MIN(CASE WHEN itemid IN (SELECT mabp FROM labels) THEN valuenum ELSE NULL END) AS min_mean_arterial_blood_pressure
, MAX(CASE WHEN itemid IN (SELECT resp FROM labels) THEN valuenum ELSE NULL END) AS max_respiratory_rate
, MIN(CASE WHEN itemid IN (SELECT oxy FROM labels) THEN valuenum ELSE NULL END) AS min_pulse_o2_saturation
FROM `physionet-data.mimic_icu.chartevents` ce
INNER JOIN `physionet-data.mimic_icu.icustays` AS ie
      ON ce.hadm_id = ie.hadm_id
  WHERE DATE_DIFF(ce.charttime, ie.intime, HOUR) >= 0
    AND DATE_DIFF(ce.charttime, ie.intime, HOUR) <= 24
GROUP BY subject_id, hadm_id, stay_id
ORDER BY subject_id, hadm_id, stay_id