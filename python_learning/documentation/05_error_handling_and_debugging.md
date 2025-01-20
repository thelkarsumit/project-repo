# Error Handling and Debugging

### **Introduction**
Error handling is a critical part of writing robust Python programs. Python provides various mechanisms to handle errors and exceptions, which helps in making your code more predictable and manageable. Additionally, debugging allows you to identify and fix errors in your code more efficiently.

In this chapter, we'll cover:
1. Exception handling (`try`, `except`, `finally`, `else`)
2. Raising exceptions
3. The `assert` statement for debugging
4. Debugging tools in Python
5. Logging errors

---

### **1. Exception Handling in Python**
Python uses `try` and `except` blocks to handle exceptions, which are errors that occur during program execution. This allows you to gracefully handle errors without terminating the program.

#### **Basic Try-Except Block**
```python
try:
    x = 10 / 0  # This will raise a ZeroDivisionError
except ZeroDivisionError as e:
    print(f"Error: {e}")
```
- **Explanation**: In this example, the division by zero triggers a `ZeroDivisionError`. The program doesn’t crash but instead prints the error message.

#### **Multiple Except Blocks**
You can catch different types of exceptions using multiple `except` blocks:
```python
try:
    num = int(input("Enter a number: "))
    result = 10 / num
except ZeroDivisionError as e:
    print("Cannot divide by zero!")
except ValueError as e:
    print("Invalid input! Please enter an integer.")
```
- **Explanation**: Here, we catch two exceptions—`ZeroDivisionError` (if the user enters 0) and `ValueError` (if the user enters a non-integer value).

#### **Finally Block**
The `finally` block is always executed, whether an exception occurs or not. It's useful for cleanup activities like closing files or releasing resources.
```python
try:
    file = open("data.txt", "r")
    content = file.read()
except FileNotFoundError as e:
    print(f"Error: {e}")
finally:
    print("This will always be executed.")
    file.close()
```
- **Explanation**: The `finally` block ensures the file is closed regardless of whether the exception occurred.

#### **Else Block**
The `else` block executes if no exception is raised in the `try` block.
```python
try:
    num = int(input("Enter a number: "))
    result = 10 / num
except ZeroDivisionError:
    print("Cannot divide by zero.")
else:
    print(f"Result: {result}")
```
- **Explanation**: The `else` block runs only when the code in the `try` block executes without any errors.

---

### **2. Raising Exceptions**
You can raise your own exceptions using the `raise` keyword. This is useful when you want to handle specific conditions in your program.

#### **Raising a Custom Exception**
```python
def check_age(age):
    if age < 18:
        raise ValueError("Age must be 18 or older.")
    else:
        print("Age is valid.")

try:
    check_age(16)
except ValueError as e:
    print(e)
```
- **Explanation**: The `check_age` function raises a `ValueError` if the age is less than 18. The exception is then caught in the `except` block.

#### **Raising Exceptions with Custom Messages**
```python
raise Exception("This is a custom exception message.")
```
- **Explanation**: You can create custom exceptions with any message you want to convey.

---

### **3. The Assert Statement**
The `assert` statement is used for debugging purposes to test conditions during runtime. If the condition is `False`, it raises an `AssertionError`.

#### **Using Assert**
```python
x = 10
assert x > 0, "x should be greater than 0"
```
- **Explanation**: If `x` is not greater than 0, it raises an `AssertionError` with the specified message.

#### **Example with Invalid Condition**
```python
x = -5
assert x > 0, "x must be a positive number"
```
- **Explanation**: This will raise an `AssertionError` because the condition `x > 0` is not satisfied.

---

### **4. Debugging Tools in Python**

#### **Using Print Statements for Debugging**
You can use print statements to debug your code by displaying variable values at different stages.

```python
def divide(a, b):
    print(f"a: {a}, b: {b}")  # Debug print
    return a / b

print(divide(10, 2))
```

#### **Using Python's Built-in Debugger (`pdb`)**
Python provides a built-in debugger called `pdb` which allows you to step through your code line by line.
```python
import pdb

def divide(a, b):
    pdb.set_trace()  # This will pause the program and open the debugger
    return a / b

print(divide(10, 2))
```
- **Explanation**: The `pdb.set_trace()` function pauses the execution and opens the debugger. You can inspect variables, step through the code, and evaluate expressions.

#### **Using IDE Debuggers**
Most modern IDEs (such as VSCode or PyCharm) come with built-in debuggers that allow you to set breakpoints and step through the code interactively.

---

### **5. Logging Errors**

For production code, it’s better to use Python’s `logging` module instead of `print` statements for tracking errors and debugging.

#### **Basic Logging Setup**
```python
import logging

logging.basicConfig(filename='app.log', level=logging.ERROR)

def divide(a, b):
    if b == 0:
        logging.error("Division by zero error: a = %s, b = %s", a, b)
        return None
    return a / b

print(divide(10, 0))
```
- **Explanation**: The `logging.error()` function records an error message in the log file `app.log`.

#### **Logging Different Levels**
```python
import logging

logging.basicConfig(level=logging.DEBUG)

logging.debug("This is a debug message.")
logging.info("This is an info message.")
logging.warning("This is a warning message.")
logging.error("This is an error message.")
logging.critical("This is a critical message.")
```
- **Explanation**: Logging supports different levels (`DEBUG`, `INFO`, `WARNING`, `ERROR`, and `CRITICAL`), which help categorize the severity of messages.

---

### **Summary**
- Exception handling allows for graceful error management using `try`, `except`, `finally`, and `else`.
- The `raise` statement allows you to throw custom exceptions.
- The `assert` statement helps to check conditions during runtime.
- Python provides debugging tools like `pdb` and IDE debuggers for stepping through code.
- The `logging` module helps in logging errors and messages, offering better control in production environments.

By mastering these concepts, you'll be able to handle errors effectively, debug your code with ease, and build more robust Python programs.

---
