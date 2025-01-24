# 17_map_filter.py
# Demonstrating the use of `map()` and `filter()` in Python with detailed explanations and examples.

# Example 1: Using map() to square each number in a list
# map(function, iterable) applies the function to every item in the iterable.

def square(num):
    return num ** 2

numbers = [1, 2, 3, 4, 5]
squared_numbers = list(map(square, numbers))

# Output
print("Original numbers:", numbers)
print("Squared numbers using map():", squared_numbers)

# Output:
# Original numbers: [1, 2, 3, 4, 5]
# Squared numbers using map(): [1, 4, 9, 16, 25]

# Example 2: Using filter() to find even numbers
# filter(function, iterable) returns items for which the function returns True.

def is_even(num):
    return num % 2 == 0

even_numbers = list(filter(is_even, numbers))

# Output
print("Even numbers using filter():", even_numbers)

# Output:
# Even numbers using filter(): [2, 4]

# Example 3: Combining map() and filter()
# Transforming a list of numbers by squaring only the even numbers.

even_squared_numbers = list(map(square, filter(is_even, numbers)))

# Output
print("Squared even numbers using map() and filter():", even_squared_numbers)

# Output:
# Squared even numbers using map() and filter(): [4, 16]

# Example 4: Using lambda functions with map() and filter()
# Lambda functions allow you to write anonymous functions inline.

numbers = [10, 15, 20, 25, 30]
tripled_numbers = list(map(lambda x: x * 3, numbers))
filtered_numbers = list(filter(lambda x: x > 50, tripled_numbers))

# Output
print("Original numbers:", numbers)
print("Numbers tripled using map() and lambda:", tripled_numbers)
print("Numbers greater than 50 after filtering:", filtered_numbers)

# Output:
# Original numbers: [10, 15, 20, 25, 30]
# Numbers tripled using map() and lambda: [30, 45, 60, 75, 90]
# Numbers greater than 50 after filtering: [60, 75, 90]

# Example 5: Using map() with multiple iterables
# map() can take multiple iterables and apply the function to corresponding items.

list1 = [1, 2, 3]
list2 = [4, 5, 6]
summed_numbers = list(map(lambda x, y: x + y, list1, list2))

# Output
print("Summed numbers using map() with multiple iterables:", summed_numbers)

# Output:
# Summed numbers using map() with multiple iterables: [5, 7, 9]

# Example 6: Real-world example with map() and filter()
# Converting a list of strings to uppercase and filtering those that start with 'A'.

names = ["Alice", "Bob", "Anna", "Charlie", "Amanda"]
uppercase_names = list(map(lambda name: name.upper(), names))
filtered_names = list(filter(lambda name: name.startswith('A'), uppercase_names))

# Output
print("Uppercase names using map():", uppercase_names)
print("Names starting with 'A' using filter():", filtered_names)

# Output:
# Uppercase names using map(): ['ALICE', 'BOB', 'ANNA', 'CHARLIE', 'AMANDA']
# Names starting with 'A' using filter(): ['ALICE', 'ANNA', 'AMANDA']
