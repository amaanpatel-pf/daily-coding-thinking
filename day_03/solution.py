sessions = [
    {"user_id": 1, "session_date": "2024-01-01", "duration_minutes": 20},
    {"user_id": 1, "session_date": "2024-01-02", "duration_minutes": 25},
    {"user_id": 1, "session_date": "2024-01-03", "duration_minutes": 10},
    {"user_id": 2, "session_date": "2024-01-01", "duration_minutes": 2},
    {"user_id": 2, "session_date": "2024-01-02", "duration_minutes": 3},
    {"user_id": 3, "session_date": "2024-01-05", "duration_minutes": 40},
]

#user_id_duration_dict
users_duration_dict = {}

#engaged users list
engaged_users_list = []

for session in sessions:
    user_id = session['user_id']
    duration = session['duration_minutes']

    if user_id not in users_duration_dict:
        users_duration_dict[user_id] = []
    
    users_duration_dict[user_id].append(duration)

print(users_duration_dict)

#Applying the business filter logic
for user_id,duration in users_duration_dict.items():
    #if user has atleast 2 sessions
    if len(duration) >= 2:
       
        #if average duration is greater or equal to 15 minutes
        average_duration = sum(duration) / len(duration)
        # print(sum(duration),len(duration))
        if (average_duration) >= 10:
            engaged_users_list.append(user_id)

print("Engaged users list",engaged_users_list)