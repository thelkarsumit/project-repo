# 13_set_operations_with_explanation.py
# This script covers set operations like union, intersection, difference, and symmetric difference.
# Each operation is explained step-by-step with examples and outputs provided as comments.

# What are sets in Python?
# A set is an unordered collection of unique elements. Sets are mutable, 
# meaning their contents can be changed, but all elements must be hashable (e.g., no lists as elements).

# Example: Creating sets
set_a = {1, 2, 3, 4, 5}
set_b = {4, 5, 6, 7, 8}

# Union of sets
# The union of two sets returns a new set containing all unique elements from both sets.
# Syntax: set_a | set_b or set_a.union(set_b)
union_result = set_a | set_b
print("Union of set_a and set_b:", union_result)
# Output: Union of set_a and set_b: {1, 2, 3, 4, 5, 6, 7, 8}

# Intersection of sets
# The intersection of two sets returns a new set containing only the elements that are present in both sets.
# Syntax: set_a & set_b or set_a.intersection(set_b)
intersection_result = set_a & set_b
print("Intersection of set_a and set_b:", intersection_result)
# Output: Intersection of set_a and set_b: {4, 5}

# Difference of sets
# The difference of two sets returns a new set containing elements in the first set but not in the second set.
# Syntax: set_a - set_b or set_a.difference(set_b)
difference_result = set_a - set_b
print("Difference of set_a and set_b (set_a - set_b):", difference_result)
# Output: Difference of set_a and set_b (set_a - set_b): {1, 2, 3}

# Symmetric difference of sets
# The symmetric difference of two sets returns a new set containing elements that are in either set, but not in both.
# Syntax: set_a ^ set_b or set_a.symmetric_difference(set_b)
symmetric_difference_result = set_a ^ set_b
print("Symmetric difference of set_a and set_b:", symmetric_difference_result)
# Output: Symmetric difference of set_a and set_b: {1, 2, 3, 6, 7, 8}

# Additional operations on sets
# Checking if a set is a subset of another
# Syntax: set_a <= set_b or set_a.issubset(set_b)
is_subset = {4, 5}.issubset(set_a)
print("Is {4, 5} a subset of set_a?:", is_subset)
# Output: Is {4, 5} a subset of set_a?: True

# Checking if a set is a superset of another
# Syntax: set_a >= set_b or set_a.issuperset(set_b)
is_superset = set_a.issuperset({2, 3})
print("Is set_a a superset of {2, 3}?:", is_superset)
# Output: Is set_a a superset of {2, 3}?: True

# Adding and removing elements
# Add an element to the set (if it does not already exist)
set_a.add(10)
print("Set after adding 10:", set_a)
# Output: Set after adding 10: {1, 2, 3, 4, 5, 10}

# Remove an element from the set
set_a.remove(10)
print("Set after removing 10:", set_a)
# Output: Set after removing 10: {1, 2, 3, 4, 5}

# Note: Use `discard()` if you want to remove an element without raising an error if it doesn't exist.
set_a.discard(15)  # Does nothing since 15 is not in the set
print("Set after discarding 15 (no error):", set_a)
# Output: Set after discarding 15 (no error): {1, 2, 3, 4, 5}

# Clearing all elements from a set
set_b.clear()
print("Set after clearing all elements (set_b):", set_b)
# Output: Set after clearing all elements (set_b): set()

# Why use sets?
# Sets are useful for removing duplicates from a collection, checking membership, and performing efficient set operations.

# Example: Removing duplicates from a list using sets
duplicate_list = [1, 2, 3, 3, 4, 4, 5]
unique_set = set(duplicate_list)
print("Unique elements after removing duplicates:", unique_set)
# Output: Unique elements after removing duplicates: {1, 2, 3, 4, 5}
