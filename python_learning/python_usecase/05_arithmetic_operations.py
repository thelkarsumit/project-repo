# 05_arithmetic_operations.py
# This script demonstrates basic arithmetic operations in Python.
# Operations covered: Addition, Subtraction, Multiplication, Division, Modulus, and Exponentiation.

# Addition: Adds two numbers
num1 = 10
num2 = 5
addition_result = num1 + num2
# Output: 10 + 5 = 15
print(f"Addition: {num1} + {num2} = {addition_result}")  # Output: 15

# Subtraction: Subtracts one number from another
subtraction_result = num1 - num2
# Output: 10 - 5 = 5
print(f"Subtraction: {num1} - {num2} = {subtraction_result}")  # Output: 5

# Multiplication: Multiplies two numbers
multiplication_result = num1 * num2
# Output: 10 * 5 = 50
print(f"Multiplication: {num1} * {num2} = {multiplication_result}")  # Output: 50

# Division: Divides one number by another (returns float)
division_result = num1 / num2
# Output: 10 / 5 = 2.0
print(f"Division: {num1} / {num2} = {division_result}")  # Output: 2.0

# Modulus: Returns the remainder when dividing one number by another
modulus_result = num1 % num2
# Output: 10 % 5 = 0 (no remainder)
print(f"Modulus: {num1} % {num2} = {modulus_result}")  # Output: 0

# Exponentiation: Raises the first number to the power of the second number
exponentiation_result = num1 ** num2
# Output: 10 ** 5 = 100000
print(f"Exponentiation: {num1} ** {num2} = {exponentiation_result}")  # Output: 100000

# Order of Operations (PEMDAS): Parentheses, Exponentiation, Multiplication/Division (left to right), Addition/Subtraction (left to right)
order_of_operations_result = (num1 + num2) * num2 ** 2  # First, exponentiation, then addition and multiplication
# Output: (10 + 5) * 5^2 = 15 * 25 = 375
print(f"Order of Operations: ({num1} + {num2}) * {num2}^2 = {order_of_operations_result}")  # Output: 375
