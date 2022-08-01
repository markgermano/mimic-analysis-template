# Import libraries
import os
from pathlib import Path

import pandas as pd
# local package - can be useful to put misc utilities into a file in the same folder
# import utils

df_final = pd.merge(df_merged, df_general, on=['subject_id', 'hadm_id','stay_id'], how='left')

df_final = pd.merge(df_final, df_com, on=['subject_id', 'hadm_id'], how='left'

df_final = pd.merge(df_final, df_labs, on=['subject_id', 'hadm_id', 'stay_id'], how='left')

df_final = pd.merge(df_final, df_vit, on=['subject_id', 'hadm_id', 'stay_id'], how='left')

df_final = pd.merge(df_final, df_mort, on=['subject_id', 'hadm_id'], how='left')

