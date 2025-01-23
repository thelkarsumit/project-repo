# 04_input_output.py
# This file demonstrates how to use input() for taking user input and print() for displaying output.

# --- User Input with input() ---
# The input() function allows the program to take user input from the console.
# It always returns the input as a string.

# Example 1: Taking a single input and displaying it using print()
name = input("Enter your name: ")  # input() waits for user input
# Expected output: User will be prompted to enter their name
# Example Output: "John Doe"
print("Hello, " + name + "!")  # Concatenating user input with a greeting message
# Output will be: "Hello, John Doe!" (assuming the user entered "John Doe")

# --- Input with Conversion ---
# Since input() returns a string, you often need to convert it to another data type, like int or float.
# Example 2: Taking numeric input and performing arithmetic operation

age = input("Enter your age: ")  # User inputs their age as a string
age = int(age)  # Converting the string to an integer
# Expected output: User will input a number representing their age
# Example Output: "25"
print("You will be " + str(age + 1) + " next year.")  # Output: user's age increased by 1
# Output: "You will be 26 next year." (assuming the user entered "25")

# --- Handling Float Input ---
# You can also use input() to get float values and perform arithmetic operations.

weight = input("Enter your weight in kg: ")  # User inputs weight as a string
weight = float(weight)  # Convert string to float for decimal values
# Expected output: User inputs their weight, possibly with decimals.
# Example Output: "70.5"
height = input("Enter your height in meters: ")
height = float(height)  # Convert height to float
# Expected output: User enters height.
# Example Output: "1.75"
bmi = weight / (height ** 2)  # Calculate BMI using the formula
print("Your BMI is: " + str(round(bmi, 2)))  # Display BMI rounded to 2 decimal places
# Output: "Your BMI is: 22.98" (assuming weight is "70.5" and height is "1.75")

# --- Multiple Inputs on One Line ---
# You can use split() to take multiple inputs on a single line and separate them into a list.

# Example 3: Taking multiple inputs for name and age
user_input = input("Enter your name and age separated by space: ")
name, age = user_input.split()  # Split the input string into name and age
age = int(age)  # Convert age to an integer
# Expected output: User will input something like "Alice 30"
# Example Output: "Alice 30"
print("Name: " + name + ", Age: " + str(age))
# Output: "Name: Alice, Age: 30" (assuming the user entered "Alice 30")

# --- Taking Input in a Loop ---
# It’s possible to take multiple inputs in a loop until a certain condition is met.
# Example 4: Ask for a user's favorite color until they input 'quit'

while True:
    color = input("Enter your favorite color (or type 'quit' to stop): ")
    if color.lower() == 'quit':  # Checking for 'quit' to exit the loop
        break  # Exit the loop
    else:
        print("Your favorite color is: " + color)  # Print the color entered by user
        
# Expected output: User will keep entering colors until they type "quit"
# Example Output: "Your favorite color is: Blue", then "Your favorite color is: Red", and so on.
# Finally, once "quit" is entered, it will stop.

# --- Input with Default Values ---
# You can also provide a default value in case the user doesn't enter anything.

# Example 5: Use input with a default value (if user presses Enter without typing anything)
username = input("Enter your username (default is 'guest'): ") or 'guest'  # Default is 'guest' if input is empty
# Expected output: If user presses Enter without typing, default 'guest' is used.
# Example Output: If the user presses Enter without typing, "guest" will be used as the username.
print("Welcome, " + username + "!")  # Output: "Welcome, guest!" if nothing was entered.
# Output: "Welcome, guest!" (if the user didn't input anything)

# --- Formatting Output with f-strings ---
# f-strings (formatted string literals) provide a more readable way to embed expressions inside string literals.

# Example 6: Using f-strings to format and output values
first_name = "John"
last_name = "Doe"
age = 30
print(f"Hello, my name is {first_name} {last_name} and I am {age} years old.")
# Output: "Hello, my name is John Doe and I am 30 years old."

# --- String Formatting with % Operator ---
# Another way to format strings is by using the % operator (old method, but still useful in certain cases).

# Example 7: Using % operator for string formatting
print("Hello, my name is %s and I am %d years old." % (first_name, age))
# Output: "Hello, my name is John and I am 30 years old."

# --- Printing Multiple Values ---
# You can print multiple values at once with print() by separating them with commas.

# Example 8: Printing multiple values
name = "Jane"
age = 28
print("Name:", name, "Age:", age)  # Printing multiple variables in one print statement
# Output: "Name: Jane Age: 28"

# --- Formatted Printing with Separator ---
# You can use the `sep` argument in print() to specify how to separate multiple values.

# Example 9: Using sep parameter to change separator
print("apple", "banana", "cherry", sep=", ")  # Using a comma and space as separator
# Output: "apple, banana, cherry"

# --- End of Line Control ---
# You can control how `print()` ends its output using the `end` parameter.

# Example 10: Using end parameter
print("Hello", end=" ")  # Override the default newline behavior
print("World!")  # "World!" will be printed on the same line
# Output: "Hello World!" (printed on the same line)

# --- Conclusion ---
# In summary, input() is a versatile function for capturing user input, and print() is used for displaying output.
# These are the building blocks of interacting with the user in a Python program.

