# Understanding Tuples in Python

# 1. Tuples are immutable ordered collections of items.
#    They are similar to lists but cannot be modified after creation.

# Creating a tuple
my_tuple = (10, 20, 30, 40, 50)
print("Original Tuple:", my_tuple)
# Output: Original Tuple: (10, 20, 30, 40, 50)

# 2. Accessing elements in a tuple
#    Elements can be accessed using indexing.
first_element = my_tuple[0]
last_element = my_tuple[-1]
print("First Element:", first_element)  # Output: First Element: 10
print("Last Element:", last_element)    # Output: Last Element: 50

# 3. Slicing tuples
#    Tuples support slicing to extract a range of elements.
sliced_tuple = my_tuple[1:4]
print("Sliced Tuple (index 1 to 3):", sliced_tuple)
# Output: Sliced Tuple (index 1 to 3): (20, 30, 40)

# 4. Tuple Packing and Unpacking
# Packing: Assigning multiple values to a single tuple
packed_tuple = 1, 2, "Hello", 3.5
print("Packed Tuple:", packed_tuple)
# Output: Packed Tuple: (1, 2, 'Hello', 3.5)

# Unpacking: Extracting values from a tuple into variables
a, b, c, d = packed_tuple
print("Unpacked Values: a =", a, ", b =", b, ", c =", c, ", d =", d)
# Output: Unpacked Values: a = 1 , b = 2 , c = Hello , d = 3.5

# 5. Nesting tuples
#    Tuples can contain other tuples as elements.
nested_tuple = (10, (20, 30), 40)
print("Nested Tuple:", nested_tuple)
# Output: Nested Tuple: (10, (20, 30), 40)

# Accessing elements in nested tuples
inner_tuple = nested_tuple[1]
inner_element = nested_tuple[1][0]
print("Inner Tuple:", inner_tuple)
# Output: Inner Tuple: (20, 30)
print("First Element of Inner Tuple:", inner_element)
# Output: First Element of Inner Tuple: 20

# 6. Immutability of Tuples
#    Tuples are immutable, so you cannot change their elements directly.
# Example:
try:
    my_tuple[0] = 100  # This will raise a TypeError
except TypeError as e:
    print("Error:", e)
# Output: Error: 'tuple' object does not support item assignment

# 7. Tuple Methods
#    Tuples have two built-in methods: count() and index().
count_example = (1, 2, 3, 1, 1, 4)
print("Count of 1 in tuple:", count_example.count(1))
# Output: Count of 1 in tuple: 3
print("Index of first occurrence of 3:", count_example.index(3))
# Output: Index of first occurrence of 3: 2

# 8. Tuples vs Lists
#    Tuples are immutable, which makes them faster and more memory-efficient.
#    Lists are mutable and allow changes to their content.

# Example of tuple immutability advantage:
import sys
large_list = [i for i in range(1000)]
large_tuple = tuple(large_list)

print("Size of List (in bytes):", sys.getsizeof(large_list))
# Output: Size of List (in bytes): <varies>
print("Size of Tuple (in bytes):", sys.getsizeof(large_tuple))
# Output: Size of Tuple (in bytes): <smaller than list>

# 9. Single-element tuples
#    To create a single-element tuple, include a trailing comma.
single_element_tuple = (42,)
print("Single-element Tuple:", single_element_tuple)
# Output: Single-element Tuple: (42,)

# 10. Use Cases of Tuples
#    a. Tuples as keys in dictionaries (immutable keys).
#    b. Return multiple values from a function.
#    c. Immutable data structures for safety.

# Example: Using tuple as a dictionary key
coordinates = {(10, 20): "Point A", (30, 40): "Point B"}
print("Value for (10, 20):", coordinates[(10, 20)])
# Output: Value for (10, 20): Point A
