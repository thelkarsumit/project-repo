# Variables and Data Types

#### **1. Introduction to Variables in Python**
A **variable** in Python is a name that refers to a value. The value is stored in memory and can be changed during the execution of the program. In Python, variables are dynamically typed, meaning you don't need to declare the type explicitly.

#### **1.1 Variable Assignment**
In Python, variable assignment is done with the equals sign (`=`).

```python
x = 10   # integer assignment
y = 3.14 # float assignment
name = "Alice"  # string assignment
```

- `x`, `y`, and `name` are the variables.
- The values `10`, `3.14`, and `"Alice"` are assigned to these variables respectively.

---

#### **2. Data Types in Python**
Python supports several built-in data types. Below are the most common ones:

1. **Numbers**
   - **Integers** (`int`): Whole numbers.
   - **Floating point** (`float`): Numbers with decimal points.
   - **Complex** (`complex`): Numbers with a real and imaginary part.

```python
int_var = 100   # integer
float_var = 3.14159  # floating point number
complex_var = 2 + 3j  # complex number
```

2. **Strings** (`str`)
   - Strings are sequences of characters enclosed in single (`'`) or double (`"`) quotes.

```python
string_var = "Hello, Python!"
string_var2 = 'Python is great!'
```

3. **Booleans** (`bool`)
   - A Boolean type has only two values: `True` or `False`.

```python
is_active = True
is_sunny = False
```

4. **Lists** (`list`)
   - Lists are ordered collections of items, which can be of any data type, and are mutable (can be changed).

```python
list_var = [1, 2, 3, "Python", 4.5]
```

5. **Tuples** (`tuple`)
   - Tuples are ordered collections of items, similar to lists, but **immutable** (cannot be changed after creation).

```python
tuple_var = (1, 2, 3, "Python")
```

6. **Sets** (`set`)
   - Sets are unordered collections of unique items.

```python
set_var = {1, 2, 3, 4}
```

7. **Dictionaries** (`dict`)
   - Dictionaries store key-value pairs and are unordered.

```python
dict_var = {"name": "Alice", "age": 25, "location": "New York"}
```

---

#### **3. Type Conversion (Casting)**
Python allows you to convert between different data types using **type casting** functions.

```python
# Convert float to integer
float_to_int = int(3.14)  # 3

# Convert integer to float
int_to_float = float(10)  # 10.0

# Convert string to integer
str_to_int = int("123")  # 123

# Convert integer to string
int_to_str = str(456)  # '456'
```

---

#### **4. Operations on Data Types**
Python allows you to perform operations on variables of various types:

1. **Mathematical Operations**
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`), Modulo (`%`), Integer division (`//`), Exponentiation (`**`).

```python
x = 10
y = 3
addition = x + y           # 13
subtraction = x - y        # 7
multiplication = x * y     # 30
division = x / y           # 3.333...
modulo = x % y             # 1    The modulo operation returns the remainder of a division.
integer_division = x // y  # 3    
exponentiation = x ** y    # 1000 The exponentiation operation raises a number to the power of another number.
```

2. **String Operations**
   - String concatenation (`+`), repetition (`*`), and slicing.

```python
str1 = "Hello"
str2 = "World"
concatenation = str1 + " " + str2  # "Hello World"
repetition = str1 * 3  # "HelloHelloHello"
slicing = str1[1:4]  # "ell"
```

3. **List Operations**
   - Lists support concatenation, repetition, and slicing.

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]
concat_lists = list1 + list2   # [1, 2, 3, 4, 5, 6]
repeat_list = list1 * 2   # [1, 2, 3, 1, 2, 3]
sliced_list = list1[1:3]   # [2, 3]
```

---

#### **5. Special Data Types**
1. **None**: Represents the absence of a value.

```python
none_var = None  # Represents no value
```

2. **Type() Function**
   - Use `type()` to check the data type of a variable.

```python
x = 10
print(type(x))  # <class 'int'>

