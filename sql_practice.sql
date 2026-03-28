-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.


DROP TABLE if EXISTS transactions

CREATE TABLE transactions(
  user_id int ,
  transaction_date date,
  amount float,
  payment_status object)
  
select *
from transactions

INSERT INTO transactions(user_id,transaction_date,amount,payment_status)
VALUES(1,2025/09/12,10000,'COMPLETED'),
(2,2025-09-12,4000,'Pending')

select lower(DISTINCT(payment_status))
from transactions

SELECT lower(DISTINCT(payment_status)),count(*)
from transactions
group by 1
order by 2 DESC

SELECT MAX(amount) as max_amount, min(amount) as min_amount
from transactions



--check only the distribution trends for active customers
select count(distinct(customer_name)), date
from customers
where lower(activity_status) = 'active'
group by 1 
order by 2 asc

-- summarized table for testing
with summarized_table as (
    select count(distinct (property_listing_id)),
    count(*) as total_rows,
    count(distinct agent_id)
    from pf_de_prod_db.pf_dwh.dim_property_listing_snp
)
select *
from summarized_table
limit 10;

-- checking the distinct listings for dubai for year 2025
select count(distinct(s.property_listing_id))
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where s.country_code = 'AE' and lower(trim(l.location_lvl_0_name)) = 'dubai' and s.key_date between 20250101 and 20251231

--checking the places / rows where the location is not present for the listing
select count(*)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where s.country_code = 'AE' and lower(trim(l.location_lvl_0_name)) = 'dubai' and s.key_date between 20250101 and 20251231 and (l.key_country is null or l.key_location is null)

select distinct (label),count(*)
from pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_forward_looking
group by 1
order by 2 desc

select column_name
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_snp'

select distinct(offering_type_name)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp

with offering_breakdown as (select case when offering_type_name ilike '%sale' then 'Sale' else 'Rent' end as offering_type,
                                   case
                                       when offering_type_name ilike '%residential' then 'Residential'
                                       else 'Commercial' end                                              as property_category
                            FROM pf_de_prod_db.pf_dwh.dim_property_listing_snp)
select distinct offering_type,property_category from offering_breakdown


