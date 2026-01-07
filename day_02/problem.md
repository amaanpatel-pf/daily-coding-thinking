# Day 02 – Valuable User Identification

## Problem Statement

You are given a list of user transaction records.  
Each record represents a single transaction performed by a user.

Each transaction contains:
- `user_id`: Unique identifier of the user
- `amount`: Transaction amount
- `status`: Status of the transaction (`SUCCESS` or `FAILED`)

## Objective

Identify **valuable users** based on the following business rules:

A user is considered **valuable** if:
1. The user has performed **at least two successful transactions**, and
2. The **total amount of successful transactions is greater than or equal to 400**

## Input Example

```python
transactions = [
    {"user_id": 1, "amount": 200, "status": "SUCCESS"},
    {"user_id": 1, "amount": 150, "status": "FAILED"},
    {"user_id": 1, "amount": 300, "status": "SUCCESS"},
    {"user_id": 2, "amount": 100, "status": "FAILED"},
    {"user_id": 2, "amount": 120, "status": "FAILED"},
    {"user_id": 3, "amount": 500, "status": "SUCCESS"},
]
