events = [
    {"user_id": 1, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 1, "event": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-02"},
    {"user_id": 3, "event": "login", "timestamp": "2024-01-05"},
]


"""
Identify **active users** based on the following business rules:

A user is considered **active** if:
1. The user has performed **at least two events**, and
2. **At least one of those events is NOT a "login"** event
"""

active_users_list = []

user_actions_dict = {}

for event in events:

    user_id = event['user_id']
    event = event['event']
    # timestamp = str(event['timestamp'])

    if user_id not in user_actions_dict:
        user_actions_dict[user_id] = []
    
    user_actions_dict[user_id].append(event)

print(user_actions_dict)

for user_id, events in user_actions_dict.items():
    non_login_events = [x for x in events if x!= 'login']
    #atleast 2 events
    if len(events) >= 2 :
        if len(non_login_events) >= 1:
            active_users_list.append(user_id)

print(active_users_list)

transactions = [
    {"user_id": 1, "amount": 200, "status": "SUCCESS"},
    {"user_id": 1, "amount": 150, "status": "FAILED"},
    {"user_id": 1, "amount": 300, "status": "SUCCESS"},
    {"user_id": 2, "amount": 100, "status": "FAILED"},
    {"user_id": 2, "amount": 120, "status": "FAILED"},
    {"user_id": 3, "amount": 500, "status": "SUCCESS"},
]

"""
Identify **valuable users** based on the following business rules:

A user is considered **valuable** if:
1. The user has performed **at least two successful transactions**, and
2. The **total amount of successful transactions is greater than or equal to 400**
"""

valuable_users = []

successful_user_amounts_dict = {}

for transaction in transactions:
    user_id = transaction['user_id']
    amount = transaction['amount']
    status = transaction['status']

    if user_id not in successful_user_amounts_dict and status == 'SUCCESS':
        successful_user_amounts_dict[user_id] = []
    
    if status == 'SUCCESS':
        successful_user_amounts_dict[user_id].append(amount)

for user_id, amounts in successful_user_amounts_dict.items():
    summed_amount = sum(amounts)
    if summed_amount >= 400:
        valuable_users.append(user_id)

print(valuable_users)

"""
Identify **engaged users** based on the following business rules:

A user is considered **engaged** if:
1. The user has performed **at least two sessions**, and
2. The **average session duration** for the user is **greater than or equal to 15 minutes**
"""

sessions = [
    {"user_id": 1, "session_date": "2024-01-01", "duration_minutes": 25},
    {"user_id": 1, "session_date": "2024-01-02", "duration_minutes": 25},
    {"user_id": 1, "session_date": "2024-01-03", "duration_minutes": 10},
    {"user_id": 2, "session_date": "2024-01-01", "duration_minutes": 2},
    {"user_id": 2, "session_date": "2024-01-02", "duration_minutes": 3},
    {"user_id": 3, "session_date": "2024-01-05", "duration_minutes": 40},
]

engaged_users = []

user_engagement_duration_dict = {}

for session in sessions:
    user_id = session['user_id']
    session_date = session['session_date']
    duration_minutes = session['duration_minutes']

    if user_id not in user_engagement_duration_dict:
        user_engagement_duration_dict[user_id] = []
    
    user_engagement_duration_dict[user_id].append(duration_minutes)

for user_id, duration_minutes in user_engagement_duration_dict.items():
    average_duration = sum(duration_minutes) / len(duration_minutes)
 
    if len(duration_minutes) >= 2:
        if int(average_duration) >= 15:
            engaged_users.append(user_id)

print(engaged_users)

interactions = [
    {"user_id": 1, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 1, "action": "click", "timestamp": "2024-01-02"},
    {"user_id": 1, "action": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 2, "action": "click", "timestamp": "2024-01-01"},
    {"user_id": 3, "action": "purchase", "timestamp": "2024-01-05"},
]

"""
## Objective

Identify **power users** based on the following business rules:

A user is considered a **power user** if:
1. The user has performed actions on **at least 3 distinct days**, and
2. The user has performed **at least one "purchase" action**
"""

power_users = []
user_purchase_unique_days = {}
timestamp_seen = []

for interaction in interactions:
    user_id = interaction['user_id']
    action = interaction['action']
    timestamp = interaction['timestamp']

    if user_id not in user_purchase_unique_days:
        user_purchase_unique_days[user_id] = {'action':[],'timestamp_count':0}
    
    if action == 'purchase':
        user_purchase_unique_days[user_id]['action'].append(action)
    if timestamp not in timestamp_seen:
        user_purchase_unique_days[user_id]['timestamp_count'] += 1
print(user_purchase_unique_days)

for user_id,value in user_purchase_unique_days.items():
    action = value['action']
    purchase_action_count = len(action)
    timestamp_count = value['timestamp_count']

    if timestamp_count >=3 and purchase_action_count >= 1:
        power_users.append(user_id)

print(power_users)

l = [2,3,4,10,1,5,5,3,5]
max = l[0]
for x in l:
    if x > max:
        max = x
    
print(max)

min = l[0]
for x in l:
    if x < min:
        min = x

print(min)

#most repeated number
num_count_dict = {}

for x in l:
    if x not in num_count_dict:
        num_count_dict[x] = 1
    else:
        num_count_dict[x] += 1

max_num = list(num_count_dict.keys())[0]
max_num_fig = next(iter(num_count_dict)) # to get the first key of the dictionary
print("First key of the dictionary",max_num_fig)
print(f"First element of the dict :{max_num}")
for x,y in num_count_dict.items():

    if y > max_num:
        max_num_fig = x

print(f"The most num fig that appeared : {max_num_fig}")

    

