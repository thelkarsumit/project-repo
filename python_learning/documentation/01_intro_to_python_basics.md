# 01. Introduction to Python Basics

## Overview
Python is a high-level, interpreted programming language designed to be easy to read and write. It’s known for its clean syntax and ease of use, making it a great choice for beginners and professionals alike. Python is versatile, being used in various fields such as web development, data science, automation, and cloud computing.

In this chapter, we'll cover:
- Installing Python
- Setting up an IDE
- Writing your first Python script
- Understanding Python's syntax

---

## Installing Python

To get started with Python, the first step is to install it on your system. Python is available for Windows, macOS, and Linux. Here's how you can install it:

### Windows
1. **Download Python**: Go to the official Python website: [https://www.python.org/downloads/](https://www.python.org/downloads/) and download the latest version for Windows.
2. **Run the installer**: Launch the installer and make sure to check the box "Add Python to PATH" before clicking "Install Now."
3. **Verify the installation**: Open Command Prompt and type:
   ```bash
   python --version
   ```
   This should display the installed Python version.

### macOS / Linux
- **macOS**: Python comes pre-installed on macOS. You can check the installed version using:
  ```bash
  python3 --version
  ```
- **Linux**: Most Linux distributions come with Python pre-installed. You can check by running:
  ```bash
  python3 --version
  ```
  If Python isn't installed, you can install it using a package manager (e.g., `apt`, `yum`).

---

## Setting Up an IDE

While you can write Python code in any text editor, using an Integrated Development Environment (IDE) makes it easier. Here are some popular IDEs for Python:

- **VSCode**: A powerful and lightweight IDE with support for Python.
- **PyCharm**: A full-featured IDE tailored for Python development.
- **Jupyter Notebook**: Great for data science and working with Python interactively.

### Installing VSCode (as an example)
1. **Download**: Go to [https://code.visualstudio.com/](https://code.visualstudio.com/) and download the installer for your platform.
2. **Install the Python extension**: Open VSCode, go to the Extensions view (Ctrl+Shift+X), and search for the "Python" extension by Microsoft.

---

## Writing Your First Python Script

Now that Python is installed and you have an IDE set up, let’s write your first Python script!

### Example 1: "Hello, World!" Program

1. Open your IDE and create a new file named `hello_world.py`.
2. Write the following code:

```python
print("Hello, World!")
```

3. Save the file and run it.

   - In VSCode: Press `Ctrl+Shift+B` or open the terminal and type:
     ```bash
     python hello_world.py
     ```
   
   - In the terminal (if you’re using macOS/Linux or Windows):
     ```bash
     python hello_world.py
     ```

You should see the output:
```
Hello, World!
```

### Explanation:
- `print()`: This function prints the specified message to the console. It's the simplest way to get output from a Python program.

---

## Understanding Python Syntax

Python is known for its simple and readable syntax. Here are some basic concepts:

### 1. Indentation
Python uses indentation (spaces or tabs) to define blocks of code. This is crucial, as Python relies on indentation rather than braces (`{}`) to group statements.

```python
if True:
    print("This is indented")
```

In the example above, the line `print("This is indented")` is part of the `if` block because it's indented.

### 2. Variables and Data Types

#### Variables:
Variables are used to store data. In Python, you don’t need to declare the type of a variable explicitly.

```python
name = "John"
age = 25
```

#### Data Types:
Python supports several built-in data types:
- **String** (`str`): A sequence of characters.
- **Integer** (`int`): Whole numbers.
- **Float** (`float`): Decimal numbers.
- **Boolean** (`bool`): `True` or `False`.

Example:
```python
name = "Alice"    # String
age = 30          # Integer
height = 5.7      # Float
is_student = True # Boolean
```

---

## Next Steps

In the following chapters, you’ll learn how to use variables, work with more advanced data structures, handle errors, and build larger programs. We will also dive into Python’s rich ecosystem of libraries and frameworks, setting you up to use Python with cloud services like Google Cloud Platform (GCP).

---

## Conclusion

In this chapter, you’ve learned how to:
- Install Python and set up an IDE.
- Write your first Python script.
- Understand basic Python syntax, variables, and data types.

Now that you’ve completed the first chapter, you’re ready to dive deeper into Python. In the next chapter, we’ll explore more advanced data types and control structures.

---