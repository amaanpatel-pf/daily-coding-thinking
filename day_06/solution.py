events = [
    {"user_id": 1, "event": "login"},
    {"user_id": 1, "event": "click"},
    {"user_id": 1, "event": "logout"},
    {"user_id": 2, "event": "login"},
    {"user_id": 2, "event": "click"},
    {"user_id": 3, "event": "login"},
    {"user_id": 3, "event": "click"},
    {"user_id": 3, "event": "purchase"},
    {"user_id": 3, "event": "logout"},
]

user_event_dict = {}
cleaned_users = []

for event in events:
    user_id = event['user_id']
    event = event['event']

    if user_id is None:
        continue

    if user_id not in user_event_dict:
        user_event_dict[user_id] = []

    user_event_dict[user_id].append(event)

for user_id, events in user_event_dict.items():
    if len(events) >= 3:

        cleaned_users.append(user_id)

print(cleaned_users)

transactions = [
    {"user_id": 1, "status": "SUCCESS"},
    {"user_id": 1, "status": "FAILED"},
    {"user_id": 1, "status": "SUCCESS"},
    {"user_id": 2, "status": "FAILED"},
    {"user_id": 2, "status": "FAILED"},
    {"user_id": 3, "status": "SUCCESS"},
    {"user_id": 3, "status": "SUCCESS"},
]


user_success_status_dict = {}

successful_user = []

for transaction in transactions:
    user_id = transaction['user_id']
    status = transaction['status']

    if user_id not in user_success_status_dict and status == 'SUCCESS':
        user_success_status_dict[user_id] = []

    if status == 'SUCCESS':
        user_success_status_dict[user_id].append(status)

for user_id,statuses in user_success_status_dict.items():
    if len(statuses) >= 2:
        successful_user.append(user_id)
    
print(successful_user)

transactions = [
    {"user_id": 1, "amount": 200, "status": "SUCCESS"},
    {"user_id": 1, "amount": 150, "status": "FAILED"},
    {"user_id": 1, "amount": 300, "status": "SUCCESS"},
    {"user_id": 2, "amount": 100, "status": "SUCCESS"},
    {"user_id": 2, "amount": 400, "status": "SUCCESS"},
    {"user_id": 3, "amount": 500, "status": "FAILED"},
]


high_spender_users = []

user_success_spending_dict = {}

for transaction in transactions:
    user_id = transaction['user_id']
    amount = transaction['amount']
    status = transaction['status']

    if user_id not in user_success_spending_dict and status == 'SUCCESS':
        user_success_spending_dict[user_id] = []
    
    if status == 'SUCCESS':
        user_success_spending_dict[user_id].append(amount)


for user_id,amounts in user_success_spending_dict.items():
    summed_sucess_amount = sum(amounts)

    if summed_sucess_amount >= 500:
        high_spender_users.append(user_id)

print(high_spender_users)




