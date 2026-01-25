Problem 4: Engaged Users (Average Condition)

Statement:
You are given session records with user_id and session_duration (minutes).
Return users whose average session duration ≥ 20 minutes.

Problem 5: Frequent Visitors (Unique Days)

Statement:
You are given user events with user_id and date.
Return users who were active on at least 3 distinct days.

Problem 6: Power Users (Multi-Condition)

Statement:
You are given events with user_id, event_type, and date.
Return users who:

Have at least 1 "purchase" event

Were active on at least 3 unique days

Pattern: group → set + flag → multi-condition

Problem 7: Inactive Users

Statement:
You are given a list of all users and a list of events.
Return users who have 0 events.

Pattern: reference list → missing keys

Problem 8: Heavy Login Users

Statement:
You are given login events with user_id and event_type.
Return users who have performed more than 5 logins.

Pattern: group → conditional count

Problem 9: Mixed Activity Users

Statement:
You are given events with user_id and event_type.
Return users who have performed both "login" and "purchase" events.

Pattern: group → set → membership check

Problem 10: Consistent Users (Count + Unique)

Statement:
You are given events with user_id and date.
Return users who:

Have at least 5 total events

Were active on at least 2 unique days

Pattern: group → count + set → multi-condition

Problem 15: Loyal Users (≥ 4 events)

Statement:
You are given a list of user events with user_id.
Return users who have performed at least 4 events in total.

Problem 16: Successful & Active Users

Statement:
Return users who have:

≥ 2 SUCCESS transactions

≥ 3 total transactions

Problem 17: High Average Buyers

Statement:
Given transactions with user_id and amount,
return users whose average transaction amount ≥ 250.

Problem 18: Multi-Day Active Users

Statement:
Return users who were active on at least 2 different days
and performed at least 3 events.

Problem 19: Purchase-Only Users

Statement:
Return users who have performed only "purchase" events
(no login, no logout).

Problem 20: One-Time Users

Statement:
Return users who have performed exactly 1 event.