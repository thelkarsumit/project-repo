### **Script Overview**

The purpose of the script is to generate a Table of Contents (ToC) for a project directory structure, with some customizations:
- The ToC includes only **folder names** (excluding files).
- The script **limits the recursion depth to 4 levels** (you can adjust this by modifying the `max_depth`).
- It **excludes certain folders** (like `.git`, `node_modules`, `__pycache__`).
- The ToC is written inside **triple backticks** (```text) to make it look clean and properly formatted on GitHub.

---

### **Step-by-Step Explanation**

1. **Imports and Functions**:
   ```python
   import os
   ```

   - **`os`**: This module provides functions for interacting with the operating system. We use `os.listdir()` to list the contents of a directory and `os.path.isdir()` to check whether a specific item is a directory (folder).

2. **The `generate_toc` Function**:

   ```python
   def generate_toc(directory, depth=0, exclude_folders=None, max_depth=4):
   ```

   - This function is **recursive** and generates the Table of Contents for the given directory structure.
   - **Parameters**:
     - `directory`: The path to the directory to start scanning.
     - `depth`: The current level of recursion (starting from `0` for the root).
     - `exclude_folders`: A list of folders to **exclude** from the ToC (e.g., `.git`, `node_modules`).
     - `max_depth`: The maximum recursion depth (set to `4` in this case). If this limit is exceeded, the recursion stops.

3. **Initial Setup**: 

   ```python
   if exclude_folders is None:
       exclude_folders = []
   ```

   - If the `exclude_folders` parameter is not passed, it defaults to an empty list. This ensures that we don’t run into errors if the user doesn't specify any folders to exclude.

4. **Prepare ToC List**:

   ```python
   toc = []
   ```

   - We initialize an empty list `toc` that will store the folder structure in the desired format.

5. **List Directory Contents**:

   ```python
   items = os.listdir(directory)
   ```

   - `os.listdir(directory)` lists all **files and folders** in the specified directory. It includes hidden files/folders like `.git` by default.

6. **Sort Items**:

   ```python
   items.sort()
   ```

   - We sort the list of items to ensure that the folders appear first, followed by any files (if any).

7. **Limit Recursion Depth**:

   ```python
   if depth > max_depth:
       return toc
   ```

   - **Recursion depth control**: If the current recursion depth exceeds the `max_depth` (which is 4 by default), the function will stop and return the current `toc` list. This prevents the script from scanning deeper than the 4th level of subdirectories.

8. **Loop Through Items**:

   ```python
   for idx, item in enumerate(items):
       item_path = os.path.join(directory, item)
   ```

   - We loop through all items in the directory. For each item, we build its **absolute path** using `os.path.join()`, which ensures the script works on different operating systems.

9. **Check If Item is a Folder and Not Excluded**:

   ```python
   if os.path.isdir(item_path) and item not in exclude_folders:
   ```

   - The `os.path.isdir(item_path)` checks if the item is a **folder**.
   - `item not in exclude_folders` ensures that we skip folders listed in the `exclude_folders` list (like `.git`, `node_modules`, `__pycache__`).

10. **Format Folder and Add to ToC**:

    ```python
    if depth == 0:
        toc.append(f"{'    ' * depth}├── {item}/")
    else:
        toc.append(f"{'│   ' * depth}├── {item}/")
    ```

    - **Formatting the folder structure**:
      - For the **root folder** (i.e., `depth == 0`), we simply prepend `"├── "` to the folder name.
      - For **subfolders**, we prepend `"│   "` to maintain the tree-like structure.

11. **Recursion for Subfolders**:

    ```python
    toc += generate_toc(item_path, depth + 1, exclude_folders, max_depth)
    ```

    - After adding the folder to the ToC, we **recurse into its subdirectories** by calling `generate_toc` with the updated `depth` (`depth + 1`).
    - This recursive call will explore the folder’s subfolders and repeat the process until it reaches the maximum allowed depth.

12. **Return the ToC**:

    ```python
    return toc
    ```

    - Once all subdirectories are processed, the function returns the `toc` list, which contains the formatted folder structure.

---

### **The `update_readme` Function**

```python
def update_readme():
    base_dir = './'  # The root directory of your project (adjust if needed)
    exclude_folders = ['.git', 'node_modules', '__pycache__']  # Example folders to exclude
```

- The `base_dir` variable holds the path to the root directory of the project (you can modify this if needed).
- The `exclude_folders` list contains the folders we want to **exclude** from the Table of Contents (e.g., `.git`, `node_modules`).

```python
toc = generate_toc(base_dir, exclude_folders=exclude_folders)
```

- We call the `generate_toc` function to generate the Table of Contents for the root directory (`base_dir`). We pass the list of folders to exclude (`exclude_folders`) to the function.

```python
with open('README.md', 'w') as file:
    file.write('# Project Folder Structure\n\n')
    file.write('```text\n')  # Start the code block
    file.write('\n'.join(toc))  # Join the list into a string with newlines for each item
    file.write('\n```')  # End the code block
```

- We open the `README.md` file in **write mode** (`'w'`).
- The first line in the file is the heading `# Project Folder Structure`, which introduces the Table of Contents.
- We wrap the ToC inside a **code block** by adding triple backticks (` ```text `) at the beginning and end of the ToC content.
- The `'\n'.join(toc)` converts the list of folder structures (`toc`) into a single string, with each item separated by a newline (`\n`).

---

### **Main Section**

```python
if __name__ == "__main__":
    update_readme()
```

- This checks if the script is being run directly (i.e., not imported as a module). If true, it will call the `update_readme` function to generate the ToC and update the `README.md` file.

---

### **Summary of Flow**

1. The script starts by calling the `update_readme()` function.
2. `update_readme()` calls `generate_toc()` to recursively generate a list of folders in the project directory up to a depth of 4.
3. The script excludes specific folders (like `.git`, `node_modules`, and `__pycache__`).
4. The script writes the formatted folder structure inside triple backticks into the `README.md` file.
5. The result is a well-structured ToC that appears as a code block in the `README.md`, showing only the folder structure up to the 4th level.

---