# Study Review

Review the chosen study as if you were an academic reviewer.

## Study information

### Title

The title of the study with its digital object identifier (DOI).

Title: "Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database"

DOI: https://doi.org/10.1186/s12871-022-01617-5

### Objective(s) of the study

Describe the primary and secondary objectives of the research study.

Primary Objective: To evaluate the association between normalized lactate load, an index that
incorporates the magnitude of change and the time interval of such evolution of lactate, and 28-day mortality in sepsis and non-sepsis patients.

Secondary Objective: To compare the accuracy of normalized lactate load in predicting mortality
between sepsis and non-sepsis patients.

### Dataset(s) used

Describe the dataset used in the original study. Include:

* Dataset name and version
* DOI (or link if no DOI available)
* Citation
* Other relevant information (link to dataset documentation, etc)

Dataset name and version: Medical Information Mart for Intensive Care (MIMIC)-IV

DOI: https://doi.org/10.13026/s6n6-xd98

Citation: Johnson A, Bulgarelli L, Pollard T, Horng S, Celi LA, Mark R. "MIMIC-IV" (ver‑
sion 1.0). PhysioNet. 2021.

Other relevant information: 
link: https://doi.org/10.13026/s6n6-xd98 
Previous Version of database: Johnson AE, Pollard TJ, Shen L, Lehman LW, Feng M, Ghassemi M, et al. MIMICIII, a freely accessible critical care database. Sci Data. 2016;3:160035.
https://mimic.mit.edu/

## Summarize the paper

Summarize the paper's goals and results in your own words.

Goals: The main goal of this paper is to evaluate the association between normalized lactate load and 28-day mortality in sepsis and non-sepsis patients. Additionally, this paper hopes to compare the accuracy of normalized lactate load in predicting mortality between sepsis and non-sepsis patients. The dynamic evolution of lactate is plotted against time, and the resulting area under this curve is known as the lactate load. By dividing this AUC by time, we are able to determine what is the normalized lactate load. This normalized lactate load, as well as maximum and mean lactate loads, were used to predict 28-day mortality. The paper hopes to use these results to to compare the predictive power of normalized, maximum, and mean lactate loads. Before analysis begins, the paper hypthesizes that the performance of using lactate load to predict mortality is different between sepsis and non-sepsis patients.

Results: The main result was that normalized lactate load had better accuracy in sepsis patients than in non-sepsis patients, thus confirming the hypothesis. Maximum, mean, and normalized lactate load AUC values were much greater in sepsis patients than non-sepsis patients. Additionally, it was found that those who did not survive had much higher normalized lactate load than those who survived for both sepsis and non-sepsis patients. Additionally, it was found that normalized lactate load yielded the best AUC values for 28-day mortality prediction when compared to maximum and mean lactate load. Lastly, a sesitivity analysis showed that when more lactate measurements were included, the AUC of normalized lactate load increased for non-sepsis patients. However, the AUC was not improved for sepsis patients. 

### Strength(s) of the work

Highlight 3 strengths of the work.

Strength 1: Paper determined a meaningful result that directly answered their main objective. Normalized lactate load does well to predict mortality.

Strength 2: Excellent comparison between max lactate, mean lactate, and normalized lactate load to highlight the benefit of using the magnitude of lactate change with a time interval of evolution.

Strength 3: There were an extensive amount of variables used that helped to identify major differences between sepsis and non-sepsis groups. This helped to highlight how results may differ between groups.

### Weakness(es) of the work

Highlight 3 weaknesses of the work.

Weakness 1: The paper did not go over how missing data was handled. This makes it unclear as a reader to understand a potential area of weakness in terms of how they were dealt with.

Weakness 2: No standard protocol for lactate measurement, as highlighted in the paper.

Weakness 3: Did not review how predictions were made (ie models). Doing so could add more understanding to the results as the method used to predict often has a large impact as to how reliable the results themselves are.

### Anticipated reproducibility challenges

Describe areas of the paper which appear to lack sufficient detail.

As stated before, the lack of detail on how missing data was dealt with will provide a challenge to reproduciblity. This will have to be determined on my own. Further, the large number of variables used makes it difficult to reproduce. Additionally, I have noticed that lactate load requires an AUC value and I am not quite sure how that can be obtained thus far. I anticipate that more challenges will come to light as I begin the reproduction.

## Data extraction

### Variables

List out the covariates and exposures extracted for the study, e.g. admission source.

Covariates:
-age 
-gender 
-weight 
-sequential organ failure assessme (SOFA) score 
-simplifed acute physiology score-II (SAPS-II)
-length of hospital stay 
-length of ICU stay
-daily fuid input 
-daily urine output 
-survival time
-Heart failure
-Myocardial infarction
-Cerebrovascular disease
-Chronic pulmonary disease
-Mild liver disease
-Severe liver disease
-Diabetes without complication
-Diabetes with complication
-Renal disease
-Malignant cancer
-AIDS
-Max Anion gap
-Min Albumin
-Max Bilirubin
-Max Creatinine
-Max Glucose
-Min Hemoglobin
-Min Platelet
-Max Potassium
-Max APTT
-Max INR
-Max PT
-Max Sodium
-Min Sodium
-Max Blood urea nitrogen
-Max White blood cell count
-Mean Heart rate
-Min Systolic blood pressure
-Min Diastolic blood pressure
-Min Mean arterial blood pressure
-Max Respiratory rate
-Min Pulse O2 saturation
-Max lactate
-Mean lactate
-Lactate load
-Normalized lactate load

