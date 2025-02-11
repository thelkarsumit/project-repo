# 02_data_types.py
# This file demonstrates different data types in Python: Integers, Floats, Strings, and Booleans.
# Each data type is explained and examples of usage are provided with relevant comments.

# 1. Integer (int)
# Integers are whole numbers (positive, negative, or zero) without any decimal point.
# Example: 1, -2, 100, 0

# Defining integer variables
x = 10          # Positive integer
y = -14         # Negative integer
z = 0           # Zero

# Printing integer values
print("Integer examples:")
print(x, y, z)  # Output: 10 -5 0
print(type(x))   # Output: <class 'int'>

# 2. Float (float)
# Floats are numbers that have a decimal point.
# Example: 10.5, -3.14, 2.0, 0.5

# Defining float variables
a = 10.5        # Positive float
b = -3.14       # Negative float
c = 2.0         # Float with no fractional part

# Printing float values
print("\nFloat examples:")
print(a, b, c)  # Output: 10.5 -3.14 2.0
print(type(a))   # Output: <class 'float'>

# 3. String (str)
# Strings are sequences of characters enclosed in either single (' ') or double (" ") quotes.
# Strings can include letters, numbers, spaces, and special characters.

# Defining string variables
name = "Python"              # String with letters
greeting = 'Hello, World!'   # String with special characters

# Printing string values
print("\nString examples:")
print(name, greeting)        # Output: Python Hello, World!
print(type(name))             # Output: <class 'str'>

# Strings can also be concatenated or multiplied
print("\nString operations:")
message = "Hello" + " " + "Python"
print(message)               # Output: Hello Python

repeated = "Python" * 3
print(repeated)              # Output: PythonPythonPython

# 4. Boolean (bool)
# Booleans represent one of two values: True or False. They are used for logical operations.
# Boolean values are typically the result of comparisons (e.g., x == 10)

# Defining boolean variables
is_active = True             # Boolean True
is_logged_in = False         # Boolean False

# Printing boolean values
print("\nBoolean examples:")
print(is_active, is_logged_in)   # Output: True False
print(type(is_active))           # Output: <class 'bool'>

# Booleans are commonly used in conditional statements
if is_active:
    print("User is active.")    # Output: User is active.
else:
    print("User is not active.")

# 5. Type Conversion
# You can convert between different data types using functions like int(), float(), str(), etc.

# Converting from string to integer
str_num = "123"
num = int(str_num)                  # Convert string to integer
print("\nString to integer:", num)  # Output: 123

# Converting from integer to float
float_num = float(num)        # Convert integer to float
print("Integer to float:", float_num)  # Output: 123.0

# Converting from float to string
str_float = str(float_num)    # Convert float to string
print("Float to string:", str_float)  # Output: '123.0'

# Converting from boolean to integer
print("Boolean True to integer:", int(True))  # Output: 1
print("Boolean False to integer:", int(False))  # Output: 0

# 6. Checking Data Types
# You can check the data type of any variable using the type() function.
print("\nData Type checks:")
print(type(x))   # <class 'int'>
print(type(a))   # <class 'float'>
print(type(name)) # <class 'str'>
print(type(is_active)) # <class 'bool'>

# Summary:
# - Integers are whole numbers without a decimal.
# - Floats are numbers with decimal points.
# - Strings are sequences of characters.
# - Booleans represent True or False values.
# - Type conversion is possible between different data types.
