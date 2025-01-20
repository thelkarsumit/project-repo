# Working With Files. 

## Chapter 06: Working with Files in Python

### Overview
In this chapter, we'll learn how to handle file input/output (I/O) in Python. We'll cover reading from and writing to text files, as well as more advanced techniques for working with different file formats like CSV, JSON, and others. 

---

### 1. **Reading and Writing Text Files**

#### **Opening a File**

In Python, the built-in `open()` function is used to open a file. The function returns a file object, which can be used to read or write to the file.

```python
# Syntax: open('filename', 'mode')
file = open('example.txt', 'r')  # 'r' is read mode
```

The `open()` function takes two parameters:
- **filename**: The name of the file you want to open.
- **mode**: The mode in which to open the file. Common modes are:
  - `'r'` for reading (default mode)
  - `'w'` for writing (creates a new file or truncates an existing file)
  - `'a'` for appending to a file
  - `'b'` for binary mode (e.g., `'rb'`, `'wb'`)

#### **Reading from a File**

There are several methods to read from a file:

- **`read()`**: Reads the entire content of the file.

```python
with open('example.txt', 'r') as file:
    content = file.read()
    print(content)
```

- **`readline()`**: Reads one line at a time.

```python
with open('example.txt', 'r') as file:
    line = file.readline()
    while line:
        print(line, end="")
        line = file.readline()
```

- **`readlines()`**: Reads all lines into a list.

```python
with open('example.txt', 'r') as file:
    lines = file.readlines()
    for line in lines:
        print(line, end="")
```

#### **Writing to a File**

- **`write()`**: Writes a string to the file. It overwrites the file if it exists (use `'w'` mode).

```python
with open('output.txt', 'w') as file:
    file.write("Hello, World!\n")
    file.write("This is a second line.")
```

- **`writelines()`**: Writes a list of strings to the file.

```python
lines = ["Line 1\n", "Line 2\n", "Line 3\n"]
with open('output.txt', 'w') as file:
    file.writelines(lines)
```

---

### 2. **Context Manager (`with` Statement)**

Python provides a context manager (`with` statement) for automatically closing files after operations are complete. This ensures that resources are properly cleaned up even if an exception occurs.

```python
with open('example.txt', 'r') as file:
    content = file.read()
    print(content)
```

When the `with` block exits, the file is automatically closed, making the code cleaner and more reliable.

---

### 3. **Working with File Paths**

You can use the `os` module to manipulate file paths. The `os.path` module provides functions to work with file and directory paths.

```python
import os

# Get the absolute path of a file
abs_path = os.path.abspath('example.txt')
print(abs_path)

# Join paths in a cross-platform manner
file_path = os.path.join('folder', 'example.txt')
print(file_path)
```

#### **Other Useful File Operations**
- **`os.remove('filename')`**: Removes a file.
- **`os.rename('old_name', 'new_name')`**: Renames a file.
- **`os.mkdir('directory_name')`**: Creates a new directory.

---

### 4. **Reading and Writing CSV Files**

Python has a built-in module `csv` for working with CSV (Comma-Separated Values) files.

#### **Reading CSV Files**

```python
import csv

with open('example.csv', 'r') as file:
    reader = csv.reader(file)
    for row in reader:
        print(row)
```

#### **Writing to CSV Files**

```python
import csv

header = ['Name', 'Age', 'City']
rows = [['John', 25, 'New York'], ['Anna', 28, 'London'], ['Mike', 30, 'San Francisco']]

with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(rows)
```

The `newline=''` parameter ensures that the CSV file is written correctly across different platforms.

---

### 5. **Reading and Writing JSON Files**

JSON (JavaScript Object Notation) is a popular data format for storing and exchanging data. Python has a built-in `json` module to work with JSON data.

#### **Reading JSON Files**

```python
import json

with open('data.json', 'r') as file:
    data = json.load(file)
    print(data)
```

#### **Writing JSON Files**

```python
import json

data = {'name': 'John', 'age': 30, 'city': 'New York'}

with open('output.json', 'w') as file:
    json.dump(data, file, indent=4)
```

The `json.dump()` method writes data to a JSON file, and the `indent=4` argument makes the output more readable.

---

### 6. **File Exception Handling**

When working with files, it's important to handle potential errors such as file not found or permission errors.

#### **Handling File Not Found Error**

```python
try:
    with open('nonexistent_file.txt', 'r') as file:
        content = file.read()
except FileNotFoundError:
    print("The file was not found.")
```

#### **Handling Other Exceptions**

You can also handle other types of exceptions, such as permission errors.

```python
try:
    with open('example.txt', 'r') as file:
        content = file.read()
except IOError:
    print("An error occurred while accessing the file.")
```

---

### 7. **Practical Examples**

#### **Example 1: Reading and Writing a Log File**

Let's create a simple script that appends logs to a file:

```python
import datetime

def log_message(message):
    with open('app_log.txt', 'a') as file:
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        file.write(f'{timestamp} - {message}\n')

log_message("App started.")
log_message("App finished.")
```

#### **Example 2: Reading CSV and Converting Data to JSON**

This script reads data from a CSV file and writes it to a JSON file:

```python
import csv
import json

csv_file = 'data.csv'
json_file = 'data.json'

data = []
with open(csv_file, 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        data.append(row)

with open(json_file, 'w') as file:
    json.dump(data, file, indent=4)
```

---

### Conclusion

Working with files is a crucial skill in Python, as it allows you to handle data stored in text, CSV, JSON, and other formats. By mastering file I/O operations, you'll be able to automate tasks, manipulate data, and create powerful Python scripts. 