Other data extraced:
-time of lactate measurement in the frst 24 h of ICU admission
-value of lactate measurement in the frst 24 h of ICU admission
-sepsis group
-non-sepsis group

### Outcome(s)

List the outcome(s) used in the study, e.g. 28-day mortality.

28-day mortality

### Inclusion/Exclusion criteria

Describe the inclusion criteria for the study. Since inclusion/exclusion criteria are interchangeable, decide on the most clear presentation of the study methodology, e.g. "the study included all adults, and excluded patients admitted to CSRU."

All patients admitted into ICU were screened and only those with lactate data available were included. The exclusion criteria were: 1) age<18  years; 2) not frst ICU admission; 3) only one lactate measurement was obtained during the frst 24 h; 4) length of ICU stay<24 h. Any patients with lactate measured before or after 24 h were also excluded, as well as 2 extreme outliers. Of the remaining patients, only those with at least 2 lactate measurements obtained were included. Patients were then divided into the sepsis or non-sepsis group according to the sepsis-3.0 criteria.

### Outlier handling

If outliers were specially processed, describe the approach here.

There was no explanation of handling outliers, however it was identified in the flow chart that there were 2 extreme outliers that were excluded from the patient selection.

### Missing data handling

For any missing data present in the study, explain the approach to handle it.

Missing data was not discussed in this paper.

## Results

### Population summary

Provide information about the original study's population: sample size, average mortality, etc. Typically the data is presented in the first table (i.e. Table 1). Select a parsimonious set of descriptors which you will compare your reproduction against. At the very least include the sample size and a summary measure of the outcome(s).

The total sample size in this study was 21,333 patients (4219 sepsis patients and 17,114 non-sepsis patients). This also included a total of 82,400 lactate records. The median 28-day mortality was 3569 for the total population (with an interquartile range of 16.7). The median 28-day mortality was 2019 for non-sepsis patients (with an interquartile range of 11.8) and 1550 for sepsis patients (with an interquartile range of 36.7). Descriptors that I will consider to use for comparison will be SOFA score, SAPS-II score, one of the comorbidities descriptors, one of the laboratory results in the first 24 hours, one of the vital signs in the first 24 hours, and normalized lactate load.

### Analysis method

Explain the analysis method of the study in detail.

STATA and MedCalc were the statistical softwares used for analysis. In order to order to assess the normality of distributions, the Kolmogorov-Smirnov test was used. If a variable was continuous, its value was presented as mean±standard deviation or median with interquartile range according to the normality. Of these continuous varibales, those that were normally distributed had Student's t-tests performed while those that were non-normal had Wilcoxon rank-sum tests performed. If a variable was instead categorical, it was presented as counts (and percentage in brackets). For these categorical variables, a Chi-square test was used. Receiver-operating characteristic (ROC) curves were then constructed to test and compare the performance of maximum lactate, mean lactate, and normalized lactate load. The Delong test was used to compare the resulting AUC values of the ROC curves and a p-value less than 0.05 was considered to be significant.


### Power calculations (if present)

If a power calculation is present, describe the approach and the assumptions made.

There is no clear indication that a power calculation was performed in the paper.

### Evaluation measures

e.g. p-value, effect sizes, statistical tests, performance measures like area under the receiver operator characteristic curve, etc.

The Kolmogorov-Smirnov test was used to assess normality of distributions.
Student's t-tests were performed on continuous variables tat followed a normal distribution.
Wilcoxon rank-sum tests were performed on continuous variables that were not normally distributed.
Chi-squre tests were used on categorical variables.
Receiveroperating characteristic (ROC) curves were used to test performance.
The Delong test was used to compare AUC values of the ROC curves.
A p-value less than 0.05 was considered to be significant.

### Sensitivity Analyses

Describe any additional sensitivity analyses performed in the study.

A sensitivity analysis was performed to test whether taking more lactate measurements could imrpove the accuracy of normalized lactate load in predicting 28-day mortality. 4 groups were made: greater than/equal to 2, greater than/equal to 3, greater than/equal to 4, or greater than/equal to 5 lactate measurements within 24 hours. Of these groups, AUC values of ROC curves of normalized lactate load were calculated. It was found that the AUC values were unchanged when increasing lactate measurements for sepsis patients. However, AUC values were increased when measuring more lactate measurements in non-sepsis patients. When more lactate measurements were included, AUC increased from 0.684 to 0.775 for non-sepsis patients.
