import os

def generate_toc(directory, depth=0):
    """
    Recursively generates a Table of Contents (ToC) for a directory structure.
    Only directories (folders) will be listed, not files.
    :param directory: The path to the directory
    :param depth: The current depth of recursion (used for indentation)
    :return: List of strings representing the ToC
    """
    toc = []
    # List all items in the directory
    items = os.listdir(directory)
    
    # Sort items so folders appear before files (if any)
    items.sort()

    for idx, item in enumerate(items):
        item_path = os.path.join(directory, item)
        if os.path.isdir(item_path):  # If it's a directory, add it to the ToC
            # Add indentation based on depth and format it with lines
            if depth == 0:
                toc.append(f"{'    ' * depth}├── {item}/")
            else:
                toc.append(f"{'│   ' * depth}├── {item}/")
            # Recurse into subdirectories
            toc += generate_toc(item_path, depth + 1)
            
    return toc

def update_readme():
    """
    Updates the README.md file with a generated ToC from the project directory structure.
    """
    base_dir = './'  # The root directory of your project (adjust if needed)
    toc = generate_toc(base_dir)
    # Write the ToC to the README.md file
    with open('README.md', 'w') as file:
        file.write('# Project Folder Structure\n\n')
        file.write('\n'.join(toc))  # Join the list into a string with newlines for each item

if __name__ == "__main__":
    update_readme()
