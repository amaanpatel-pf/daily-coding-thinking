sessions = [
    {"user_id": 1, "duration": 10},
    {"user_id": 1, "duration": 30},
    {"user_id": 1, "duration": 20},
    {"user_id": 2, "duration": 5},
    {"user_id": 2, "duration": 10},
    {"user_id": 3, "duration": 40},
    {"user_id": 3, "duration": 30},
]

user_duration_dict = {}

engaged_users = []

for session in sessions:
    user_id = session['user_id']
    duration = session['duration']

    if user_id not in user_duration_dict:
        user_duration_dict[user_id] = []
    
    user_duration_dict[user_id].append(duration)

for user_id, duration in user_duration_dict.items():
    summed_duration = sum(duration)

    if summed_duration >= 20:
        engaged_users.append(user_id)
    
print(engaged_users)

events = [
    {"user_id": 1, "date": "2024-01-01"},
    {"user_id": 1, "date": "2024-01-02"},
    {"user_id": 1, "date": "2024-01-03"},
    {"user_id": 2, "date": "2024-01-01"},
    {"user_id": 2, "date": "2024-01-01"},
    {"user_id": 3, "date": "2024-01-05"},
    {"user_id": 3, "date": "2024-01-06"},
]

user_event_dict = {}

frequent_users = []

date_list = []

for event in events:
    user_id = event['user_id']
    date = event['date']

    if user_id not in user_event_dict:
        user_event_dict[user_id] = {'date_count':0}
    
    if date not in date_list:
        user_event_dict[user_id]['date_count'] += 1

for user_id, date_count in user_event_dict.items():
    date_counter = date_count['date_count']
    print(date_counter)
    if date_counter >= 3:
        frequent_users.append(user_id)

print(frequent_users)

#Problem 6

events = [
    {"user_id": 1, "event": "login", "date": "2024-01-01"},
    {"user_id": 1, "event": "purchase", "date": "2024-01-02"},
    {"user_id": 1, "event": "logout", "date": "2024-01-03"},
    {"user_id": 2, "event": "login", "date": "2024-01-01"},
    {"user_id": 2, "event": "purchase", "date": "2024-01-01"},
    {"user_id": 3, "event": "purchase", "date": "2024-01-05"},
]

user_action_timestamp_dict = {}

power_users = []

date_count = []

for event in events:
    user_id = event["user_id"]
    action = event["event"]
    date = event["date"]

    if user_id not in user_action_timestamp_dict:
        user_action_timestamp_dict[user_id] = {'action':[],'datecount':0}
    
    if action == 'purchase':
        user_action_timestamp_dict[user_id]['action'].append(action)
    
    if date not in date_count:
        user_action_timestamp_dict[user_id]['datecount'] += 1
    
for user_id, value in user_action_timestamp_dict.items():
    purchase_count = len(value['action'])
    date_count = value['datecount']

    if purchase_count >=1 and date_count >=3 :
        power_users.append(user_id)

print(power_users)
    
#Problem 7
all_users = [1, 2, 3, 4, 5]

events = [
    {"user_id": 1},
    {"user_id": 2},
    {"user_id": 2},
    {"user_id": 3},
]

user_event_dict = {}

inactive_users = []

for user in all_users:

    if user not in user_event_dict:
        user_event_dict[user] = 0

        for event in events:
            user_id = event['user_id']

            if user == user_id:
                user_event_dict[user] += 1

for user, user_event in user_event_dict.items():
    if user_event == 0:
        inactive_users.append(user)

print(inactive_users)

#Problem 8
events = [
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "login"},
    {"user_id": 2, "event": "login"},
    {"user_id": 2, "event": "login"},
]

user_event_dict = {}

active_users = []

for event in events:
    user_id = event['user_id']
    action = event['event']

    if user_id not in user_event_dict:
        user_event_dict[user_id] = []

    if action == 'login':
        user_event_dict[user_id].append(action)

for user_id, action in user_event_dict.items():

    if len(action) >= 5:
        active_users.append(user_id)
print(active_users)

#Problem 9
events = [
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "purchase"},
    {"user_id": 2, "event": "login"},
    {"user_id": 2, "event": "logout"},
    {"user_id": 3, "event": "purchase"},
]

user_event_dict = {}

mixed_users = []

for event in events:
    user_id = event['user_id']
    action = event['event']

    if user_id not in user_event_dict:
        user_event_dict[user_id] = {'purchase_count':0,'login_count':0}

    if action == 'login':
        user_event_dict[user_id]['login_count'] += 1
    
    if action == 'purchase':
        user_event_dict[user_id]['purchase_count'] += 1

for user_id, value in user_event_dict.items():
    login_count = value['login_count']
    purchase_count = value['purchase_count']

    if login_count >= 1 and purchase_count >= 1:
        mixed_users.append(user_id)

print(mixed_users)
   
events = [
    {"user_id": 1, "date": "2024-01-01"},
    {"user_id": 1, "date": "2024-01-01"},
    {"user_id": 1, "date": "2024-01-02"},
    {"user_id": 1, "date": "2024-01-02"},
    {"user_id": 1, "date": "2024-01-03"},
    {"user_id": 2, "date": "2024-01-01"},
    {"user_id": 2, "date": "2024-01-02"},
]

user_event_date_dict = {}

consistent_users = []

date_list = []

for event in events:
    user_id = event['user_id']
    date = event['date']
    event_id = user_id

    if user_id not in user_event_date_dict:
        user_event_date_dict[user_id] = {'events':[],'date_count':0}
    
    if date not in date_list:
        user_event_date_dict[user_id]['date_count'] += 1
    
    user_event_date_dict[user_id]['events'].append(event_id)

for user_id, value in user_event_date_dict.items():
    events_count = len(value['events'])
    date_count = value['date_count']

    if events_count >= 5 and date_count >= 2:
        consistent_users.append(user_id)
print('consistent users :',consistent_users)