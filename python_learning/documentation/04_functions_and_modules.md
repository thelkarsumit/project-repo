# Functions and Modules

#### **1. Introduction to Functions**

A function is a block of reusable code that performs a specific task. Functions help you organize your code, improve readability, and avoid repetition.

#### **1.1 Defining a Function**

A function is defined using the `def` keyword followed by the function name and parentheses. Inside the parentheses, you can define parameters that the function can accept.

**Syntax**:
```python
def function_name(parameters):
    # Function body
    # Code to execute
    return result
```

**Example**:
```python
def greet(name):
    print(f"Hello, {name}!")
    
greet("Alice")  # Output: Hello, Alice!
```

#### **1.2 Function Arguments**

Functions can take one or more arguments. These arguments allow you to pass data into the function.

- **Positional Arguments**: The order of arguments matters.
- **Keyword Arguments**: Arguments passed by specifying the parameter name.
- **Default Arguments**: Parameters that have default values.
- **Variable-Length Arguments**: Using `*args` and `**kwargs` to handle multiple arguments.

**Examples**:

- **Positional Arguments**:
  ```python
  def add(a, b):
      return a + b

  result = add(2, 3)  # Output: 5
  ```

- **Keyword Arguments**:
  ```python
  def greet(name, greeting="Hello"):
      print(f"{greeting}, {name}!")

  greet(name="Alice", greeting="Hi")  # Output: Hi, Alice!
  ```

- **Default Arguments**:
  ```python
  def greet(name, greeting="Hello"):
      print(f"{greeting}, {name}!")

  greet("Alice")  # Output: Hello, Alice!
  ```

- **Variable-Length Arguments**:
  ```python
  def sum_numbers(*args):
      return sum(args)

  print(sum_numbers(1, 2, 3))  # Output: 6
  ```

#### **2. Return Statement**

The `return` statement is used to exit a function and return a value to the caller.

**Example**:
```python
def square(number):
    return number ** 2

result = square(4)
print(result)  # Output: 16
```

#### **3. Lambda Functions**

Lambda functions are anonymous functions defined with the `lambda` keyword. They're used for short, one-liner functions that can be passed around.

**Syntax**:
```python
lambda arguments: expression
```

**Example**:
```python
multiply = lambda x, y: x * y
print(multiply(2, 3))  # Output: 6
```

#### **4. Recursion**

A recursive function is a function that calls itself in order to solve a problem. The key to recursion is having a **base case** that prevents infinite recursion.

**Example**:
```python
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

print(factorial(5))  # Output: 120
```

---

### **5. Introduction to Modules**

A **module** is a file containing Python definitions and statements. It allows you to organize functions, variables, and classes into logical groups.

#### **5.1 Importing Modules**

You can import a module using the `import` keyword.

**Example**:
```python
import math
print(math.sqrt(16))  # Output: 4.0
```

You can also import specific functions or variables from a module.

**Example**:
```python
from math import sqrt
print(sqrt(16))  # Output: 4.0
```

#### **5.2 Creating Your Own Module**

You can create your own module by saving Python code into a `.py` file and importing it into another Python script.

**Example**:

Create a file called `mymodule.py`:
```python
# mymodule.py
def greet(name):
    print(f"Hello, {name}!")
```

Then, in another file, import and use it:
```python
import mymodule
mymodule.greet("Alice")  # Output: Hello, Alice!
```

#### **5.3 `__name__` Variable**

Every Python module has a special built-in variable called `__name__`. This variable is used to check if the module is being run directly or imported.

- If the module is being run directly, `__name__` is set to `'__main__'`.
- If the module is being imported, `__name__` is set to the module's name.

**Example**:
```python
# mymodule.py
def greet(name):
    print(f"Hello, {name}!")

if __name__ == "__main__":
    greet("Alice")  # This will run only if the script is run directly.
```

---

### **6. Module Reloading**

If you make changes to a module while it is already imported, those changes won't reflect until you reload the module.

**Example**:
```python
import mymodule
# Make changes to mymodule.py
from importlib import reload
reload(mymodule)
```

---

### **7. Packages**

A **package** is a collection of modules in a directory. A package is typically a directory containing multiple Python files and a special `__init__.py` file.

#### **7.1 Creating a Package**

1. Create a directory for the package, e.g., `mypackage/`.
2. Inside `mypackage/`, create Python files (modules) and an `__init__.py` file.

**Example**:
```
mypackage/
    __init__.py
    module1.py
    module2.py
```

In the `__init__.py`, you can initialize the package or expose specific functions.

```python
# __init__.py
from .module1 import greet
```

Then, in another script, you can import the package and use its functions:
```python
from mypackage import greet
greet("Alice")  # Output: Hello, Alice!
```

---

### **8. Practical Example of Functions and Modules**

Here's a practical example that uses both functions and modules:

- **Step 1**: Create a module `math_operations.py`:
  ```python
  # math_operations.py
  def add(a, b):
      return a + b

  def multiply(a, b):
      return a * b
  ```

- **Step 2**: Create another script to use the module:
  ```python
  # main.py
  import math_operations

  num1, num2 = 3, 5
  sum_result = math_operations.add(num1, num2)
  product_result = math_operations.multiply(num1, num2)

  print(f"Sum: {sum_result}")  # Output: Sum: 8
  print(f"Product: {product_result}")  # Output: Product: 15
  ```

---

### **9. Summary**

- **Functions** help organize and reuse code. You can define them with `def`, accept arguments, and return values.
- **Lambda functions** provide a compact syntax for small, anonymous functions.
- **Modules** allow you to organize code into separate files, making it reusable across projects.
- **Packages** enable the grouping of related modules into a directory structure.

---

This chapter covers the essential concepts of functions and modules in Python. Let me know if you'd like to dive deeper into any specific section or move to the next chapter!