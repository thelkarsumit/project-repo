# 08_while_loop.py
# Demonstrating the working of while loops with examples where the loop condition varies based on user input

# Task 1: Basic While Loop
# A basic while loop that runs as long as the condition is true. We will count down from 5.
counter = 5
while counter > 0:
    print(f"Counter is: {counter}")
    counter -= 1  # Decrement the counter to prevent infinite loop

# Output:
# Counter is: 5
# Counter is: 4
# Counter is: 3
# Counter is: 2
# Counter is: 1

# Task 2: While loop with user input
# Asking the user to input a number, and the loop will continue until the user enters '0'.
user_input = -1
while user_input != 0:
    user_input = int(input("Enter a number (0 to exit): "))
    print(f"You entered: {user_input}")

# Output (example):
# Enter a number (0 to exit): 5
# You entered: 5
# Enter a number (0 to exit): 3
# You entered: 3
# Enter a number (0 to exit): 0
# You entered: 0

# Task 3: While loop with multiple conditions
# Let's use 'and' to combine multiple conditions in the while loop.
x = 0
y = 10
while x < 5 and y > 0:
    print(f"x is: {x}, y is: {y}")
    x += 1
    y -= 2

# Output:
# x is: 0, y is: 10
# x is: 1, y is: 8
# x is: 2, y is: 6
# x is: 3, y is: 4
# x is: 4, y is: 2

# Task 4: Using a while loop to find divisors of a number
# Let's find all divisors of a number (e.g., 12) using a while loop.
number = 12
divisor = 1
print(f"Divisors of {number}:")
while divisor <= number:
    if number % divisor == 0:
        print(divisor)
    divisor += 1

# Output:
# Divisors of 12:
# 1
# 2
# 3
# 4
# 6
# 12

# Task 5: Using a while loop with break and continue
# In this example, we will demonstrate how 'break' and 'continue' work in a while loop.
count = 0
while count < 10:
    count += 1
    if count == 3:
        print("Skipping 3")
        continue  # Skip printing 3
    if count == 7:
        print("Breaking loop at 7")
        break  # Exit the loop when count is 7
    print(count)

# Output:
# 1
# 2
# Skipping 3
# 4
# 5
# 6
# Breaking loop at 7

# Task 6: Using a while loop with a list (advanced)
# We can iterate through a list using a while loop by manually controlling the index.
fruits = ["apple", "banana", "cherry"]
index = 0
while index < len(fruits):
    print(f"Fruit at index {index}: {fruits[index]}")
    index += 1

# Output:
# Fruit at index 0: apple
# Fruit at index 1: banana
# Fruit at index 2: cherry

# Task 7: Using a while loop for factorial calculation
# Calculate factorial of a number using a while loop.
n = 5
factorial = 1
while n > 0:
    factorial *= n
    n -= 1
print(f"Factorial of 5 is: {factorial}")

# Output:
# Factorial of 5 is: 120

# Task 8: Nested while loops
# Demonstrating nested while loops to print a multiplication table.
row = 1
while row <= 3:
    col = 1
    while col <= 3:
        print(f"{row} x {col} = {row * col}")
        col += 1
    row += 1

# Output:
# 1 x 1 = 1
# 1 x 2 = 2
# 1 x 3 = 3
# 2 x 1 = 2
# 2 x 2 = 4
# 2 x 3 = 6
# 3 x 1 = 3
# 3 x 2 = 6
# 3 x 3 = 9

# Task 9: Using a while loop to reverse a string
# Reverse a string by continuously removing characters from the end.
string = "hello"
reversed_string = ""
while len(string) > 0:
    reversed_string += string[-1]
    string = string[:-1]
print(f"Reversed string is: {reversed_string}")

# Output:
# Reversed string is: olleh

# Task 10: While loop with input validation
# Ask the user to enter a positive number and keep asking until valid input is given.
number = -1
while number <= 0:
    number = int(input("Enter a positive number: "))
print(f"You entered a valid positive number: {number}")

# Output (example):
# Enter a positive number: -5
# Enter a positive number: 10
# You entered a valid positive number: 10

