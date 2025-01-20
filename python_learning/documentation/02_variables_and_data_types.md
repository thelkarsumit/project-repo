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

#### **4. Operations on Data Types**
Python allows you to perform operations on variables of various types:

1. **Mathematical Operations**
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`), Modulo (`%`), Integer division (`//`), Exponentiation (`**`).

```python
x = 10
y = 3
addition = x + y   # 13
subtraction = x - y   # 7
multiplication = x * y   # 30
division = x / y   # 3.333...
modulo = x % y   # 1
integer_division = x // y   # 3
exponentiation = x ** y   # 1000
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

#### **7. Best Practices**
1. **Naming Variables**: 
   - Use descriptive variable names.
   - Follow snake_case for variable names (`my_variable`) and class names should use CamelCase (`MyClass`).

2. **Avoid Using Reserved Keywords**: 
   - Python has reserved keywords (e.g., `if`, `else`, `for`, `class`), so don’t use them as variable names.

3. **Use Constants for Immutable Values**:
   - If a value shouldn't change, consider defining it as a constant using uppercase letters:

```python
PI = 3.14159
```

---

### **Conclusion**
This chapter covered variables, data types, type conversion, and basic operations in Python. Understanding these concepts is fundamental to writing efficient and effective Python code. Once you're familiar with these basics, you can move on to more complex data structures and operations. 
