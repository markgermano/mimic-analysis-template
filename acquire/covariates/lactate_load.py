new_data = df_lac.groupby('stay_id')
lac_load = pd.DataFrame(columns=['max_lac', 'mean_lac', 'lac_load', 'norm_lac_load', 'stay_id'])
lac_load_list = []
norm_lac_list = []
stay_id_list = []
max_lac_list = []
mean_lac_list = []

for group, item in new_data:
  sum = 0
  for v1, v2, rank1, rank2, t1, t2 in zip(new_data.get_group(group)['valuenum'], new_data.get_group(group)['valuenum'][1:], new_data.get_group(group)['rank'], new_data.get_group(group)['rank'][1:], new_data.get_group(group)['time'], new_data.get_group(group)['time'][1:]):
    if rank1 == 1:
      sum+=(((v1+v1)/2)*(t1-0))
    if rank2 == new_data.get_group(group)['rank'].iloc[-1]:
      sum+=(((v2+v2)/2)*(24-t2))
    sum+=(((v1+v2)/2)*(t2-t1))
  max_lac_list.append(max(new_data.get_group(group)['max_lactate']))
  mean_lac_list.append(max(new_data.get_group(group)['mean_lactate']))
  lac_load_list.append(sum)
  norm_lac_list.append(sum/24)
  stay_id_list.append(group)

lac_load = pd.DataFrame({'max_lac': max_lac_list, 'mean_lac': mean_lac_list,'lac_load': lac_load_list, 'norm_lac_load': norm_lac_list, 'stay_id': stay_id_list})

# Merge with exclusions
df_merged = pd.merge(df, lac_load, on='stay_id')