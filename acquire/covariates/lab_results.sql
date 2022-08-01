WITH labels AS (
  SELECT
  CASE WHEN LOWER(label) LIKE '%anion%' THEN itemid ELSE NULL END AS ani
  , CASE WHEN LOWER(label) LIKE 'albumin' THEN itemid ELSE NULL END AS alb
  , CASE WHEN LOWER(label) LIKE 'bilirubin' OR LOWER(label) LIKE 'bilirubin, total' THEN itemid ELSE NULL END bili
  , CASE WHEN LOWER(label) LIKE 'creatinine' THEN itemid ELSE NULL END AS crea
  , CASE WHEN LOWER(label) LIKE 'glucose' THEN itemid ELSE NULL END AS glu
  , CASE WHEN LOWER(label) LIKE 'hemoglobin' AND category = 'Blood Gas' THEN itemid ELSE NULL END AS hemo
  , CASE WHEN LOWER(label) LIKE '%platelet count%' THEN itemid ELSE NULL END AS pla
  , CASE WHEN LOWER(label) LIKE 'potassium' THEN itemid ELSE NULL END AS pot
  , CASE WHEN lower(label) LIKE '%inr%' THEN itemid ELSE NULL END AS inr
  , CASE WHEN label LIKE 'PT' THEN itemid ELSE NULL END AS pt
  , CASE WHEN LOWER(label) LIKE '%sodium, w%' OR label LIKE 'Sodium' THEN itemid ELSE NULL END AS sod
  , CASE WHEN lower(label) LIKE '%urea nitrogen%' and fluid = 'Blood' THEN itemid ELSE NULL END AS bl_urea_nit
  , CASE WHEN lower(label) LIKE '%wbc count%' OR lower(label) LIKE '%white blood cells%' THEN itemid ELSE NULL END AS wbc
  FROM `physionet-data.mimic_hosp.d_labitems`   
)

SELECT ie.subject_id, ie.hadm_id, ie.stay_id
, MAX(CASE WHEN itemid IN (SELECT ani FROM labels) THEN valuenum ELSE NULL END) AS max_anion_gap
, MIN(CASE WHEN itemid IN (SELECT alb FROM labels) THEN valuenum ELSE NULL END) AS min_albumin
, MAX(CASE WHEN itemid IN (SELECT bili FROM labels) THEN valuenum ELSE NULL END) AS max_bilirubin
, MAX(CASE WHEN itemid IN (SELECT crea FROM labels) THEN valuenum ELSE NULL END) AS max_creatinine
, MAX(CASE WHEN itemid IN (SELECT glu FROM labels) THEN valuenum ELSE NULL END) AS max_glucose
, MIN(CASE WHEN itemid IN (SELECT hemo FROM labels) THEN valuenum ELSE NULL END) AS min_hemoglobin
, MIN(CASE WHEN itemid IN (SELECT pla FROM labels) THEN valuenum ELSE NULL END) AS min_platelet
, MAX(CASE WHEN itemid IN (SELECT pot FROM labels) THEN valuenum ELSE NULL END) AS max_potassium
, MAX(CASE WHEN itemid IN (SELECT inr FROM labels) THEN valuenum ELSE NULL END) AS max_inr
, MAX(CASE WHEN itemid IN (SELECT pt FROM labels) THEN valuenum ELSE NULL END) AS max_pt
, MAX(CASE WHEN itemid IN (SELECT sod FROM labels) THEN valuenum ELSE NULL END) AS max_sodium
, MIN(CASE WHEN itemid IN (SELECT sod FROM labels) THEN valuenum ELSE NULL END) AS min_sodium
, MAX(CASE WHEN itemid IN (SELECT bl_urea_nit FROM labels) THEN valuenum ELSE NULL END) AS max_blood_urea_nitrogen
, MAX(CASE WHEN itemid IN (SELECT wbc FROM labels) THEN valuenum ELSE NULL END) AS max_white_blood_cell_count
FROM `physionet-data.mimic_hosp.labevents` AS le
INNER JOIN `physionet-data.mimic_icu.icustays` AS ie
      ON le.hadm_id = ie.hadm_id
  WHERE DATE_DIFF(le.charttime, ie.intime, HOUR) >= 0
    AND DATE_DIFF(le.charttime, ie.intime, HOUR) <= 24
GROUP BY subject_id, hadm_id, stay_id
ORDER BY subject_id, hadm_id, stay_id