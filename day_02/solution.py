transactions = [
    {"user_id": 1, "amount": 200, "status": "SUCCESS"},
    {"user_id": 1, "amount": 150, "status": "FAILED"},
    {"user_id": 1, "amount": 300, "status": "SUCCESS"},
    {"user_id": 2, "amount": 100, "status": "FAILED"},
    {"user_id": 2, "amount": 120, "status": "FAILED"},
    {"user_id": 3, "amount": 500, "status": "SUCCESS"},
]

user_amount_dict = {}

#Day 02 Soln 1

for transaction in transactions:

    user_id = transaction['user_id']
    status = transaction['status']
    amount = transaction['amount']

    if user_id is None:
        continue

    if user_id not in user_amount_dict and status == 'SUCCESS':
        #Only taking the user_id where the status is successful
        user_amount_dict[user_id] = []
    
    if user_id in user_amount_dict and status == 'SUCCESS':
        user_amount_dict[user_id].append(amount)
    
print(user_amount_dict)

user_amount_sum_dict = {}
#filering out as per business logic
#return valuable user list where the amount of the successful transaction is more than or equal to 400
valuable_users_list = []

for user_id,amounts in user_amount_dict.items():

    for amount in amounts:
        print(amount)
        user_amount_sum_dict[user_id] = amount

print(user_amount_sum_dict)

