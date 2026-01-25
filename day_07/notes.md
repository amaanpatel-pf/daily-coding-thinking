#Return a list of engaged users with duration > equal to 20 minutes

Intermediate ds :
{user_id:['duration1','duration2']}

Final ds :
engaged_users = []

#Return a list of frequent users who are have atleast distinct 3 days

Intermediate ds :
{user_id:timestamp_count}

Final ds :
frequent_users = []

#Problem 6 

#Return a list of power users who have performed one purchase action and have 3 different timestamps

#Intermediate ds :

{user_id:{'action':[],'timestamp_count':0}}

#Final ds :
power_users = []

#Problem 7
#Return a list of inactive users which has 0 events

#Intermediate ds
{user_id:[list_of_events]}

#Final ds :
inactive_users = []

#Problem 8
#Return a list of active users which has more login events almost more than equal to 5

#Intermediate ds :
{user_id:[list_of_events]}

#Final ds :
active_users = []

#Problem 9
#Return a list of users who have performed both purchase and login event

#Intermediate ds :
{user_id:{'puchase_count':0,'login_count':0}}

#Final ds:
mixed_activity_users = []

#Problem 10

#Return a list of users who have atleast 5 events and were atleast active on 2 unique days

#Intermediate ds
{user_id:{'events':[],date_count:0}}

#Final ds:
consistent_users = []

Problem 15: Loyal Users (≥ 4 events)

#Return a list of loyal users who have more than 4 events

#Intermediate ds :
{user_id:count_of_appearance}

#Final ds:
loyal_users = []

#Problem 16:

#Return a list of successful and active users

#Intermediate ds : 
{user_id:{'successful_count':0,'total_transactions':0}}

#Final ds:
sucsessful_active_users = []

#Problem 17:

#Return list of users whose average transactions are more than equal to 250

#Intermediate ds :
{user_id:[amount_list]}

#Final ds:
high_average_buyers = []

#Problem 18:
Return users who were active on at least 2 different days

#Intermediate ds :
{'user_id':unique_days_count}

#Final ds :
multi_day_active_users = []

Problem 19: Purchase-Only Users

#Return a list of users who has done only purchases no logins no logouts

#Intermediate ds :
{'user_id':{'purchase_count':0,'total_event_count':0}}

#Final ds:
purchase_only_users = []


Problem 20: One-Time Users

#Return a list of users who have performed event only one time

#Intermediate ds:
{user_id:count_of_events}

#Final ds:
one_time_users = []


