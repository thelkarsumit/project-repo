import os

def generate_toc(directory, depth=0, exclude_folders=None, max_depth=4):
    """
    Recursively generates a Table of Contents (ToC) for a directory structure.
    Files will be included only for depth 0 and depth 1; from depth 2 onwards, only folders are listed.
    :param directory: The path to the directory
    :param depth: The current depth of recursion (used for indentation)
    :param exclude_folders: List of folder names to exclude from the ToC
    :param max_depth: The maximum depth level to traverse (default is 4)
    :return: List of strings representing the ToC
    """
    if exclude_folders is None:
        exclude_folders = []

    toc = []
    # List all items in the directory, including hidden folders (dot folders)
    items = os.listdir(directory)
    
    # Sort items so folders appear before files (if any)
    items.sort()

    # Recursion will stop at max_depth (depth > max_depth means we stop)
    if depth > max_depth:
        return toc

    for idx, item in enumerate(items):
        item_path = os.path.join(directory, item)
               # Skip hidden folders (those starting with a dot)
        if item.startswith('.'):
            continue 
        # Check if the item is a folder and not in the exclude list
        if os.path.isdir(item_path) and item not in exclude_folders:
            # Format the folder and add it to the ToC
            if depth == 0:
                toc.append(f"{'    ' * depth}├── {item}/")
            elif depth == 1:
                toc.append(f"{'│   ' * depth}├── {item}/")
            else:
                toc.append(f"{'│   ' * depth}├── {item}/")
            
            # Recurse into subdirectories if the depth is less than max_depth
            toc += generate_toc(item_path, depth + 1, exclude_folders, max_depth)
        
        # For depth 0 and depth 1, if the item is a file, include it in the ToC
        elif depth < 2 and os.path.isfile(item_path):
            if depth == 0:
                toc.append(f"{'    ' * depth}├── {item}")
            elif depth == 1:
                toc.append(f"{'│   ' * depth}├── {item}")

    return toc

def update_readme():
    """
    Updates the README.md file with a generated ToC from the project directory structure.
    """
    base_dir = '../../'  # The root directory of your project (adjust if needed)
    
    # Define unwanted folders to be excluded from the ToC
    exclude_folders = ['.git','.gitignore','node_modules', '__pycache__','.codeoss',]  # Example folders to exclude
    
    toc = generate_toc(base_dir, exclude_folders=exclude_folders)
    
    # Write the ToC to the README.md file
    with open('../../00_repo-folder-structure.md', 'w') as file:
        file.write('# Project Folder Structure\n\n')
        file.write('```text\n')  # Start the code block
        file.write('\n'.join(toc))  # Join the list into a string with newlines for each item
        file.write('\n```')  # End the code block.

if __name__ == "__main__":
    update_readme()
