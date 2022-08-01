# Reproduction template

The goal of this template is to guide documentation of a reproduction of a study in an electronic health record database. Reproductions are assumed to be retrospective observational studies.

This template is based on material from the OSF, as well as from Brandt et al., 2013.

## Title of the study

The title of the reproduced study with its digital object identifier (DOI).

Title: "Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database"

DOI: https://doi.org/10.1186/s12871-022-01617-5

## Dataset(s) used

Describe the dataset used in the reproduction. Include the same information as above, that is at least:

* Dataset name and version
* DOI (or link if no DOI available)
* Citation
* Other relevant information (link to dataset documentation, etc)

If the same dataset in the original study is used for the reproduction, reference the prior section.

** See STUDY_REVIEW.md section "Dataset(s) used **

## Data extraction

### Inclusion/Exclusion criteria

Provide the column names for your proposed "cohort" table, which will apply all inclusion/exclusion criteria. Include the description of the criteria, the table in the dataset you will use, and how missing data will be interpreted (e.g. missing values will be assumed to include the patient).

exclusion_under_18 - Remove patients under age 18. Will use the patients and icustays table, and define age as the age at icu admission.

exclusion_not_first_icu - Remove patients who have already been to the icu. Will use the icustays table intime/outtime to select earliest intime and outtime.

exclusion_not_2_lactate - Remove patients who do not have at least 2 lactate measurements in the first 24 hours. Will use the labevents table and icustays table, and use charttime and icu intime/outtime to determine if 2+ lactate measurements recorded in first 24 h.

exclusion_short_los - Remove patients whose length of icu stay is less than 24 hours. Will use the icustays table.

### Variables

List out the planned source for all covariates and exposures extracted for the study, e.g. admission source.
If describing a time-varying covariate, be specific regarding the aggregation and the time window (e.g. "lowest mean arterial pressure during the first 24 hours of the ICU stay."). The following template is a useful guide.

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
Heart Rate Day 1 | Patient heart rate | First 24 hours of ICU stay | Highest | chartevents | 
Sedative use | Midazolam or propofol | Any time during the ICU Stay | Any value | inputevents | 

If unsure about the source, write all possibilities, and justify them in the notes.
Also include in the notes whether outliers were processed (and how), as well as the approach for missing data.

Variable name | Description | Timing | Aggregation | Source | Notes

Age | Age of patient | Any time during ICU stay | Exclude under 18 | patients |

Gender | Gender of patient | Any time during ICU stay | N/A | patients |

Weight | Admission weight | Any time during ICU stay | N/A | chartevents |

SOFA score | Sequential organ failure assessment score | Any time during ICU stay | N/A | chartevents |

SAPS-II score | Simplifed acute physiology score-II  | Any time during ICU stay | N/A | sapsii |

Hospital stay | Length of stay in hospital | When patient is dishcarged | N/A | admissions | Take 
difference b/w admittime and dischtime

ICU stay | Length of stay in ICU | When patient leaves ICU | los must be 24h+ | icustays |


Fluid intake | Daily fluid intake | Once every 24h | N/A | inputevents |

Urine output | Daily urine output | Each unique day | N/A | urine_output |

Mortality | If patient dies in 28 days | Any time in 28-day period | exclude after 28 days | 
admissions | 

Heart failure | Congestive heart failure | Any time during ICU stay | N/A | diagnoses_icd |

Myocardial infarction | Patient myocardial infarction | Any time during ICU stay | N/A | diagnoses_icd |

Cerebrovascular disease | Patient cerebrovascular disease | Any time during ICU stay | N/A | 
diagnoses_icd |

Chronic pulmonary disease | Patient chronic pulmonary disease | Any time during ICU stay | N/A | diagnoses_icd | "disease" not explicitly written in MIMIC

Mild liver disease | Patient mild liver disease | Any time during ICU stay | N/A | diagnoses_icd | How to determine mild?

Severe liver disease | Patient severe liver disease | Any time during ICU stay | N/A | diagnoses_icd |

Diabetes w/0 comp | Diabetes without complication | Any time during ICU stay | N/A | diagnoses_icd |

Diabetes w comp | Diabetes with complication | Any time during ICU stay | N/A | diagnoses_icd |

Renal disease | Patient renal disease | Any time during ICU stay | N/A | diagnoses_icd |

Malignant cancer | patient malignant cancer | Any time during ICU stay | N/A | diagnoses_icd | Over 1000 types on MIMIC?

AIDS | Patient AIDS | Any time during ICU stay | N/A | ? | Could not find

Anion gap | Patient anion gap | Any time during ICU stay | Max | labevents |

Albumin | Patient albumin | Any time during ICU stay | Min | labevents | Many different types?

Bilirubin | Patient bilirubin | Any time during ICU stay | Max | labevents | Many different types?

Creatinine | Patient max creatinine | Any time during ICU stay | Max | labevents | Many different types?

Glucose | Patient max glucose | Any time during ICU stay | Max | labevents | Many different types?

Hemoglobin | Patient max hemoglobin | Any time during ICU stay | Min | labevents | Many different types?

Platelet | Patient min platelet | Any time during ICU stay | Min | labevents | Many different types?

Potassium | Patient max potassium| Any time during ICU stay | Max | labevents | Many different types?

APTT | Patient activated partial thromboplastin clotting time | Any time during ICU stay | Max | ? | 
Could not find

INR | Patient international normalized ratio | Any time during ICU stay | Max | labevents | "INR(PT)"?

PT | Patient max prothrombin time | Any time during ICU stay | Max | labevents |

Sodium max | Patient max sodium | Any time during ICU stay | Max | labevents | Many different types?

Sodium min | Patient min sodium | Any time during ICU stay | Min | labevents | Many different types?

Blood urea nitrogen | Patient Blood urea nitrogen | Any time during ICU stay | Max | labevents | Unsure 
which one is blood

White blood cell count | Patient max WBC count | Any time during ICU stay | Max | labevents |

Heart rate | Patient mean heart rate| Any time during ICU stay | Mean | chartevents |

Systolic blood pressure | Patient systolic BP | Any time during ICU stay | Min | chartevents | Unsure which one?

Diastolic blood pressure | Patient diastolic BP | Any time during ICU stay | Min | chartevents | Unsure which one?

Mean arterial blood pressure | Patient mean arterial BP | Any time during ICU stay | Min | chartevents |

Respiratory rate | Patient max respiratory rate | Any time during ICU stay | Max | chartevents |

Pulse O2 saturation | Patient min pulse o2 sat. | Any time during ICU stay | Min | chartevents | Unsure which one?

Max lactate | Patient max lactate | First 24 h | Max | labevents |

Mean lactate | Patient mean lactate | First 24 h | Mean | labevents |

Lactate load | Patient lactate load | First 24 h | AUC of lactate | labevents | How to get AUC?

Normalized lactate load | Patient normalized lactate load | First 24 h | AUC/time | labevents | How to get AUC?



### Outcome(s)

List the outcome(s) used in the study, e.g. 28-day mortality, with similar detail as the above variables.

Mortality | If patient dies in 28 days | Any time in 28-day period | exclude after 28 days | patients |