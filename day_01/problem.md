# Day 01 – Active User Identification

## Problem Statement

You are given a list of user activity events.  
Each event represents a single action performed by a user at a specific time.

Each event contains:
- `user_id`: Unique identifier of the user
- `event`: Type of action performed (e.g., login, purchase)
- `timestamp`: Date of the event

### Objective

Identify **active users** based on the following business rules:

A user is considered **active** if:
1. The user has performed **at least two events**, and
2. **At least one of those events is NOT a "login"** event

### Input Example

```python
events = [
    {"user_id": 1, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 1, "event": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-01"},
    {"user_id": 2, "event": "login", "timestamp": "2024-01-02"},
    {"user_id": 3, "event": "login", "timestamp": "2024-01-05"},
]
