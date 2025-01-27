import os

def generate_toc(directory, depth=0, exclude_folders=None):
    """
    Recursively generates a Table of Contents (ToC) for a directory structure.
    Only directories (folders) will be listed, not files.
    :param directory: The path to the directory
    :param depth: The current depth of recursion (used for indentation)
    :param exclude_folders: List of folder names to exclude from the ToC
    :return: List of strings representing the ToC
    """
    if exclude_folders is None:
        exclude_folders = []

    toc = []
    # List all items in the directory, including hidden folders (dot folders)
    items = os.listdir(directory)
    
    # Sort items so folders appear before files (if any)
    items.sort()

    for idx, item in enumerate(items):
        item_path = os.path.join(directory, item)
        
        # Check if the item is a folder and not in the exclude list
        if os.path.isdir(item_path) and item not in exclude_folders:
            # Format the folder and add it to the ToC
            if depth == 0:
                toc.append(f"{'    ' * depth}├── {item}/")
            else:
                toc.append(f"{'│   ' * depth}├── {item}/")
            # Recurse into subdirectories
            toc += generate_toc(item_path, depth + 1, exclude_folders)

    return toc

def update_readme():
    """
    Updates the README.md file with a generated ToC from the project directory structure.
    """
    base_dir = './'  # The root directory of your project (adjust if needed)
    
    # Define unwanted folders to be excluded from the ToC
    exclude_folders = ['.git', 'node_modules', '__pycache__']  # Example folders to exclude
    
    toc = generate_toc(base_dir, exclude_folders=exclude_folders)
    
    # Write the ToC to the README.md file
    with open('README.md', 'w') as file:
        file.write('# Project Folder Structure\n\n')
        file.write('```text\n')  # Start the code block
        file.write('\n'.join(toc))  # Join the list into a string with newlines for each item
        file.write('\n```')  # End the code block

if __name__ == "__main__":
    update_readme()
