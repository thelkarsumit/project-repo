# 03_string_manipulation.py
# This script demonstrates the use of various string methods in Python:
# strip(), lower(), upper(), replace(), split(), and slicing.

# 1. strip() - Removes leading and trailing whitespaces from a string
text = "  Hello, World!  "
stripped_text = text.strip()  # Removes the leading and trailing spaces
print("Original Text:", text)  # Original string with spaces
print("After strip():", stripped_text)  # Text without leading/trailing spaces

# Output:
# Original Text:   Hello, World!  
# After strip(): Hello, World!

# 2. lower() - Converts all characters in a string to lowercase
text_lower = text.lower()
print("\nOriginal Text:", text)
print("After lower():", text_lower)

# Output:
# Original Text:   Hello, World!  
# After lower():   hello, world!  

# 3. upper() - Converts all characters in a string to uppercase
text_upper = text.upper()
print("\nOriginal Text:", text)
print("After upper():", text_upper)

# Output:
# Original Text:   Hello, World!  
# After upper():   HELLO, WORLD!  

# 4. replace() - Replaces a substring within the string with another substring
replaced_text = text.replace("World", "Universe")
print("\nOriginal Text:", text)
print("After replace():", replaced_text)

# Output:
# Original Text:   Hello, World!  
# After replace():   Hello, Universe!  

# 5. split() - Splits a string into a list based on a delimiter (by default, whitespace)
text_split = text.split()  # Splits by whitespace (default behavior)
print("\nOriginal Text:", text)
print("After split():", text_split)  # This will split text into a list of words

# Output:
# Original Text:   Hello, World!  
# After split(): ['Hello,', 'World!']

# 6. Slicing - Extracts a substring from a string based on the provided start and end indices
substring = text[2:7]  # Extracts characters from index 2 to 6 (end index exclusive)
print("\nOriginal Text:", text)
print("Substring (text[2:7]):", substring)

# Output:
# Original Text:   Hello, World!  
# Substring (text[2:7]): llo, 

# 7. Slicing with negative indices - You can use negative indices to slice from the end
substring_negative = text[-7:-1]  # Extracts characters from 7th last to 2nd last
print("\nOriginal Text:", text)
print("Substring with negative indices (text[-7:-1]):", substring_negative)

# Output:
# Original Text:   Hello, World!  
# Substring with negative indices (text[-7:-1]): World

# Conclusion:
# Each method works in its unique way to manipulate strings. These methods are very helpful for tasks like cleaning user input, formatting strings, and processing text data.
