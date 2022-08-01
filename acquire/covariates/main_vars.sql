SELECT ie.subject_id
, ie.hadm_id
, ie.stay_id
, pt.anchor_age AS age
, CASE WHEN pt.gender = 'F' THEN 1 ELSE 0 END AS female
, wt.weight_admit AS weight
, sof.SOFA AS sofa_score
, sap.sapsii AS sapsii_score
, DATE_DIFF(adm.dischtime, adm.admittime, DAY) AS length_of_hospital_stay
, DATE_DIFF(outtime, intime, DAY) AS length_of_icu_stay
, uri.urineoutput AS daily_urine_output
FROM `physionet-data.mimic_icu.icustays` AS ie
INNER JOIN `physionet-data.mimic_core.patients` AS pt
  ON ie.subject_id = pt.subject_id
LEFT JOIN `physionet-data.mimic_derived.first_day_weight` AS wt
  ON ie.stay_id = wt.stay_id
LEFT JOIN `physionet-data.mimic_derived.first_day_sofa` AS sof
    ON ie.stay_id = sof.stay_id
LEFT JOIN `physionet-data.mimic_derived.sapsii` AS sap
  ON ie.stay_id = sap.stay_id
LEFT JOIN `physionet-data.mimic_core.admissions` AS adm
  ON ie.hadm_id = adm.hadm_id
LEFT JOIN `physionet-data.mimic_derived.first_day_urine_output` AS uri
    ON ie.stay_id = uri.stay_id
ORDER BY subject_id, hadm_id, stay_id