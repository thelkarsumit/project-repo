# 16_lambda_functions_explained.py
# ================================================
# This script explains lambda functions, their syntax, and their use cases
# with `map()`, `filter()`, and `reduce()`.

# 1. What is a lambda function?
# A lambda function is a small anonymous function defined using the `lambda` keyword.
# Syntax:
# lambda arguments: expression
# Example:
add = lambda x, y: x + y
# The lambda function above takes two arguments, x and y, and returns their sum.

# Using the lambda function
result = add(5, 3)
print(f"Addition using lambda: {result}")  # Output: Addition using lambda: 8

# ==================================================
# 2. Using lambda with `map()`
# `map()` applies a function to all items in an iterable (e.g., list).

# Example: Squaring numbers in a list
numbers = [1, 2, 3, 4, 5]
squared_numbers = list(map(lambda x: x**2, numbers))
print(f"Squared numbers using map: {squared_numbers}")
# Output: Squared numbers using map: [1, 4, 9, 16, 25]

# ==================================================
# 3. Using lambda with `filter()`
# `filter()` filters items from an iterable based on a condition.

# Example: Filter even numbers from a list
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(f"Even numbers using filter: {even_numbers}")
# Output: Even numbers using filter: [2, 4]

# ==================================================
# 4. Using lambda with `reduce()`
# `reduce()` is used to apply a rolling computation to a sequence of items.
# It is part of the `functools` module and needs to be imported.

from functools import reduce

# Example: Calculating the product of all numbers in a list
product = reduce(lambda x, y: x * y, numbers)
print(f"Product of numbers using reduce: {product}")
# Output: Product of numbers using reduce: 120

# ==================================================
# 5. Combining map(), filter(), and reduce()
# Example: Find the sum of squares of even numbers in the list.

even_squares = list(map(lambda x: x**2, filter(lambda x: x % 2 == 0, numbers)))
sum_even_squares = reduce(lambda x, y: x + y, even_squares)
print(f"Sum of squares of even numbers: {sum_even_squares}")
# Output: Sum of squares of even numbers: 20

# ==================================================
# 6. Advanced example: Using lambda for sorting
# Lambda functions can be used as the `key` parameter in the `sorted()` function.

# Example: Sorting a list of tuples based on the second element
tuples = [(1, 3), (4, 1), (2, 5), (3, 2)]
sorted_tuples = sorted(tuples, key=lambda x: x[1])
print(f"Tuples sorted by second element: {sorted_tuples}")
# Output: Tuples sorted by second element: [(4, 1), (3, 2), (1, 3), (2, 5)]

# ==================================================
# 7. Using lambda in list comprehensions
# Example: Categorizing numbers as even or odd in a dictionary

categorized_numbers = [{"number": x, "type": "even" if (lambda y: y % 2 == 0)(x) else "odd"} for x in numbers]
print(f"Categorized numbers: {categorized_numbers}")
# Output: Categorized numbers: [{'number': 1, 'type': 'odd'}, {'number': 2, 'type': 'even'}, ...]

# ==================================================
# Summary:
# 1. Lambda functions are used for small, anonymous operations.
# 2. They can be combined with higher-order functions like map(), filter(), and reduce().
# 3. They are useful in scenarios where a full function definition isn't necessary.
# ==================================================
