import time 

start_time = time.time()
end_time = time.time()
print(f"Total time taken: {end_time - start_time} seconds")

import pandas as pd
import numpy as np

df = pd.read_excel(r"")

df.head()
df.describe()
df.info()
df.isna().sum()
df.isna()

df[''].fillna(0)

#Checking the max unavailability score
max_unavailability = merged_df['unavailability_score'].max()

print(max_unavailability)

min_unavailability = merged_df['unavailability_score'].min()
print(min_unavailability)

#renaming the cols of mystery_df
standard_col_name = {
    'Listing ID':'listing_id',
    'Agent ID':'agent_id',
    'Date':'key_date',
    'Is It Available':'is_available'
}
mystery_df = mystery_df.rename(columns=standard_col_name)
mystery_df.columns.to_list()

#before normalizing
mystery_df['key_date'].head()

mystery_df['key_date'] = pd.to_datetime(mystery_df['key_date']).dt.strftime('%Y%m%d').astype(int)

print([x for x in mystery_df.columns if 'available' in x.lower()])

#sample key dates in mystery df
mystery_df['key_date'].head()

df_mys.columns.to_list()

merged_df = pd.merge(df_mys,mystery_df,on=['listing_id','agent_id','key_date'],how='left')

print(merged_df.count())
print(f"Total rows lost while the merge : {mystery_df.count() - merged_df.count()}")
merged_df['is_available'].nunique()
merged_df['is_available'].value_counts()
#cases where they are unavailable
merged_df_unavailable = merged_df[merged_df['is_available'] == 'No']
merged_df_unavailable[['online_day','listing_location_lvl_0_id','listing_rent_sell_offering_type','listing_property_type_clean','listing_bedrooms_clean']].head()
#cases where they are available 
merged_df_available = merged_df[merged_df['is_available'] == 'Yes']
merged_df_available[['online_day','listing_location_lvl_0_id','listing_rent_sell_offering_type','listing_property_type_clean','listing_bedrooms_clean']].head()