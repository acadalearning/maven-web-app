# Define eligible_voting_age variable
eligible_voting_age = 18

# Get the age from user input
age = int(input("Enter your age: "))

# Check if age meets voting eligibility
if age >= eligible_voting_age:
    print("You are eligible to vote!")
else:
    print("You are not eligible to vote yet.")