y = "Python"
print(type(y))  # <class 'str'>
```

---

#### **6. Advanced Data Structures**
1. **Nested Lists**
   - Lists within lists.

```python
nested_list = [[1, 2], [3, 4], [5, 6]]
```

2. **Dictionary with Lists**
   - Dictionaries can contain lists as values.

```python
dict_with_lists = {"numbers": [1, 2, 3], "letters": ["a", "b", "c"]}
```

3. **Sets and Dictionaries**
   - Sets do not allow duplicates; dictionaries store key-value pairs.

```python
set_example = {1, 2, 3, 3, 4}  # Result: {1, 2, 3, 4}
dict_example = {"key1": "value1", "key2": "value2"}  # Result: {'key1': 'value1', 'key2': 'value2'}
```
---

#### **7. Slicing in Python**
Slicing is a powerful way to access parts of sequences such as strings, lists, and tuples. It allows you to extract a subset of elements by specifying a start, stop, and step.

**Concepts of Slicing**

1. **Syntax**:
   ```python
   sequence[start:stop:step]
   ```
   - **start**: The index where slicing begins (inclusive). Default is `0`.
   - **stop**: The index where slicing ends (exclusive).
   - **step**: The interval between elements in the slice. Default is `1`.

2. **Default Values**:
   - If `start` is omitted, slicing starts from the beginning.
   - If `stop` is omitted, slicing continues to the end of the sequence.
   - If `step` is omitted, the default value is `1`.

**Examples of Slicing**

1. **Slicing Strings**
   ```python
   text = "Hello, Python!"

   # Extract "Hello"
   slice1 = text[0:5]  
   print(slice1)  # Output: Hello

   # Extract "Python"
   slice2 = text[7:13]  
   print(slice2)  # Output: Python

   # Extract the entire string
   slice3 = text[:]  
   print(slice3)  # Output: Hello, Python!

   # Extract "Hlo"
   slice4 = text[0:5:2]  
   print(slice4)  # Output: Hlo

   # Reverse the string
   reverse = text[::-1]  
   print(reverse)  # Output: !nohtyP ,olleH
   ```

2. **Slicing Lists**
   ```python
   numbers = [10, 20, 30, 40, 50, 60]

   # Extract first three elements
   slice1 = numbers[0:3]  
   print(slice1)  # Output: [10, 20, 30]

   # Extract elements from index 2 to the end
   slice2 = numbers[2:]  
   print(slice2)  # Output: [30, 40, 50, 60]

   # Extract elements with a step of 2
   slice3 = numbers[::2]  
   print(slice3)  # Output: [10, 30, 50]

   # Reverse the list
   reverse = numbers[::-1]  
   print(reverse)  # Output: [60, 50, 40, 30, 20, 10]
   ```

3. **Slicing Tuples**
   ```python
   data = ('a', 'b', 'c', 'd', 'e')

   # Extract ('b', 'c', 'd')
   slice1 = data[1:4]  
   print(slice1)  # Output: ('b', 'c', 'd')

   # Extract every second element
   slice2 = data[::2]  
   print(slice2)  # Output: ('a', 'c', 'e')

   # Reverse the tuple
   reverse = data[::-1]  
   print(reverse)  # Output: ('e', 'd', 'c', 'b', 'a')
   ```

**Tips for Slicing**
1. Negative indices can be used to count elements from the end.
   ```python
   text = "Python"
   print(text[-3:])  # Output: hon
   print(text[:-3])  # Output: Pyt
   ```

2. The `step` parameter can create non-contiguous slices.
   ```python
   numbers = [1, 2, 3, 4, 5, 6]
   print(numbers[::2])  # Output: [1, 3, 5]
   print(numbers[1::2])  # Output: [2, 4, 6]
   ```

---

#### **8. The `split()` Function**

The **split() function** in Python is commonly used for splitting strings, which is a foundational concept in working with text data.
The `split()` function in Python is used to break up a string into a list of substrings based on a specified delimiter (default is a space).

**Syntax**:
```python
string.split(separator, maxsplit)
```
- **`separator`**: The delimiter on which the string is split. By default, it's a whitespace.
- **`maxsplit`**: The maximum number of splits to perform. Default is `-1`, meaning all possible splits.

**Examples of Using `split()`**

1. **Basic Splitting**:
   ```python
   text = "Python is fun"
   words = text.split()  # Default separator (space)
   print(words)  # Output: ['Python', 'is', 'fun']
   ```

2. **Splitting with a Custom Separator**:
   ```python
   csv_line = "apple,banana,grape,orange"
   fruits = csv_line.split(",")  # Separator is a comma
   print(fruits)  # Output: ['apple', 'banana', 'grape', 'orange']
   ```

3. **Using `maxsplit`**:
   ```python
   text = "Python is powerful and versatile"
   result = text.split(" ", 2)  # Split into 3 parts
   print(result)  # Output: ['Python', 'is', 'powerful and versatile']
   ```

4. **Splitting Without Specified Separator**:
   If no separator is specified, any whitespace (spaces, tabs, newlines) will be treated as the delimiter:
   ```python
   messy_text = "  Python\tis\namazing  "
   cleaned_words = messy_text.split()
   print(cleaned_words)  # Output: ['Python', 'is', 'amazing']
   ```

5. **Edge Cases**:
   - If the string is empty:
     ```python
     empty_str = ""
     print(empty_str.split())  # Output: []
     ```
   - If the separator is not found:
     ```python
     text = "hello"
     print(text.split(","))  # Output: ['hello']
     ```

**Real-Life Use Cases**
1. **Splitting Log Entries**:
   ```python
   log_entry = "ERROR|2025-01-21|System Failure"
   parts = log_entry.split("|")
   print(parts)  # Output: ['ERROR', '2025-01-21', 'System Failure']
   ```

2. **Processing CSV Data**:
   ```python
   csv_row = "John,25,Developer"
   data = csv_row.split(",")
   print(data)  # Output: ['John', '25', 'Developer']
   ```

3. **Extracting Words from Sentences**:
   ```python
   sentence = "Learning Python is fun and rewarding!"
   words = sentence.split()
   print(words)  # Output: ['Learning', 'Python', 'is', 'fun', 'and', 'rewarding!']
   ```

---

#### **Best Practices**
1. **Naming Variables**: 
   - Use descriptive variable names.
   - Follow snake_case for variable names (`my_variable`) and class names should use CamelCase (`MyClass`).
   - Understand more about case types (https://www.freecodecamp.org/news/snake-case-vs-camel-case-vs-pascal-case-vs-kebab-case-whats-the-difference)

2. **Avoid Using Reserved Keywords**: 
   - Python has reserved keywords (e.g., `if`, `else`, `for`, `class`), so don’t use them as variable names.

3. **Use Constants for Immutable Values**:
   - If a value shouldn't change, consider defining it as a constant using uppercase letters:

```python
PI = 3.14159
```

--- 
