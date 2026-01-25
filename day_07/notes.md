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
