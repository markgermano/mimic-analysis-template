WITH tally AS (
SELECT ie.subject_id, ie.stay_id, ie.hadm_id
, SUM(CASE WHEN DATE_DIFF(ce.charttime, ie.intime, HOUR) <= 24 AND DATE_DIFF(ce.charttime, ie.intime, HOUR) >= 0 THEN 1 ELSE 0 END) as count_
, MAX(ce.valuenum) AS max
FROM `physionet-data.mimic_icu.icustays` ie
INNER JOIN `physionet-data.mimic_hosp.labevents` ce
    ON ie.hadm_id = ce.hadm_id
WHERE itemid in (50813, 52442)
GROUP BY subject_id, stay_id, hadm_id
)

SELECT ie.subject_id, ie.hadm_id, ie.stay_id
, CASE WHEN age.anchor_age >= 18 THEN 0 ELSE 1 END AS exclude_non_adult
, CASE WHEN ROW_NUMBER() OVER (PARTITION BY ie.subject_id ORDER BY ie.intime) > 1 THEN 1 ELSE 0 END AS exclude_not_first_icu
, CASE WHEN COALESCE(tally.count_, 0) < 2 THEN 1 ELSE 0 END AS exclude_not_2_lactate
, CASE WHEN DATE_DIFF(ie.outtime, ie.intime, HOUR) < 24 THEN 1 ELSE 0 END AS exclude_short_los
, CASE WHEN sep.sepsis3 = TRUE AND DATE_DIFF(sep.suspected_infection_time, ie.intime, HOUR) < 0 THEN 1 ELSE 0 END AS sepsis
FROM `physionet-data.mimic_icu.icustays` ie
INNER JOIN `physionet-data.mimic_core.patients` age
    ON ie.subject_id = age.subject_id
LEFT JOIN tally
   ON ie.stay_id = tally.stay_id
LEFT JOIN `physionet-data.mimic_derived.sepsis3` AS sep
  ON ie.stay_id = sep.stay_id
WHERE max IS NOT NULL
ORDER BY subject_id, hadm_id, stay_id

-- Make exclusions
df = df.loc[(df['exclude_non_adult'] == 0) & (df['exclude_not_first_icu'] == 0) & (df['exclude_not_2_lactate'] == 0) & (df['exclude_short_los'] == 0)]