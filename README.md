# Traveling Salesman Problem (TSP)

### What is the Traveling Salesman Problem?

Imagine a salesperson who needs to visit a set of cities:
- Start at a home city.
- Visit every city on the list **exactly once**.
- Return to the starting city.
- Find the **shortest possible total route** (minimizing distance, travel time, or cost).

## A pleasant London day for the time-pressed tourist (TSP edition)

Imagine you’ve landed with just one precious day and a handful of free hours between the must-sees. The Tube is efficient, but the double-decker bus offers a slower, more scenic glide past the city’s landmarks—perfect for a Travelling Salesman-style puzzle where “cities” are famous sights and “cost” is bus travel time in minutes (approximate averages that include a short wait; actual times vary with traffic).

```
TraveTime = [
  [0, 10, 15, 20],  # My Hotel
  [10,  0, 35, 25], # London Eye
  [15, 35,  0, 30], # Tower of London
  [20, 25, 30,  0]  # British Museum
]
```
