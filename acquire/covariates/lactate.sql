SELECT ie.subject_id, ie.stay_id, ie.hadm_id, ce.valuenum
, DATE_DIFF(ce.charttime, ie.intime, HOUR) AS time
, MAX(ce.valuenum) OVER (PARTITION BY ie.stay_id) as max_lactate
, AVG(ce.valuenum) OVER (PARTITION BY ie.stay_id) as mean_lactate
, RANK() OVER (PARTITION BY ie.stay_id ORDER BY ce.charttime) AS rank
FROM `physionet-data.mimic_icu.icustays` ie
INNER JOIN `physionet-data.mimic_hosp.labevents` ce
    ON ie.hadm_id = ce.hadm_id
WHERE itemid in (50813, 52442)
AND DATE_DIFF(ce.charttime, ie.intime, HOUR) <= 24 AND DATE_DIFF(ce.charttime, ie.intime, HOUR) >= 0
ORDER BY subject_id, hadm_id, stay_id