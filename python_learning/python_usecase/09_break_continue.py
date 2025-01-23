# 09_break_continue.py
# Task: Learn how to control loop flow using break and continue statements.
# Explanation:
# - The `break` statement is used to terminate the loop prematurely.
# - The `continue` statement is used to skip the current iteration and continue with the next iteration of the loop.

# Example 1: Using break to exit a loop when a condition is met
# In this example, we will break out of the loop when the number 5 is encountered.

print("Example 1: Using break")
for num in range(1, 11):  # Loop from 1 to 10
    print(f"Checking number: {num}")
    if num == 5:
        print("Number 5 found, exiting loop...")
        break  # Break the loop when num is 5
    print(f"Number {num} is not 5.")
    
# Output:
# Example 1: Using break
# Checking number: 1
# Number 1 is not 5.
# Checking number: 2
# Number 2 is not 5.
# Checking number: 3
# Number 3 is not 5.
# Checking number: 4
# Number 4 is not 5.
# Checking number: 5
# Number 5 found, exiting loop...

# Example 2: Using continue to skip specific iterations
# In this example, we will skip the iteration when the number is even.

print("\nExample 2: Using continue")
for num in range(1, 11):  # Loop from 1 to 10
    if num % 2 == 0:
        print(f"Skipping number {num} as it is even.")
        continue  # Skip this iteration if the number is even
    print(f"Processing number: {num}")
    
# Output:
# Example 2: Using continue
# Processing number: 1
# Skipping number 2 as it is even.
# Processing number: 3
# Skipping number 4 as it is even.
# Processing number: 5
# Skipping number 6 as it is even.
# Processing number: 7
# Skipping number 8 as it is even.
# Processing number: 9
# Skipping number 10 as it is even.

# Example 3: Break in a nested loop
# We can also use break in nested loops to exit out of the inner loop.

print("\nExample 3: Break in a nested loop")
for i in range(1, 4):  # Outer loop
    for j in range(1, 4):  # Inner loop
        print(f"Outer loop: {i}, Inner loop: {j}")
        if j == 2:
            print("Condition met, breaking inner loop.")
            break  # Break the inner loop when j is 2
    print(f"Outer loop iteration {i} completed.\n")

# Output:
# Example 3: Break in a nested loop
# Outer loop: 1, Inner loop: 1
# Outer loop: 1, Inner loop: 2
# Condition met, breaking inner loop.
# Outer loop iteration 1 completed.
#
# Outer loop: 2, Inner loop: 1
# Outer loop: 2, Inner loop: 2
# Condition met, breaking inner loop.
# Outer loop iteration 2 completed.
#
# Outer loop: 3, Inner loop: 1
# Outer loop: 3, Inner loop: 2
# Condition met, breaking inner loop.
# Outer loop iteration 3 completed.

# Example 4: Using continue in a nested loop
# We can also use continue in nested loops to skip iterations in the inner loop.

print("\nExample 4: Using continue in a nested loop")
for i in range(1, 4):  # Outer loop
    for j in range(1, 4):  # Inner loop
        if j == 2:
            print("Condition met, skipping inner loop iteration.")
            continue  # Skip the iteration if j is 2
        print(f"Outer loop: {i}, Inner loop: {j}")

# Output:
# Example 4: Using continue in a nested loop
# Outer loop: 1, Inner loop: 1
# Outer loop: 1, Inner loop: 3
# Outer loop: 2, Inner loop: 1
# Outer loop: 2, Inner loop: 3
# Outer loop: 3, Inner loop: 1
# Outer loop: 3, Inner loop: 3

