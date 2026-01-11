interactions = [
    {"user_id": 1, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 1, "action": "click", "timestamp": "2024-01-02"},
    {"user_id": 1, "action": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 2, "action": "click", "timestamp": "2024-01-01"},
    {"user_id": 3, "action": "purchase", "timestamp": "2024-01-05"},
]

#power_users_list 
power_users_list = []

#unique timestamp list
unique_timestamp = []

#users_purchase_unique_days
users_purchase_unique_days = {}


for interaction in interactions:
    user_id = interaction['user_id']
    action = interaction['action']
    timestamp = interaction['timestamp']
    

    if user_id not in users_purchase_unique_days:
        count = 0
        timestamp_count = 0
        users_purchase_unique_days[user_id] = {'purchase':0,'unique_days':[],'count':0}
    
    if action == 'purchase':
        users_purchase_unique_days[user_id]['purchase'] += 1


    if timestamp not in users_purchase_unique_days[user_id]['unique_days']:
        users_purchase_unique_days[user_id]['unique_days'].append(timestamp)



#Checking the distinct dates count
for key, value in users_purchase_unique_days.items():
    user_id = key
    timestamps = value['unique_days']
    for timestamp in timestamps:
        if timestamp not in unique_timestamp:
           users_purchase_unique_days[user_id]['count'] += 1
          
    # if not users_purchase_unique_days[user_id]['timestamp']:
    #     unique_timestamp.append(timestamp)
    #     users_purchase_unique_days[user_id] = {'timestamp':len(unique_timestamp)}

#Business filter logic
for key,value in users_purchase_unique_days.items():
    user_id = key
    purchase_count = value['purchase']
    timestamp_count = value['count']

    if purchase_count >= 1 and timestamp_count >= 3:
        power_users_list.append(user_id)

    
print("Power users list :",power_users_list)

    