select distinct(l.location_lvl_0_name),count(distinct s.property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s 
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where s.key_country = 'AE' 
group by 1
order by 2 desc

select
    s.property_listing_id,
    s.agent_id,
    case when s.offering_type_name ilike '%Sale%' then 'Sale' else 'Rent' end as offering_type,
    case when s.offering_type_name ilike '%Residential' then 'Residential' else 'Commercial' end as property_category,
    s.property_type,
    s.listing_level,
    l.location_lvl_0_name,
    l.location_lvl_1_name,
    count(distinct s.key_date),
    min(s.key_date) as first_online_date,
    max(s.key_date) as last_online_date,
    sum(s.total_plp_views),
    sum(s.total_impressions),
    sum(s.total_lead_clicks)
    
    from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
    left join pf_de_prod_db.pf_dwh.dim_location l
    on s.key_country = l.key_country and s.key_location = l.key_location

    group by 1,2,3,4,5,6,7,8
    
    select
    case when s.offering_type_name ilike '%Sale%' then 'Sale' else 'Rent' end as offering_type,
    case when s.offering_type_name ilike '%Residential' then 'Residential' else 'Commercial' end as property_category,
    count(distinct s.property_listing_id)
    from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
    left join pf_de_prod_db.pf_dwh.dim_location l
    on s.key_country = l.key_country and s.key_location = l.key_location
    where s.key_date between 20251201 and 20251231 and s.key_country = 1004 and l.location_lvl_0_name = 'Dubai'
    group by 1,2


with summarized_table as (
select count(distinct s.property_listing_id) as unique_properties,
        count(distinct l.location_lvl_0_name) as unique_emirates,
        count(distinct l.location_lvl_1_name) as unique_communities,
        count(distinct s.listing_level) as unique_listings,
        count(distinct s.offering_type_name) as unique_offering_type,
        min(s.key_date) as start_snp_date,
        max(s.key_date) as end_snp_date
        

from pf_de_prod_db.pf_dwh.dim_property_listing_snp s 
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
)

select *
from summarized_table

select pf_property_id,count(*) as dup_count
from pf_int.int_dld_permit_result
group by 1
having count(*) > 1
order by 2 desc
limit 10;

select count(distinct pf_property_id)
from pf_int.int_dld_permit_result
limit 10;

select count(distinct(identity_number))
from pf_int.int_dld_transactions
limit 10;

select distinct(identity_year)
from pf_int.int_dld_transactions

select distinct (location_lvl_1_name), count(*) as count
from pf_de_prod_db.pf_dwh.dim_location
group by 1
order by 2 desc

select distinct location_lvl_1_name
from pf_de_prod_db.pf_dwh.dim_location
limit 100;

select distinct(location_lvl_1_name)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_1_name ilike '%discovery%'
limit 100;

select count(distinct s.property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where l.location_lvl_1_name ilike '%Discovery Gardens%' and key_date between 20250101 and 20251201 and s.key_country = 1004 and s.property_listing_status = 'online'

with summarized_table as (
    select count(distinct s.property_listing_id),
           count(distinct l.location_lvl_1_name)
    from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
    left join pf_de_prod_db.pf_dwh.dim_location l
    on s.key_country = l.key_country and s.key_location  = l.key_location
    where key_date between 20250101 and 20251201 and s.key_country = 1004 and l.location_lvl_0_name = 'Dubai'
)

select *
from summarized_table

select count(distinct(l.location_lvl_1_name))
from pf_de_prod_db.pf_dwh.dim_location l
where l.location_lvl_0_name = 'Dubai'

select *
from pf_dsai_prod_db.analytics.availability_training_rent_1y
limit 100;

select *
from pf_dsai_prod_db.analytics.availability_training_rent_1y
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_training_rent_7d_sampled
limit 10;

select distinct(sample_weight)
from pf_dsai_prod_db.analytics.availability_training_rent_7d_sampled
limit 10;

select distinct (sample_weight),count(*)
from pf_dsai_prod_db.analytics.availability_training_rent_7d_sampled
group by 1
order by 2 desc

select column_name
from information_schema.columns
where table_schema = 'analytics' and table_name = 'availability_training_rent_7d_sampled'

select column_name 
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_snp'

select distinct(location_lvl_1_name),count(*)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_0_name = 'Dubai'
group by 1 
order by 2 desc

select *
from pf_dsai_prod_db.analytics.availability_manual_eval_features
limit 10;

select count(distinct listing_id)
from pf_dsai_prod_db.analytics.availability_manual_eval_features

select count(distinct agent_id)
from pf_dsai_prod_db.analytics.availability_manual_eval_features

select *
from pf_dsai_prod_db.analytics.availability_manual_eval m 
left join pf_dsai_prod_db.analytics.availability_daily_with_market f
on m.listing_id = m.listing_id 
and f.agent_id = m.agent_id 
and f.key_date = m.key_date

select listing_id,agent_id,key_date, count(*) as dup_count
from pf_dsai_prod_db.analytics.availability_daily_with_market
group by 1,2,3
having count(*) > 1
order by 4 desc
limit 10

select distinct(key_date)
from pf_dsai_prod_db.analytics.availability_manual_eval
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_manual_eval_features
limit 10;

select distinct(offering_type),count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_date between 20250101 and 20251231
group by 1 
order by 2 desc

select count(*)
from pf_dsai_prod_db.analytics.availability_manual_eval_features;

select count(distinct listing_id)
from pf_dsai_prod_db.analytics.availability_manual_eval_features

with summarized_table as (
    select count(distinct listing_id),
           count(distinct agent_id),
           count(distinct key_date)
    from pf_dsai_prod_db.analytics.availability_manual_eval
)

select *
from summarized_table

select count(*)
from pf_dsai_prod_db.analytics.availability_manual_eval_features

select count(*)
from pf_dsai_prod_db.analytics.availability_manual_eval_features
where bedrooms_bucket = 'Unknown'

select distinct(location_lvl_1_name),count(*)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_0_name = 'Dubai'
group by 1 
order by 2 desc

select distinct(location_lvl_1_name),count(*)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_0_name = 'Dubai'
group by 1 
order by 2 desc

select distinct(listing_id)
from pf_dsai_prod_db.analytics.availability_manual_eval_features
where key_date = 20251218

select count(*)
from pf_dsai_prod_db.analytics.availability_manual_eval_features

select *
from pf_dsai_prod_db.analytics.availability_manual_eval_features
limit 10;

select count(distinct(listing_id))
from pf_dsai_prod_db.analytics.availability_manual_eval_features
where key_date = 20251229

select distinct(location_lvl_1_name),count(*)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_0_name = 'Dubai'
group by 1
order by 2 desc

select column_name
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_snp'

select distinct(location_lvl_1_name),count(*)
from pf_de_prod_db.pf_dwh.dim_location
where location_lvl_1_name = 'Dubai'
group by 1 
order by 2 desc

select column_name
from information_schema.columns
where table_schema  = 'pf_dwh' and table_name = 'dim_property_listing_snp'

select distinct(reporter_type),count(*)
from  pf_de_prod_db.pf_int.int_property_reported t
where country_code = 'AE' AND EXTRACT(year FROM t.property_report_date) = 2025
        and t.property_report_reason_id in (1,2,3) and t.property_report_user_agent = 'Whatsapp Feedback Loop'
group by 1
order by 2 desc

-- check the distinct count of properties for uae where the whatsapp feedback loop was marked as unavailable property
select count(distinct t.property_report_id)
from  pf_de_prod_db.pf_int.int_property_reported t
where country_code = 'AE' AND EXTRACT(year FROM t.property_report_date) = 2025
        and t.property_report_reason_id in (1,2,3) and t.property_report_user_agent = 'Whatsapp Feedback Loop' and extract(month from t.start_time) >= 12
limit 10;


select count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where l.location_lvl_0_name = 'Dubai' and key_date between 20250101 and 20251201

select count(distinct listing_id)
from pf_dsai_prod_db.analytics.availability_score_property_reported_info_clean_new_label
where key_date between 20250101 and 20251201
limit 10;

select min(key_date),max(key_date)
from pf_dsai_prod_db.analytics.availability_score_property_reported_info_clean_new_label

select *
from pf_dsai_prod_db.analytics.availability_score_property_reported_info_clean_new_label
limit 10;

-- dubai based properties with wfl for 2025
select count(distinct s.property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
inner join pf_dsai_prod_db.analytics.availability_score_property_reported_info_clean_new_label r
on s.property_listing_id = r.listing_id and s.agent_id = r.agent_id and s.key_date = r.key_date
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where l.location_lvl_0_name = 'Dubai' and s.key_date between 20250101 and 20251201

select column_name 
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_snp'

select distinct(l.location_lvl_1_name)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_country = l.key_country
where l.location_lvl_0_name = 'Abu Dhabi'

select distinct(label),count(*)
from pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_only
group by 1
order by 2 desc

with flipped_labeled as (
    select
        case when label = 1 then 0 else 1 end as flipped_label
    from pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_only

)
select distinct(flipped_label),count(*)
from flipped_labeled
group by 1
order by 2 desc

select distinct(listing_id),count(*) as mul_count
from pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_only
group by 1
having count(*) > 1
order by 2 desc
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_only
where listing_id =  13005602

select
    listing_id,
    label,
    count(*) as total_rows
FROM pf_dsai_prod_db.analytics.availability_score_labeled_dataset_wfl_only
WHERE listing_id = 13151094
group by 1,2
order by 3 desc

select distinct(was_property_available),count(*)
FROM pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
where key_property_listing = 154767303
group by 1
order by 2 desc

(select *
FROM pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
where key_property_listing = 154767303 and was_property_available = 1
limit 10)

union all

(select *
FROM pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
where key_property_listing = 154767303 and was_property_available = 0
limit 10)
order by key_date asc

--87964
select count(distinct key_property_listing)
FROM pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
where was_property_available = 0 and key_date between 20250101 and 20251231

select column_name
from information_schema.columns
where table_schema = 'pf_int' and table_name = 'int_property_reported'

select count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where s.key_country = 1004 and s.key_date between 20250101 and 20251231 and s.property_listing_status = 'online' and l.location_lvl_0_name = 'Dubai'

select distinct(reason)
from pf_de_prod_db.pf_int.int_property_blacklist

select column_name
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'agg_d_superagent_score'

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date = 20251231 and property_listing_status = 'online'
limit 50

select *
from pf_de_prod_db.pf_int.int_property_blacklist
where extract(year from date_blacklisted) = 2025
limit 50;

select *
from pf_de_prod_db.pf_dwh.agg_d_superagent_score
where key_country = 1004 and key_date = 20251231
limit 50;

select *
from pf_de_prod_db.pf_int.int_property_blacklist
limit 10;

select *
from pf_de_prod_db.pf_int.int_dld_tenancy_contracts
limit 10;

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 872751060
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
limit 10;

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1
order by 2 desc

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
limit 10;

select date_blacklisted
from pf_de_prod_db.pf_int.int_property_blacklist
limit 10

select count(distinct property_id)
from pf_de_prod_db.pf_int.int_property_blacklist
where country_code = 'AE' and event_type = 'I' and reason = 'Unavailable Property' and date_blacklisted between '2024-12-01' and '2025-12-01'

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
where label_source = 'pf_enforced_blacklist'
limit 10;

select distinct(reason)
from pf_de_prod_db.pf_int.int_property_blacklist
where country_code = 'AE' and event_type = 'I' and date_blacklisted between '2024-12-01' and '2025-12-01'

select column_name 
from information_schema.columns
where table_schema = 'pf_int' and table_name = 'int_property_blacklist'

--summarized table
with summarized_table as (select count(distinct s.property_listing_id) as unique_listings,
                          count(distinct s.offering_type) as unique_offerings,
                          count(distinct s.location_lvl_0_name) as unique_emirates_covered,
                          count(distinct s.location_lvl_1_name) as unique_communities_covered
                          from pf_de_prod_db.pf_dwh.dim_property_listing_snp s 
                          left join pf_de_prod_db.pf_dwh.dim_location l
                          on s.key_country = l.key_country and s.key_location = l.key_location
                          where s.key_country = 1004 and s.key_date between 20241201 and 20251201 and s.property_listing_status = 'online'
)

select *
from summarized_table

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1 
order by 2 desc

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1 
order by 2 desc

--checking the unique properties for overall uae for 1 year
select count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_listing_status = 'online'

select *
from
(
select 
    t.*,
    row_number(
    partition by label_source
    order by random()
    ) rn 
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t) x 
where rn <=2
order by t.label_source,rn;

select *
from(
select ci.*,
       row_number() over(
       partition by was_property_available
       order by random()
       ) as rn
       from pf_de_prod_db.pf_dwh.fct_consumer_interaction_review ci) x 
where rn>= 2
order by ci.was_property_available, rn

select *
    from (
        select t.*,
               row_number() over (partition by t.label_source
               order by random()) as rn
        from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t 
         ) x 
where rn <= 2
order by t.label_source, rn

select *
from pf_dsai_prod_db.analytics.availability_decay_training_set
limit 10;

select *
    from (
        select t.*,
               row_number() over (partition by label_source
               order by random()) as rn
        from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t) x 
         
    where rn <= 2
    order by t.label_source,rn

select *
    from (
        select t.*,
               row_number() over (partition by t.label_source
               order by random()) as rn
        from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t
         ) x
where rn <= 2
order by label_source, rn

select distinct(type)
from pf_de_prod_db.pf_int.int_property_blacklist
where country_code = 'AE' and date_blacklisted between '2024-12-01' and '2025-12-01' and event_type = 'I'

select *
from (
    select t.*,
           row_number() over (partition by t.label_source
           order by random()
               ) rn
          from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t) x
where rn <= 2
order by t.label_source,rn

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
limit 10;

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
           from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t

     ) x
where rn <= 2
order by label_source, rn

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1
order by 2 desc

with summarized_table as 
    (
    select 
    count (distinct s.property_listing_id) as unique_properties,
     count(distinct l.location_lvl_0_id) as unique_emirates
     from pf_de_prod_db.pf_dwh.dim_property_listing_snp s 
     left join pf_de_prod_db.pf_dwh.dim_location l
     on s.key_country = l.key_country and s.key_location = l.key_location
     where s.key_country = 1004 and s.property_listing_status = 'online' and key_date between 20251202 and 20251231
    )

select *
from summarized_table

select *
from (select 
          t.*,
          row_number() over(
              partition by t.label_source,
              order by random()   
              ) as rn 
      from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t
      ) x 
where rn <= 2
order by label_source, rn

-- Total mystery shopping dataset in the table - 725
select count(*)
from pf_dsai_prod_db.analytics.availability_manual_eval

select column_name
from information_schema.columns
where table_schema = 'analytics' and table_name = 'availability_manual_eval'

select *
from pf_dsai_prod_db.analytics.availability_manual_eval
limit 10;

select count(*)
from pf_dsai_prod_db.analytics.availability_score_mystery_shopping_test

select *
from pf_dsai_prod_db.analytics.availability_score_mystery_shopping_test
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1
limit 10;

select column_name
from information_schema.columns
where table_schema = 'analytics' and table_name = 'availability_score_calibration_dataset_one_year_1'

select count(*)
from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1

select min(key_date),max(key_date) -- 20250216,20251013
from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1

select property_listing_id,key_date,agent_name
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 13360679 and key_country = 1004 and property_listing_status = 'online'
limit 100;

select *
from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1
limit 10;

select distinct(property_listing_status),count(*)
from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1
group by 1
order by 2 desc

select
    avg(online_day)
    from pf_dsai_prod_db.analytics.availability_score_calibration_dataset_one_year_1


select count(distinct(property_id))
from pf_de_prod_db.pf_int.int_property_blacklist
where country_code = 'AE' and date_blacklisted between '2024-12-01' and '2025-12-01' and reason in ('Property not available','Unavailable Property','Property rented/sold')


select distinct(event_type)
from pf_de_prod_db.pf_int.int_property_blacklist
where reason in ('Property not available','Unavailable Property','Property rented/sold') -- I, D, U

select distinct(event_type)
from pf_de_prod_db.pf_int.int_property_blacklist
where reason = 'Unavailable Property'

select event_type,count(distinct property_id)
from pf_de_prod_db.pf_int.int_property_blacklist
where reason = 'Unavailable Property' and country_code = 'AE' and date_blacklisted between '2024-12-01' and '2025-12-01'
group by 1
order by 2 desc

select distinct(property_report_user_agent)
from pf_de_prod_db.pf_int.int_property_reported t
WHERE t.country_code = 'AE'
      AND DATE(t.property_report_date) >= '2024-12-01'
      AND DATE(t.property_report_date) <= '2025-12-01'
AND t.reporter_type IN ('renter', 'buyer', 'renter/buyer')

select *
from pf_de_prod_db.pf_int.int_property_reported
where property_report_reason_id = 1 and reporter_type = 'agent' and country_code = 'AE'
limit 10

select count(distinct property_report_id)
from pf_de_prod_db.pf_int.int_property_reported
where property_report_reason_id = 1 and reporter_type = 'agent' and country_code = 'AE'

select *
from pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
limit 10;

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
limit 10;

select column_name 
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_action_tracker'

select distinct(reporter_type)
from pf_de_prod_db.pf_int.int_property_reported
where country_code = 'AE' and property_report_date >= '2024-12-01' and property_report_date <= '2025-12-01' and property_report_reason_id = 1

select *
from pf_de_prod_db.pf_int.int_property_reported
where property_report_reason_id = 2 and country_code = 'AE' and property_report_date >= '2024-12-01' and property_report_date <= '2025-12-01'
limit 10;

select count(distinct(property_report_user_comment))
from pf_de_prod_db.pf_int.int_property_reported

select count(distinct report_type)
from pf_de_prod_db.pf_int.int_property_reported

select distinct(report_type)
from pf_de_prod_db.pf_int.int_property_reported

select count(distinct property_report_property_id)
from pf_de_prod_db.pf_int.int_property_reported
where country_code = 'AE' and report_type in ('Property not available','-','') and property_report_date >= '2024-12-01' and property_report_date <= '2025-12-01' and reporter_type IN ('renter', 'buyer', 'renter/buyer', 'agent', 'landlord', 'owner')

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1
order by 2 desc

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t
     ) x
where rn <= 2
order by label_source,rn

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
group by 1
order by 2 desc

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2 t
     ) x
