# Difference Between for Loop and while Loop:
#   for loop:
#       1: Used when you know how many times you want to execute the loop.
#       2: Typically used with a counter or an iterator (e.g., a range or list).

#   while loop:
#       1: Used when you do not know how many times you want to execute the loop beforehand.
#       2: It runs as long as the specified condition evaluates to True. 

# Use Case 1: Using a for loop to find numbers divisible by both 7 and 9 in the first 1000 numbers
def divisible_for_loop():
    count = 0
    for num in range(1, 1001):
        if num % 7 == 0 and num % 9 == 0:
            count += 1
    print(f"Numbers divisible by both 7 and 9 in the first 1000 numbers: {count}")

# Use Case 2: Using a while loop to find the 1000th number divisible by both 7 and 9
def divisible_while_loop():
    count = 0
    num = 1
    while count < 1000:
        if num % 7 == 0 and num % 9 == 0:
            count += 1
        num += 1
    print(f"The 1000th number divisible by both 7 and 9 is: {num - 1}")

if __name__ == "__main__":
    divisible_for_loop()
    divisible_while_loop()

#I want to test this with commit and push and github Action try.
