# 12_dict_operations_with_explanations.py

# What is a dictionary in Python?
# A dictionary is a mutable, unordered collection in Python, used to store data in key-value pairs.
# Keys must be unique and immutable (e.g., strings, numbers, or tuples).
# Values can be any data type and do not need to be unique.

# Creating a dictionary
my_dict = {"name": "John", "age": 30, "city": "New York"}
# Output: {'name': 'John', 'age': 30, 'city': 'New York'}
print("\nCreating a dictionary:", my_dict)

# Adding a new key-value pair
my_dict["job"] = "Engineer"
# Output: {'name': 'John', 'age': 30, 'city': 'New York', 'job': 'Engineer'}
print("\nAdding a key-value pair:", my_dict)

# Updating an existing key's value
my_dict["age"] = 31
# Output: {'name': 'John', 'age': 31, 'city': 'New York', 'job': 'Engineer'}
print("\nUpdating a key's value:", my_dict)

# Removing a key-value pair using pop()
removed_value = my_dict.pop("city")
# Output: Removed value: New York
print("\nRemoving a key-value pair using pop():", removed_value)
# Output: {'name': 'John', 'age': 31, 'job': 'Engineer'}
print("\nDictionary after removal:", my_dict)

# Removing the last inserted key-value pair using popitem()
last_item = my_dict.popitem()
# Output: Removed last item: ('job', 'Engineer')
print("\nRemoving the last inserted key-value pair:", last_item)
# Output: {'name': 'John', 'age': 31}
print("\nDictionary after popitem:", my_dict)

# Accessing a value using a key
name = my_dict.get("name")  # Preferred over my_dict["name"] to avoid KeyError if the key doesn't exist.
# Output: Name is John
print("\nAccessing a value using get(): Name is", name)

# Checking if a key exists in a dictionary
is_key_present = "age" in my_dict
# Output: Key 'age' exists: True
print("\nChecking if a key exists:", is_key_present)

# Iterating over keys in a dictionary
print("\nIterating over keys:")
for key in my_dict:
    print(key, end=" ")
# Output: name age

# Iterating over values in a dictionary
print("\n# Iterating over values:")
for value in my_dict.values():
    print(value, end=" ")
# Output: John 31

# Iterating over key-value pairs in a dictionary
print("\n# Iterating over key-value pairs:")
for key, value in my_dict.items():
    print(f"{key}: {value}", end=" ")
# Output: name: John age: 31

# Merging two dictionaries (Python 3.9+)
additional_info = {"country": "USA", "married": False}
merged_dict = my_dict | additional_info
# Output: {'name': 'John', 'age': 31, 'country': 'USA', 'married': False}
print("\n# Merging dictionaries (Python 3.9+):", merged_dict)

# Using dictionary comprehension to modify values
squared_values = {k: v**2 for k, v in {"a": 1, "b": 2, "c": 3}.items()}
# Output: {'a': 1, 'b': 4, 'c': 9}
print("\nUsing dictionary comprehension:", squared_values)

# Clearing all items in a dictionary
my_dict.clear()
# Output: {}
print("\nClearing all items in a dictionary:", my_dict)

# Nested dictionaries
nested_dict = {
    "student1": {"name": "Alice", "age": 22},
    "student2": {"name": "Bob", "age": 24},
}
# Accessing nested dictionary items
student1_name = nested_dict["student1"]["name"]
# Output: Student1 Name is Alice
print("\nAccessing nested dictionary item:", student1_name)

# Copying a dictionary
copied_dict = nested_dict.copy()
# Output: {'student1': {'name': 'Alice', 'age': 22}, 'student2': {'name': 'Bob', 'age': 24}}
print("\nCopying a dictionary:", copied_dict)

# Dictionary keys must be immutable
immutable_keys_dict = {(1, 2): "tuple_as_key", "key": "value"}
# Output: {(1, 2): 'tuple_as_key', 'key': 'value'}
print("\nDictionary with immutable keys:", immutable_keys_dict)

# Dictionary with default values using fromkeys()
default_dict = dict.fromkeys(["key1", "key2", "key3"], "default_value")
# Output: {'key1': 'default_value', 'key2': 'default_value', 'key3': 'default_value'}
print("\nDictionary with default values:", default_dict)

# Summary:
# - Dictionaries are powerful data structures in Python.
# - They support efficient retrieval, insertion, and deletion operations.
# - Keys are unique and immutable; values can be any type.
