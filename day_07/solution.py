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

events = [
    {"user_id": 1}, {"user_id": 1}, {"user_id": 1}, {"user_id": 1},
    {"user_id": 2}, {"user_id": 2},
    {"user_id": 3}, {"user_id": 3}, {"user_id": 3},
]

user_events_dict = {}

loyal_users = []

for event in events:

    user_id = event['user_id']
    
    if user_id not in user_events_dict:
        user_events_dict[user_id] = 0 
    
    user_events_dict[user_id] += 1

for user_id, count_of_events in user_events_dict.items():

    if count_of_events >= 4:
        loyal_users.append(user_id)

print('Loyal users:',loyal_users)

#Problem 16
transactions = [
    {"user_id": 1, "status": "SUCCESS"},
    {"user_id": 1, "status": "SUCCESS"},
    {"user_id": 1, "status": "FAILED"},
    {"user_id": 2, "status": "SUCCESS"},
    {"user_id": 2, "status": "FAILED"},
    {"user_id": 3, "status": "SUCCESS"},
]

user_status_transactions_dict = {}

successful_active_users = []

for transaction in transactions:
    user_id = transaction['user_id']
    status = transaction['status']

    if user_id not in user_status_transactions_dict:
        user_status_transactions_dict[user_id] = {'successful_count':0,'total_transactions':0}
    
    if status == 'SUCCESS':
        user_status_transactions_dict[user_id]['successful_count'] += 1
    
    user_status_transactions_dict[user_id]['total_transactions'] += 1

for user_id, value in user_status_transactions_dict.items():

    success_count = value['successful_count']
    total_transactions_count = value['total_transactions']

    if success_count >=2 and total_transactions_count >=3:
        successful_active_users.append(user_id)

print("SUCCESSFUL Active Users: ", successful_active_users)

transactions = [
    {"user_id": 1, "amount": 200},
    {"user_id": 1, "amount": 300},
    {"user_id": 2, "amount": 100},
    {"user_id": 2, "amount": 150},
    {"user_id": 3, "amount": 400},
    {"user_id": 3, "amount": 500},
]
user_amount_dict = {}

high_average_buyers = []

for transaction in transactions:
    user_id = transaction['user_id']
    amount = transaction['amount']

    if user_id not in user_amount_dict:
        user_amount_dict[user_id] = []
    
    user_amount_dict[user_id].append(amount)

for user_id,amounts in user_amount_dict.items():
    average_transaction = sum(amounts) / len(amounts)

    if average_transaction >= 250:
        high_average_buyers.append(user_id)

print('High average buyers',high_average_buyers)

#Problem 18:
events = [
    {"user_id": 1, "date": "2024-01-01"},
    {"user_id": 1, "date": "2024-01-01"},
    {"user_id": 1, "date": "2024-01-02"},
    {"user_id": 2, "date": "2024-01-01"},
    {"user_id": 2, "date": "2024-01-02"},
    {"user_id": 2, "date": "2024-01-03"},
    {"user_id": 3, "date": "2024-01-03"},
]

user_date_dict = {}

date_seen = []

multi_day_active_users = []



for event in events:
    user_id = event['user_id']
    date = event['date']

    if user_id not in user_date_dict:
        user_date_dict[user_id] = {'total_events':0,'dates':[]}
        
    
    if date not in user_date_dict[user_id]['dates']:
        user_date_dict[user_id]['dates'].append(date)

    user_date_dict[user_id]['total_events']  += 1

for user_id, value in user_date_dict.items():

    total_events_count = value['total_events']
    unique_date_count = len(value['dates'])

    if unique_date_count >= 2 and total_events_count >= 3:
        multi_day_active_users.append(user_id)
print("Multi day active users:",multi_day_active_users)

events = [
    {"user_id": 1, "event": "purchase"},
    {"user_id": 1, "event": "purchase"},
    {"user_id": 2, "event": "login"},
    {"user_id": 2, "event": "purchase"},
    {"user_id": 3, "event": "purchase"},
]

user_purchase_event_dict = {}

purchase_only_users = []

for event in events:
    user_id = event['user_id']
    event = event['event']

    if user_id not in user_purchase_event_dict:
        user_purchase_event_dict[user_id] = {'purchase_count':0,'total_event_count':0}
    
    if event == 'purchase':
        user_purchase_event_dict[user_id]['purchase_count'] += 1
    
    user_purchase_event_dict[user_id]['total_event_count'] += 1

for user_id, value in user_purchase_event_dict.items():
    purchase_count = value['purchase_count']
    total_event_count = value['total_event_count']

    if purchase_count == total_event_count:
        purchase_only_users.append(user_id)

print("Purchase only users:",purchase_only_users)

#Problem 20
events = [
    {"user_id": 1},
    {"user_id": 1},
    {"user_id": 2},
    {"user_id": 3},
    {"user_id": 3},
]

user_count_dict = {}
one_time_users = []

for event in events:
    user_id = event['user_id']
    
    if user_id not in user_count_dict:
        user_count_dict[user_id] = 0
    
    user_count_dict[user_id] += 1

for user_id, count in user_count_dict.items():
    total_user_event_count = count
    if total_user_event_count == 1:
        one_time_users.append(user_id)

print('One time users:',one_time_users)

