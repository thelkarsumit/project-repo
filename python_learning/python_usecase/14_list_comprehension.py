# Python Comprehensive Guide: Covering Basics to Advanced Concepts
# Author: Sumit Thelkar
# This file includes explanations, examples, and outputs for key Python concepts.

# 1. Basic Data Types and Variables
# Explanation: Python supports various data types like int, float, str, list, tuple, dict, set, etc.
a = 10  # int
b = 20.5  # float
c = "Hello, Python!"  # str
print(f"Data Types: {type(a)}, {type(b)}, {type(c)}")
# Output: Data Types: <class 'int'>, <class 'float'>, <class 'str'>

# 2. String Manipulation
# Explanation: Common string operations like slicing and methods.
s = "Python Programming"
print(s.lower())  # Convert to lowercase
print(s.upper())  # Convert to uppercase
print(s[0:6])  # Slicing (substring)
# Output:
# python programming
# PYTHON PROGRAMMING
# Python

# 3. List Operations
# Explanation: Lists are mutable, and we can perform multiple operations.
my_list = [1, 2, 3, 4, 5]
my_list.append(6)  # Add an element
my_list.pop(2)  # Remove an element at index 2
print(my_list)
# Output: [1, 2, 4, 5, 6]

# 4. List Comprehensions
# Explanation: Simplify loop-based list creation.
squared = [x**2 for x in range(1, 6)]
print(squared)
# Output: [1, 4, 9, 16, 25]

# 5. Conditional Statements
# Explanation: Use `if`, `elif`, and `else` to make decisions.
num = 7
if num % 2 == 0:
    print(f"{num} is even.")
else:
    print(f"{num} is odd.")
# Output: 7 is odd.

# 6. Loops
# Explanation: Demonstrating `for` and `while` loops.
# For loop example
for i in range(1, 4):
    print(f"For loop iteration: {i}")
# Output: 
# For loop iteration: 1
# For loop iteration: 2
# For loop iteration: 3

# While loop example
count = 1
while count <= 3:
    print(f"While loop iteration: {count}")
    count += 1
# Output:
# While loop iteration: 1
# While loop iteration: 2
# While loop iteration: 3

# 7. Functions
# Explanation: Define reusable code blocks.
def add(a, b):
    """Function to add two numbers"""
    return a + b

result = add(10, 20)
print(f"Function result: {result}")
# Output: Function result: 30

# 8. Dictionary Comprehension
# Explanation: Create dictionaries concisely.
square_dict = {x: x**2 for x in range(1, 4)}
print(square_dict)
# Output: {1: 1, 2: 4, 3: 9}

# 9. Exception Handling
# Explanation: Handle runtime errors gracefully.
try:
    print(10 / 0)
except ZeroDivisionError as e:
    print(f"Error: {e}")
# Output: Error: division by zero

# 10. Classes and Objects
# Explanation: Demonstrating object-oriented programming basics.
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

person = Person("Alice", 30)
print(person.greet())
# Output: Hello, my name is Alice and I am 30 years old.

# 11. File Handling
# Explanation: Reading from and writing to a file.
with open("example.txt", "w") as file:
    file.write("This is a sample file.")

with open("example.txt", "r") as file:
    content = file.read()
    print(content)
# Output: This is a sample file.

# 12. List Comprehension with Conditionals
# Explanation: Using conditionals within comprehensions.
even_numbers = [x for x in range(10) if x % 2 == 0]
print(even_numbers)
# Output: [0, 2, 4, 6, 8]

# 13. Lambda and Map
# Explanation: Lambda functions are anonymous functions.
double = lambda x: x * 2
doubled_numbers = list(map(double, [1, 2, 3, 4]))
print(doubled_numbers)
# Output: [2, 4, 6, 8]

# 14. Working with JSON
# Explanation: Parsing JSON data.
import json
data = '{"name": "John", "age": 30}'
parsed_data = json.loads(data)
print(parsed_data)
# Output: {'name': 'John', 'age': 30}

# 15. Final Note
# This file showcases Python's power and versatility, with clear explanations and examples. Keep practicing!
