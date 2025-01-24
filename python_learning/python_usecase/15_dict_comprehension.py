# 1. Dictionary Comprehension
# Create a dictionary using comprehension where keys are numbers from 1 to 5 
# and values are their squares.
squares = {x: x**2 for x in range(1, 6)}
print("# Dictionary Comprehension Example")
print(squares)
# Output: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# ----------------------------------------------

# 2. String Manipulation
# Demonstrate basic string operations
my_string = "  Hello, Python!  "
print("\n# String Manipulation")
print("Original String:", my_string)
print("Stripped:", my_string.strip())  # Removes whitespace
print("Uppercase:", my_string.upper())  # Converts to uppercase
print("Split:", my_string.split(","))  # Splits the string by comma
# Output:
# Original String:   Hello, Python!
# Stripped: Hello, Python!
# Uppercase:   HELLO, PYTHON!  
# Split: ['  Hello', ' Python!  ']

# ----------------------------------------------

# 3. List Comprehension
# Create a list of even numbers from 1 to 10 using list comprehension.
even_numbers = [x for x in range(1, 11) if x % 2 == 0]
print("\n# List Comprehension")
print(even_numbers)
# Output: [2, 4, 6, 8, 10]

# ----------------------------------------------

# 4. Loop Examples (For and While)
print("\n# Loop Examples")
# Using a for loop to iterate over a list
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print("For Loop:", fruit)

# Using a while loop to print numbers from 1 to 5
n = 1
while n <= 5:
    print("While Loop:", n)
    n += 1

# Output:
# For Loop: apple
# For Loop: banana
# For Loop: cherry
# While Loop: 1
# While Loop: 2
# While Loop: 3
# While Loop: 4
# While Loop: 5

# ----------------------------------------------

# 5. Functions
# Demonstrate functions with parameters, default arguments, and return values.
def greet(name="User"):
    """Returns a greeting message."""
    return f"Hello, {name}!"

print("\n# Functions")
print(greet())  # Using the default argument
print(greet("Alice"))  # Providing a custom name
# Output:
# Hello, User!
# Hello, Alice!

# ----------------------------------------------

# 6. File Handling
# Write to a file and read from it.
print("\n# File Handling")
file_name = "sample.txt"
with open(file_name, "w") as file:
    file.write("This is a sample file.\nLearning Python is fun!")

# Reading the file
with open(file_name, "r") as file:
    content = file.read()
    print("File Content:\n", content)
# Output:
# File Content:
# This is a sample file.
# Learning Python is fun!

# ----------------------------------------------

# 7. Exception Handling
# Handling errors using try-except blocks
print("\n# Exception Handling")
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print("Caught an error:", e)
finally:
    print("Execution Completed.")
# Output:
# Caught an error: division by zero
# Execution Completed.

# ----------------------------------------------

# 8. OOP Concepts: Classes and Objects
class Animal:
    """A simple Animal class."""
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} makes a sound."

class Dog(Animal):
    """Dog inherits from Animal."""
    def speak(self):
        return f"{self.name} barks."

# Creating objects
print("\n# OOP Concepts")
animal = Animal("Generic Animal")
dog = Dog("Buddy")

print(animal.speak())
print(dog.speak())
# Output:
# Generic Animal makes a sound.
# Buddy barks.

# ----------------------------------------------

# 9. Generators
# Demonstrate the use of generators with `yield`.
def fibonacci(n):
    """Generator for Fibonacci sequence."""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

print("\n# Generators")
print("Fibonacci Sequence:", list(fibonacci(5)))
# Output: Fibonacci Sequence: [0, 1, 1, 2, 3]

# ----------------------------------------------

# 10. JSON Operations
import json

print("\n# JSON Operations")
data = {"name": "Alice", "age": 25, "city": "Wonderland"}
json_data = json.dumps(data)  # Convert Python dictionary to JSON
print("JSON String:", json_data)

python_data = json.loads(json_data)  # Convert JSON back to Python dictionary
print("Python Data:", python_data)
# Output:
# JSON String: {"name": "Alice", "age": 25, "city": "Wonderland"}
# Python Data: {'name': 'Alice', 'age': 25, 'city': 'Wonderland'}

# ----------------------------------------------

# 11. Decorators
# Demonstrate function decorators
def logger(func):
    """A decorator to log function calls."""
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with arguments {args} and {kwargs}")
        result = func(*args, **kwargs)
        print(f"{func.__name__} returned {result}")
        return result
    return wrapper

@logger
def add(a, b):
    return a + b

print("\n# Decorators")
print("Result:", add(3, 5))
# Output:
# Calling add with arguments (3, 5) and {}
# add returned 8
# Result: 8
