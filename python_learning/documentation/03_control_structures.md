#### **Introduction to Control Structures**
Control structures in Python allow you to control the flow of execution based on certain conditions or repetitions. They are fundamental for creating decision-making logic and repeating tasks in your programs.

#### **1. Conditional Statements (if-else)**
Conditional statements let you execute certain code blocks only if specific conditions are met.

##### **Syntax:**
```python
if condition:
    # code to execute if condition is true
elif another_condition:
    # code to execute if the above condition is false and this one is true
else:
    # code to execute if none of the conditions are true
```

##### **Example:**
```python
age = 20

if age < 18:
    print("You are a minor.")
elif age >= 18 and age < 60:
    print("You are an adult.")
else:
    print("You are a senior citizen.")
```
**Output**: `You are an adult.`

#### **2. Logical Operators (and, or, not)**
Logical operators are used in conditions to combine multiple conditions.

##### **Example:**
```python
age = 25
citizenship = True

if age >= 18 and citizenship:
    print("You are eligible to vote.")
else:
    print("You are not eligible to vote.")
```
**Output**: `You are eligible to vote.`

#### **3. Loops**

**For Loops**: Used to iterate over a sequence (like a list, string, or range).

##### **Syntax:**
```python
for item in sequence:
    # code to execute
```

##### **Example:**
```python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
```
**Output**:
```
apple
banana
cherry
```

**While Loops**: Used to repeatedly execute a block of code as long as a given condition is true.

##### **Syntax:**
```python
while condition:
    # code to execute
```

##### **Example:**
```python
counter = 0
while counter < 5:
    print("Counter is:", counter)
    counter += 1
```
**Output**:
```
Counter is: 0
Counter is: 1
Counter is: 2
Counter is: 3
Counter is: 4
```

#### **4. Break and Continue**
- **`break`**: Exits the loop completely.
- **`continue`**: Skips the current iteration and moves to the next iteration of the loop.

##### **Example of break:**
```python
for i in range(10):
    if i == 5:
        break
    print(i)
```
**Output**:
```
0
1
2
3
4
```

##### **Example of continue:**
```python
for i in range(10):
    if i == 5:
        continue
    print(i)
```
**Output**:
```
0
1
2
3
4
6
7
8
9
```

#### **5. List Comprehensions**
List comprehensions provide a concise way to create lists by applying an expression to each element in an existing iterable.

##### **Syntax:**
```python
[expression for item in iterable if condition]
```

##### **Example:**
```python
squares = [x**2 for x in range(10) if x % 2 == 0]
print(squares)
```
**Output**: `[0, 4, 16, 36, 64]`

#### **6. Nested Loops and Conditional Statements**
You can nest loops and conditional statements inside each other to handle more complex logic.

##### **Example:**
```python
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

for row in matrix:
    for col in row:
        if col % 2 == 0:
            print(f"{col} is even")
        else:
            print(f"{col} is odd")
```
**Output**:
```
1 is odd
2 is even
3 is odd
4 is even
5 is odd
6 is even
7 is odd
8 is even
9 is odd
```

#### **7. Ternary Operator (Conditional Expressions)**
A shorthand way to write simple `if-else` statements in a single line.

##### **Syntax:**
```python
value_if_true if condition else value_if_false
```

##### **Example:**
```python
age = 18
status = "Adult" if age >= 18 else "Minor"
print(status)
```
**Output**: `Adult`

---

#### **Summary**
Control structures are an essential part of Python programming. They allow you to:
- Make decisions using conditional statements (`if`, `elif`, `else`).
- Repeat tasks using loops (`for`, `while`).
- Control the flow with `break`, `continue`, and `pass`.
- Use list comprehensions to create concise loops and conditional expressions.

---