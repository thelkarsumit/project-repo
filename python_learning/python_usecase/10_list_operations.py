# 10_list_operations.py

# 1. Creating a List
# A list is a mutable, ordered collection of items in Python.
# Lists can hold items of different data types.

my_list = [10, 20, 30, 40, 50]  # Creating a list with integer values
print("Initial List:", my_list)  # Output: [10, 20, 30, 40, 50]

# 2. Appending Items
# The append() method adds an element to the end of the list.

my_list.append(60)  # Append 60 to the list
print("After appending 60:", my_list)  # Output: [10, 20, 30, 40, 50, 60]

# 3. Inserting Items
# The insert() method allows inserting an element at a specific index.
# Syntax: list.insert(index, element)

my_list.insert(2, 25)  # Insert 25 at index 2
print("After inserting 25 at index 2:", my_list)  # Output: [10, 20, 25, 30, 40, 50, 60]

# 4. Removing Items
# The remove() method removes the first occurrence of a specified item from the list.
# It raises a ValueError if the item is not found.

my_list.remove(40)  # Remove the item 40 from the list
print("After removing 40:", my_list)  # Output: [10, 20, 25, 30, 50, 60]

# 5. Popping Items
# The pop() method removes and returns the last element from the list.
# You can also specify an index to remove an element at a specific position.

popped_item = my_list.pop()  # Pop the last item
print("Popped item:", popped_item)  # Output: 60
print("List after popping:", my_list)  # Output: [10, 20, 25, 30, 50]

# You can also pop from a specific index
popped_item_at_index = my_list.pop(2)  # Pop item at index 2 (25)
print("Popped item at index 2:", popped_item_at_index)  # Output: 25
print("List after popping at index 2:", my_list)  # Output: [10, 20, 30, 50]

# 6. Slicing the List
# Slicing is a powerful feature in Python that allows you to create sublists or extract elements.
# Syntax: list[start:stop:step]
# start: starting index (inclusive)
# stop: stopping index (exclusive)
# step: step value for skipping elements

sublist = my_list[1:4]  # Get elements from index 1 to 3 (excluding 4)
print("Sliced list (index 1 to 3):", sublist)  # Output: [20, 30, 50]

# Slicing with a step (every second element)
step_sliced_list = my_list[::2]  # Start from the beginning and take every second element
print("List with step slicing (every second element):", step_sliced_list)  # Output: [10, 30]

# 7. Indexing the List
# Indexing allows accessing elements at specific positions.

first_element = my_list[0]  # Access the first element
last_element = my_list[-1]  # Access the last element using negative indexing

print("First element:", first_element)  # Output: 10
print("Last element:", last_element)  # Output: 50

# 8. List Length
# The len() function returns the number of items in the list.

list_length = len(my_list)
print("Length of the list:", list_length)  # Output: 4

# 9. Checking if an Item Exists in the List
# You can use the `in` keyword to check if an element exists in the list.

is_30_in_list = 30 in my_list  # Check if 30 is in the list
is_100_in_list = 100 in my_list  # Check if 100 is in the list

print("Is 30 in the list?", is_30_in_list)  # Output: True
print("Is 100 in the list?", is_100_in_list)  # Output: False

# 10. List Concatenation
# You can combine lists using the + operator.

new_list = [100, 200, 300]
combined_list = my_list + new_list  # Concatenate my_list and new_list
print("Combined List:", combined_list)  # Output: [10, 20, 30, 50, 100, 200, 300]

# 11. List Repetition
# You can repeat the elements of a list using the * operator.

repeated_list = my_list * 2  # Repeat the list twice
print("Repeated List:", repeated_list)  # Output: [10, 20, 30, 50, 10, 20, 30, 50]

# 12. List Sorting
# Sort the list in ascending or descending order.

my_list.sort()  # Sort in ascending order
print("Sorted list (ascending):", my_list)  # Output: [10, 20, 30, 50]

my_list.sort(reverse=True)  # Sort in descending order
print("Sorted list (descending):", my_list)  # Output: [50, 30, 20, 10]

# 13. Reversing the List
# Reverse the elements in the list.

my_list.reverse()  # Reverse the list
print("Reversed list:", my_list)  # Output: [10, 20, 30, 50]

# 14. Copying the List
# You can create a copy of a list using the copy() method or slicing.

my_list_copy = my_list.copy()  # Create a shallow copy of the list
print("Copied list:", my_list_copy)  # Output: [10, 20, 30, 50]

# End of list operations demonstration
