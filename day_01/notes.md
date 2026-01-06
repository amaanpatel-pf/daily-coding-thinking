# Day 01 – Notes

## How I Thought About the Problem

The output needed to be a list of user IDs, so returning a list was sufficient.

I first thought of grouping events by `user_id` because all the conditions are user-level
conditions and cannot be checked at individual event level.

Once users are grouped, I planned to apply two conditions:
1. The user should have performed at least two events.
2. If a user has exactly two events (or more), then all of them should not be just "login".
   At least one event should be something other than login.

## Approach

- Iterate over the events list.
- Group events by `user_id`.
- For each user, keep track of the events they performed.
- After grouping, loop through each user and apply the business conditions.
- If both conditions are satisfied, add the user to the final list.

## Edge Cases Considered

- Users with only one event.
- Users with multiple events but all events are "login".
- Skipping records where `user_id` is null.

## Time Complexity

- O(n), where n is the number of events.
- Each event is processed once for grouping.

## Learning

- Grouping data first makes applying business rules much simpler.
- Trying to handle counting and conditions inside the same loop makes the logic messy.
- Separating aggregation and filtering improves clarity.
