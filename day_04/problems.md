# Day 04 – Power User Identification

## Problem Statement

You are given a list of user interaction records.  
Each record represents a single action performed by a user on a platform.

Each interaction contains:
- `user_id`: Unique identifier of the user
- `action`: Type of action performed (e.g., view, click, purchase)
- `timestamp`: Date of the interaction

## Objective

Identify **power users** based on the following business rules:

A user is considered a **power user** if:
1. The user has performed actions on **at least 3 distinct days**, and
2. The user has performed **at least one "purchase" action**

## Input Example

```python
interactions = [
    {"user_id": 1, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 1, "action": "click", "timestamp": "2024-01-02"},
    {"user_id": 1, "action": "purchase", "timestamp": "2024-01-03"},
    {"user_id": 2, "action": "view", "timestamp": "2024-01-01"},
    {"user_id": 2, "action": "click", "timestamp": "2024-01-01"},
    {"user_id": 3, "action": "purchase", "timestamp": "2024-01-05"},
]
