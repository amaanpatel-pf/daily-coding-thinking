# Day 03 – Engaged User Identification

## Problem Statement

You are given a list of user session records.  
Each record represents a single session performed by a user on a platform.

Each session contains:
- `user_id`: Unique identifier of the user
- `session_date`: Date of the session
- `duration_minutes`: Duration of the session in minutes

## Objective

Identify **engaged users** based on the following business rules:

A user is considered **engaged** if:
1. The user has performed **at least two sessions**, and
2. The **average session duration** for the user is **greater than or equal to 15 minutes**

## Input Example

```python
sessions = [
    {"user_id": 1, "session_date": "2024-01-01", "duration_minutes": 5},
    {"user_id": 1, "session_date": "2024-01-02", "duration_minutes": 25},
    {"user_id": 1, "session_date": "2024-01-03", "duration_minutes": 10},
    {"user_id": 2, "session_date": "2024-01-01", "duration_minutes": 2},
    {"user_id": 2, "session_date": "2024-01-02", "duration_minutes": 3},
    {"user_id": 3, "session_date": "2024-01-05", "duration_minutes": 40},
]
