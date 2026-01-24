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

#Return a list of users which has performed atleast 3 events in total

intermediate_ds :
{user_id:["login","click"]}

final ds :
cleaned_users = []

Problem 2 breakdown :

#Return users with atleast 2 sucessful transactions

intermediate_ds:
{user_id:['SUCCESS','FAILURUE']}

final ds:
successful_users = []

#Return list of users whose total success amoutn >= 500

intermediate_ds:
{user_id:[success_amount1,success_amountn]}