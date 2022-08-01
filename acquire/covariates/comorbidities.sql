SELECT
  CASE WHEN LOWER(long_title) LIKE '%congestive%' AND LOWER(long_title) LIKE '%heart failure%' THEN icd_code ELSE NULL END AS heart_fail
  , CASE WHEN LOWER(long_title) LIKE '%myocardial infarction%' THEN icd_code ELSE NULL END AS myocard_inf
  , CASE WHEN LOWER(long_title) LIKE '%cerebrovascular disease%' THEN icd_code ELSE NULL END AS cer_dis
  , CASE WHEN LOWER(long_title) LIKE '%chronic pulmonary%' THEN icd_code ELSE NULL END AS chr_pul_dis
  , CASE WHEN LOWER(long_title) LIKE '%liver disease%' AND LOWER(long_title) NOT LIKE '%toxic%' THEN icd_code ELSE NULL END AS mild_liv_dis
  , CASE WHEN LOWER(long_title) LIKE '%toxic liver disease%' THEN icd_code ELSE NULL END AS sev_liv_dis
  , CASE WHEN LOWER(long_title) LIKE '%diabetes%' AND LOWER(long_title) LIKE '%without%' AND LOWER(long_title) LIKE '%complication%' THEN icd_code ELSE NULL END AS dia_wo_com
  , CASE WHEN LOWER(long_title) LIKE '%diabetes%' AND LOWER(long_title) LIKE '%with %' AND LOWER(long_title) LIKE '%complication%' THEN icd_code ELSE NULL END AS dia_w_com
  , CASE WHEN LOWER(long_title) LIKE '%renal disease%' THEN icd_code ELSE NULL END AS renal_dis
  , CASE WHEN LOWER(long_title) LIKE '%malignancy%' THEN icd_code ELSE NULL END AS mal
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses`  
)

SELECT subject_id, hadm_id
, MAX(CASE WHEN icd_code IN (SELECT heart_fail FROM labels) THEN 1 ELSE 0 END) AS congestive_heart_failure
, MAX(CASE WHEN icd_code IN (SELECT myocard_inf FROM labels) THEN 1 ELSE 0 END) AS myocardial_infarction
, MAX(CASE WHEN icd_code IN (SELECT cer_dis FROM labels) THEN 1 ELSE 0 END) AS cerebrovascular_disease 
, MAX(CASE WHEN icd_code IN (SELECT chr_pul_dis FROM labels) THEN 1 ELSE 0 END) AS chronic_pulmonary_disease
, MAX(CASE WHEN icd_code IN (SELECT mild_liv_dis FROM labels) THEN 1 ELSE 0 END) AS mild_liver_disease
, MAX(CASE WHEN icd_code IN (SELECT sev_liv_dis FROM labels) THEN 1 ELSE 0 END) AS severe_liver_disease 
, MAX(CASE WHEN icd_code IN (SELECT dia_wo_com FROM labels) THEN 1 ELSE 0 END) AS diabetes_without_complication
, MAX(CASE WHEN icd_code IN (SELECT dia_w_com FROM labels) THEN 1 ELSE 0 END) AS diabetes_with_complication
, MAX(CASE WHEN icd_code IN (SELECT renal_dis FROM labels) THEN 1 ELSE 0 END) AS renal_disease 
, MAX(CASE WHEN icd_code IN (SELECT mal FROM labels) THEN 1 ELSE 0 END) AS malignant_cancer
FROM `physionet-data.mimic_hosp.diagnoses_icd`
GROUP BY subject_id, hadm_id
ORDER BY subject_id, hadm_id