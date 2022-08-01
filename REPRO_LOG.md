# Conclusion for reproduction

The following is a logbook/ultimate conclusion for a reproduction of a published scientific study. Feel free to add/remove sections as you find them useful.

## Title

The title of the reproduced study with its digital object identifier (DOI).

Title: "Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database"

DOI: https://doi.org/10.1186/s12871-022-01617-5

## Known differences

Specify changes to the data processing and/or methodology which are known to you. For each difference, describe: (1) the original study approach, (2) the reproduction approach, (3) the justification for the change. If possible, classify the differences as major (could impact the result of the study) or minor (unlikely to change the result of the study).

One change to the data processing was how outlier data was dealt with. It was not confirmed how outliers were handled (although the paper did confirm that 2 patients were removed), so the study approach is unknown. For simplicity, my reproduction involved the removal of any outliers. This change was necessary as some values were far too obscure (ie a negative value for a measurement that could not be negative).

## Unknown differences

Specify changes to the data processing and/or methodology which *may* have occurred, but you are unable to confirm due to ambiguity in the original material studied. For each difference, describe (1) the most specific reference to the approach in the original study, if possible, and (2) the approach taken in the reproduction.

As stated in the last paragraph, it was uncomfirmed how outliers were handled. The original paper was very ambiguous in regards to this specific scenario. The study only identified that 2 outlier patients were removed before any analysis began. In my reproduction I decided to replace oultier values with N/A for the describptive statistics. These were then further removed when logistic regression was performed.

## Comparison of population

A table comparing the population measures between the original and the reproduction.

Population measure | Original Study | Reproduction

Total patients | 21,333 | 17,782

Age (Year) | 65.1 ± 16 | 64.1±15.9

Weight (kg) | 83 ± 23.8 | 83.5 ± 23.5

Female (%) | 8528 (40) | 6997 (39.3)

SOFA score | 5.9 ± 3.7 | 7.0 ± 3.9

SAPS-II score | 41.7 ± 15.1 | 40.15 ± 14.6

Length of hospital stay | 8 (5.1, 13.5) | 12.2 ± 13.3

Length of ICU stay | 2.7 (1.4, 5.2) | 4.9 ± 6.2

24-hour urine output | 1515 (891, 2330) | 1580 (980, 2375)

Die in 28 days | 3569 (16.7) | 2376 (13.4)


## Comparison of results

A table of the evaluation measures comparing the results in the original study and the reproduction. Also include the final size of the cohort, proportion of individuals excluded, and other important summary measures for the study.

Evaluation measure | Original Study | Reproduction

Cohort | 21,333 | 17,782

Proportion excluded | 72.1% | 76.8% |

## Conclusion(s) regarding reproducibility

Highlight specific challenges faced during the reproduction attempt which could be improved upon in the future.

The paper was quite vague which made it very difficult to reproduce. Missing data was not discussed, machine learning models were not discussed, and a lot was left to the reader to decide what exactly was going on. If I could do this reproduction over, I would take into consideration this left out information. I feel that I was eager to get incredibly similar results, but was often left frustrated because of the vague nature of the paper. In hindsight, I would say that it is better to trust your process rather thank focusing on completely reproducing results.