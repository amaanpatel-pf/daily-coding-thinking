transactions = [
    {"user_id": 1, "amount": 200, "status": "SUCCESS"},
    {"user_id": 1, "amount": 150, "status": "FAILED"},
    {"user_id": 1, "amount": 300, "status": "SUCCESS"},
    {"user_id": 2, "amount": 100, "status": "FAILED"},
    {"user_id": 2, "amount": 120, "status": "FAILED"},
    {"user_id": 3, "amount": 500, "status": "SUCCESS"},
]


"""
A user is considered **valuable** if:
1. The user has performed **at least two successful transactions**, and
2. The **total amount of successful transactions is greater than or equal to 400**
"""

#ds structure for problem
# user_transaction_dict = [{1:{"total_amount":400,"stransactioncount":2}}
user_transaction_dict = {}
valuable_users = []

for transaction in transactions:
    user_id = transaction["user_id"]
    amount = transaction["amount"]
    status = transaction["status"]
    
    if user_id not in user_transaction_dict:
        user_transaction_dict[user_id] = {"total_amount":0,"stransactioncount":0}
    
    if status == 'SUCCESS':
        user_transaction_dict[user_id]["total_amount"] += amount
        user_transaction_dict[user_id]["stransactioncount"] += 1

print(user_transaction_dict)

for key,value in user_transaction_dict.items():
    
    total_amount = value["total_amount"]
    succesfultransactioncount = value["stransactioncount"]
    
    if succesfultransactioncount >= 2 and total_amount >= 400:
        valuable_users.append(key)
print("Valuable users list:",valuable_users)
    
