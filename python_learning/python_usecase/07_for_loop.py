# 07_for_loop.py
# This Python file demonstrates the usage of 'for' loops to iterate over various data structures.
# We will explore for loops with lists, tuples, and strings, and show sample outputs.

# ========================== 1. Looping over a List ===========================

# A list is an ordered collection of items. You can loop through all its elements using a 'for' loop.

my_list = [1, 2, 3, 4, 5]  # List of integers
print("Looping through a list:")
for item in my_list:
    print(f"Current item: {item}")
    
# Output:
# Current item: 1
# Current item: 2
# Current item: 3
# Current item: 4
# Current item: 5

# ========================== 2. Looping over a Tuple =========================

# A tuple is similar to a list, but it is immutable. We can iterate over it in the same way as lists.

my_tuple = ("apple", "banana", "cherry")
print("\nLooping through a tuple:")
for fruit in my_tuple:
    print(f"Current fruit: {fruit}")

# Output:
# Current fruit: apple
# Current fruit: banana
# Current fruit: cherry

# ========================== 3. Looping over a String =========================

# Strings are sequences of characters, and we can iterate over them to access each character individually.

my_string = "Python"
print("\nLooping through a string:")
for char in my_string:
    print(f"Current character: {char}")

# Output:
# Current character: P
# Current character: y
# Current character: t
# Current character: h
# Current character: o
# Current character: n

# ========================== 4. Looping with Enumerate ========================

# The 'enumerate' function can be used with loops to get both the index and the value of the items.

print("\nLooping through a list with enumerate:")
for index, value in enumerate(my_list):
    print(f"Index: {index}, Value: {value}")

# Output:
# Index: 0, Value: 1
# Index: 1, Value: 2
# Index: 2, Value: 3
# Index: 3, Value: 4
# Index: 4, Value: 5

# ========================== 5. Looping with Range ============================

# The 'range()' function generates a sequence of numbers, which is useful when you want to loop over a range of numbers.

print("\nLooping with range() to iterate over a range of numbers:")
for i in range(1, 6):  # Starts at 1, ends before 6
    print(f"Current number: {i}")

# Output:
# Current number: 1
# Current number: 2
# Current number: 3
# Current number: 4
# Current number: 5

# ========================== 6. Nested Loops ================================

# You can also use nested loops to iterate over multiple sequences, such as lists of lists or tuples of tuples.

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print("\nLooping through a matrix (nested list):")
for row in matrix:
    for col in row:
        print(f"Element: {col}")

# Output:
# Element: 1
# Element: 2
# Element: 3
# Element: 4
# Element: 5
# Element: 6
# Element: 7
# Element: 8
# Element: 9

# ========================== 7. Looping with Conditional Statements ==========

# You can combine 'for' loops with conditional statements to perform actions based on certain conditions.

print("\nLooping through a list with a conditional statement:")
for number in my_list:
    if number % 2 == 0:  # Check if the number is even
        print(f"{number} is even.")
    else:
        print(f"{number} is odd.")

# Output:
# 1 is odd.
# 2 is even.
# 3 is odd.
# 4 is even.
# 5 is odd.

# ========================== 8. Looping with Continue and Break ===============

# You can use 'continue' to skip an iteration and 'break' to exit the loop entirely.

print("\nLooping with continue and break:")
for number in my_list:
    if number == 3:
        continue  # Skip number 3
    if number == 5:
        break  # Stop the loop when number is 5
    print(f"Number: {number}")

# Output:
# Number: 1
# Number: 2
# Number: 4
