# Traveling Salesman Problem (TSP)

### What is the Traveling Salesman Problem?

Imagine a salesperson who needs to visit a set of cities:
- Start at a home city.
- Visit every city on the list **exactly once**.
- Return to the starting city.
- Find the **shortest possible total route** (minimizing distance, travel time, or cost).
- 
## A pleasant London day for the time-pressed tourist (TSP edition)

Imagine you’ve landed with just one precious day and a handful of free hours between the must-sees. The Tube is efficient, but the double-decker bus offers a slower, more scenic glide past the city’s landmarks—perfect for a Travelling Salesman-style puzzle where “cities” are famous sights and “cost” is bus travel time in minutes (approximate averages that include a short wait; actual times vary with traffic).

```
TravelTime = [
  [0, 12, 21, 10, 22],  # Buckingham Palace
  [12, 0, 18, 8, 20],   # London Eye
  [21, 18, 0, 22, 25],  # Tower of London
  [10, 8, 22, 0, 18],   # Westminster Abbey
  [22, 20, 25, 18, 0]   # British Museum
]
```
