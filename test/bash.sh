#!/bin/bash

# Bash Example

# Variables
name="John"
age=25

# Conditional statements
if [ $age -gt 18 ]; then
    echo "You are an adult."
else
    echo "You are not an adult."
fi

# Loop
for i in 1 2 3 4 5; do
    echo $i
done

# Function
greet() {
    echo "Hello, $1!"
}

greet $name

# Command substitution
current_date=$(date +%Y-%m-%d)
echo "Today's date is $current_date."

# File manipulation
file="example.txt"
if [ -f $file ]; then
    echo "File $file exists."
else
    echo "File $file does not exist."
fi

# Command-line arguments
echo "First argument: $1"
echo "Second argument: $2"
