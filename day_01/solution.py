events = [
    {"user_id": 1, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 1, "event": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-02"},
    {"user_id": 3, "event": "login", "timestamp": "2024-01-05"},
]

user_cleaned_list = [] 
user_event_agg_dict = {} 
count = 0
for event in range(len(events)):
     user_id = events[event['user_id']]
     user_event = events[event['event']]
     user_timestamp = events[event['timestamp']]
     if user_id not in user_event_agg_dict.items():
        count = 1
        user_event_agg_dict[user_id] = {f'{user_event}':count}
     elif user_id is None: #skip the user_id where it is none pass 
         pass
     else:
         if user_event == events[event - 1['event']] :
              #current event is equal to previous event for #same user group 
              user_event_agg_dict[user_id] = {f'{user_event}':[events[event-1] + 1]} 


#list filtering logic :
def cleaned_users(user_event_agg_dict): 
    for k,v in user_event_agg_dict.items(): 
        user_event_count = v['user_event'] 
        
        if user_event_count > 1: 
            user_cleaned_list.append(k)
            
        else:
            pass 
    
    return user_cleaned_list 


user_cleaned_list = cleaned_users(user_event_agg_dict) 
print(user_cleaned_list)