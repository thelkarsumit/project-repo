import os

def generate_toc(directory, depth=0):
    """
    Recursively generates a Table of Contents (ToC) for a directory structure.
    :param directory: The path to the directory
    :param depth: The current depth of recursion (used for indentation)
    :return: List of strings representing the ToC
    """
    toc = []
    # List all items in the directory
    for item in os.listdir(directory):
        item_path = os.path.join(directory, item)
        if os.path.isdir(item_path):  # If it's a directory, add it to the ToC with subdirectories
            toc.append(f"{'  ' * depth}- **{item}/**")
            toc += generate_toc(item_path, depth + 1)  # Recurse into the subdirectory
        else:  # If it's a file, just add it as a regular item
            toc.append(f"{'  ' * depth}- {item}")
    return toc

def update_readme():
    """
    Updates the README.md file with a generated ToC from the project directory structure.
    """
    base_dir = './'  # Adjust this to the root directory of your project
    toc = generate_toc(base_dir)
    # Write the ToC to the README.md file
    with open('README.md', 'w') as file:
        file.write('# Project Folder Structure\n\n')
        file.write('\n'.join(toc))  # Join the list into a string with newlines for each item

if __name__ == "__main__":
    update_readme()
