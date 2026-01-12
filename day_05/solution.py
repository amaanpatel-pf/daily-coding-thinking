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

active_users = []

user_event_dict = {}

for event in events:
    user_id = event['user_id']
    actions = event['event']

    if user_id not in user_event_dict:
        user_event_dict[user_id] = []
    
    user_event_dict[user_id].append(actions)

#business filter logic
for user_id, events in user_event_dict.items():
    non_login_events = [x for x in events if 'login' not in x]
    if len(events) >= 2:
        if len(non_login_events) >= 1:
            active_users.append(user_id)

print(active_users)


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

user_amount_dict = {}

for transaction in transactions:
    user_id = transaction['user_id']
    amount = transaction['amount']

    if user_id not in user_amount_dict:
        user_amount_dict[user_id] = []

    user_amount_dict[user_id].append(amount)

#Applying business filter logic
for user_id, amount in user_amount_dict.items():

    if len(amount) >= 2:

        summed_amount = sum(amount)

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

user_duration_dict = {}

for session in sessions:
    user_id = session['user_id']
    duration = session['duration_minutes']

    if user_id not in user_duration_dict:
        user_duration_dict[user_id] = []
    
    user_duration_dict[user_id].append(duration)

#Applying business filter logic

for user_id, duration in user_duration_dict.items():

    if len(duration) >= 2:
        avg_session = sum(duration) / len(duration)

        if avg_session >= 15:
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

user_action_dict = {}

for interaction in interactions:
    user_id = interaction['user_id']
    action = interaction['action']
    timestamp = interaction['timestamp']
    count = 0

    if user_id not in user_action_dict:
        user_action_dict[user_id] = {'purchase':0,'timestamp':[]}
    
    if action == 'purchase':
        user_action_dict[user_id]['purchase'] += 1
    
    if  timestamp not in user_action_dict[user_id]['timestamp']:
        user_action_dict[user_id]['timestamp'].append(timestamp)

# print(user_action_dict)

#Business filter logic
for key,value in user_action_dict.items():

    user_id = key
    purchase_count = value['purchase']
    timestamp_list = value['timestamp']
    
    if purchase_count >= 1 and len(timestamp_list) >=3:
        power_users.append(user_id)

        
print(power_users)