where rn <= 2
order by label_source, rn

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
where key_country = 1004  and type = 'unavailable_property' and created_at >= '2024-12-01' and created_at <= '2025-12-01'
limit 10;

select count(distinct key_property_listing)
from pf_de_prod_db.pf_dwh.fct_consumer_interaction_review
where initiator_phone_number = '' and created_at >= '2024-12-01' and created_at <= '2025-12-01' and country_code = 'AE' 

select distinct(signal_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
where signal_source = 'agent_self_removal_within_14_days'
group by 1
order by 2 desc

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 15587840 and agent_id = 166009 and key_date = 20251126 and key_country = 1004

select property_listing_id,agent_id,key_date,property_listing_status
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 9398389 and key_country = 1004 and key_date between 20250101 and 20250331
order by key_date asc
limit 50

select listing_id,key_date,key_month,online_day,listing_location_lvl_0_id,listing_location_lvl_1_id,listing_serp_score,verified_flag,cum_impressions,cum_plp_views,cum_lead_clicks,
       cum_reporter_wfl_unavailable_count,cum_reporter_unavailable_by_agent_count,cum_reporter_unavailable_by_non_agent_count,signal_source,signal_date
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v2
where label_source = 'agent_self_removal_within_14_days'
limit 10;

select property_listing_id,key_date,serp_score_primary,verified_flag,property_listing_status
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 8660264 and key_date = 20241223

select property_listing_id,key_date,serp_score_primary,verified_flag,property_listing_status
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where property_listing_id = 9025337 and key_date = 20250107

select *
from pf_de_prod_db.pf_int.int_property_reported
limit 10;

select column_name
from information_schema.columns
where table_schema = 'pf_int' and table_name = 'int_property_reported'

select distinct(status),count(*)
from pf_de_prod_db.pf_int.int_property_reported
group by 1
order by 2 desc

select distinct(action_taken_reason),count(*)
from pf_de_prod_db.pf_int.int_property_reported
group by 1
order by 2 desc

select *
from (
    select t.*,
           row_number() over(
               partition by t.property_report_reason_id
               order by random()
               ) as rn
    from pf_de_prod_db.pf_int.int_property_reported t
     ) x
where rn <= 2
order by property_report_reason_id,rn

select distinct(reporter_type),count(*)
from pf_de_prod_db.pf_int.int_property_reported
  WHERE country_code = 'AE'
      AND DATE(property_report_date) >= '2024-12-01'
      AND DATE(property_report_date) <= '2025-12-01'
--       AND property_report_reason_id in (1,2,3)  -- "Property not available"
      and report_type = 'Property not available'
      group by 1
    order by 2 desc

select distinct(reporter_type),count(distinct(property_report_property_id))
from pf_de_prod_db.pf_int.int_property_reported
WHERE country_code = 'AE'
      AND DATE(property_report_date) >= '2024-12-01'
      AND DATE(property_report_date) <= '2025-12-01'
--       AND property_report_reason_id in (1,2,3)  -- "Property not available"
      and report_type = 'Property not available' and reporter_type <> ''
group by 1
order by 2 desc

select distinct(signal_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v4
where label_source = 'truly_unavailable_blacklisted'
group by 1
order by 2 desc

select count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v4
where label_source = 'truly_unavailable_blacklisted' and
      (cum_reporter_wfl_unavailable_count >0 or cum_reporter_unavailable_by_agent_count > 0 or cum_reporter_unavailable_by_non_agent_count > 0
          or cum_reporter_inacurate_price_by_agent_count > 0 or cum_reporter_inacurate_price_by_non_agent_count > 0 or cum_reporter_no_response_by_agent_count > 0
           or cum_reporter_no_response_by_non_agent_count > 0)

select count(distinct listing_id)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v4
where label_source = 'truly_unavailable_blacklisted'

select count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v4
where label_source = 'truly_unavailable_blacklisted'

select listing_id, count(*) as dup_count
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v4
where label_source = 'truly_unavailable_blacklisted'
group by 1
having count(*) > 1
order by 2 desc
limit 10;

select property_listing_id,key_date,location_lvl_0_id,location_lvl_1_id,location_lvl_2_id,location_lvl_3_id
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where property_listing_id = 12687452 and key_date between 20241201 and 20241231
order by key_date asc
limit 10;

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v3
group by 1
order by 2 desc

select  property_price
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201
limit 10;

select count(distinct(property_listing_id))
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_price = 0 and property_listing_status = 'online'

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x
where rn <= 2
order by label_source,rn

select count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
group by 1
order by 2 desc

select column_name
from information_schema.columns
where table_schema = 'analytics' and table_name = 'availability_score_training_dataset_v5'

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x
where rn <= 2
order by label_source,rn

select column_name,data_type
from information_schema.columns
where table_schema = 'analytics' and table_name = 'availability_score_training_dataset_v5'


select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
group by 1
order by 2 desc

select listing_id,agent_id, key_date,online_day,cum_serp_changes, listing_age_days,is_stale_30d,is_stale_60d,verifiable_flag,zero_leads_last_7d,quality_score_change, signal_source,signal_date, blacklist_date
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
where label_source = 'truly_unavailable_blacklisted' and listing_lifecycle_count >0
limit 10

select distinct(property_sqft)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_status = 'online' and key_date between 20241201 and 20251201
limit 10;

select min(lat_score),max(lat_score)
from pf_de_prod_db.pf_dwh.agg_d_superagent_score
where key_country = 1004 and key_date between 20241201 and 20251201

select min(wfl_agent_feedback_count),max(wfl_agent_feedback_count)
from pf_de_prod_db.pf_dwh.agg_d_superagent_score
where key_country = 1004 and key_date between 20241201 and 20251201

select property_listing_id, count(*) as total_rows
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201
group by 1
having count(*) = 1
order by property_listing_id
limit 10;

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_id = 8787985

select property_listing_id,count(distinct property_listing_status),count(*)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_id = 12090095
group by 1
having count(distinct property_listing_status) >= 2
order by 2,3 desc
limit 10;

select distinct(property_listing_status)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_id = 12090095

select property_listing_id,count(distinct(listing_level)), count(*) as total_rows
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201
group by 1
having count(distinct listing_level) >= 2
order by property_listing_id,3
limit 10;

select property_listing_id,agent_id,property_listing_status,listing_exclusive_flag,listing_level
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_listing_id = 3233939
limit 10;

select distinct(listing_level)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_listing_id = 3233939

select property_listing_id,agent_id,total_plp_views,total_lead_clicks
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_listing_id = 3233939 and listing_level = 'standard'
union all
select property_listing_id,agent_id,total_plp_views,total_lead_clicks
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20241201 and 20251201 and property_listing_id = 3233939 and listing_level = 'premium'
limit 10

select *
from (
    select property_listing_id,agent_id,total_plp_views,total_lead_clicks,whatsapp_lead_clicks,serp_score_primary,
           row_number() over(
               partition by s.listing_level
               order by random()
               ) as rn
    from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
     ) x
where rn <= 2
order by property_listing_id,rn

select *
from (
    select t.*,
           row_number() over(partition by t.label_source
               order by random()) as rn 
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x 
where rn <= 2
order by label_source, rn

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x
where rn <=2
order by label_source,rn

select column_name
from information_schema.columns
where table_schema = '' and table_name = ''

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
group by 1 
order by 2 desc

select property_listing_id,agent_id,key_date,total_lead_clicks,total_impressions,total_plp_views
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and key_date between 20250201 and 20250228 and property_listing_status = 'online' and property_listing_id = 10152979

select listing_id,agent_id,key_date,signal_source,days_since_last_lead,signal_date,blacklist_date,label_source
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
where label_source = 'truly_unavailable_blacklisted' and zero_leads_last_7d = 0
limit 10;

select listing_id,count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
group by 1
having count(*) > 1
order by 2 desc

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5
where listing_id = 13037922

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x 
where rn <=2
order by label_source,rn

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v6 t
     ) x
where rn <=2
order by label_source,rn

select distinct(label_source),count(*)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v6
group by 1 
order by 2 desc

select column_name 
from information_schema.columns
where table_schema = '' and table_name = ''

select count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_status = 'online' and key_date between 20251202 and 20260210

select distinct(location_lvl_0_name)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp s
left join pf_de_prod_db.pf_dwh.dim_location l
on s.key_country = l.key_country and s.key_location = l.key_location
where location_lvl_0_id = 1 and s.key_country = 1004

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_id = 15548645 and property_listing_status = 'online'

select property_listing_id,count(*)
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_status = 'online'
group by 1
having count(*) > 1
order by 2 desc
limit 10;

select *
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x 
where rn <= 2
order by label_source,rn

select *
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
limit 10;

select distinct(type)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker -- unavailable_property

select count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
where type = 'unavailable_property' and status = 'deleted' and extract(year from created_at) = 2025

select distinct(type),count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
group by 1
order by 2 desc

select column_name
from information_schema.columns
where table_schema = 'pf_dwh' and table_name = 'dim_property_listing_action_tracker'

select distinct(status)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker

select property_listing_id,key_date,property_listing_status
from pf_de_prod_db.pf_dwh.dim_property_listing_snp
where key_country = 1004 and property_listing_id = 13337305
-- and key_date between 20240401 and 20240431
order by key_date asc

select distinct(status_reason),count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
where type = 'unavailable_property' and created_at >= '2024-12-01' and created_at <= '2025-12-01'
group by 1
order by 2 desc

select distinct(extract(month from created_at)),count(distinct property_listing_id)
from pf_de_prod_db.pf_dwh.dim_property_listing_action_tracker
where type = 'unavailable_property' and created_at >= '2024-12-01' and created_at <= '2025-12-01' and status_reason = 'DELETED'
group by 1
order by 2 desc
limit 10;

select *
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v6
limit 10;

select label_source,signal_source
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v6
limit 10;

select distinct(label)
from pf_dsai_prod_db.analytics.availability_score_training_dataset_v6

select * 
from (
    select t.*,
           row_number() over(
               partition by t.label_source
               order by random()
               ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x 
where rn <= 2
order by label_source, rn

select *
from (
    select t.*,
           row_number() over(partition by t.label_source
               order by random() ) as rn
    from pf_dsai_prod_db.analytics.availability_score_training_dataset_v5 t
     ) x 
where rn <= 2
order by label_source,rn

select count(*)
FROM pf_dsai_prod_db.analytics.search_sample

select collector_tstamp,count(*)
FROM pf_dsai_prod_db.analytics.search_sample
group by 1
order by 2 desc