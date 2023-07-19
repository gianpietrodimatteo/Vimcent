// C Example

#include <stdio.h>

// Function declaration
void greet(char* name);

int main() {
    // Variables and data types
    int number = 10;
    float pi = 3.14159;
    char message[] = "Hello, World!";

    // Conditional statements
    if (number > 5) {
        printf("Number is greater than 5\n");
    } else {
        printf("Number is not greater than 5\n");
    }

    // Loops
    for (int i = 0; i < 5; i++) {
        printf("%d\n", i);
    }

    int i = 0;
    while (i < 5) {
        printf("%d\n", i);
        i++;
    }

    // Arrays
    int numbers[] = { 1, 2, 3, 4, 5 };
    int size = sizeof(numbers) / sizeof(numbers[0]);

    for (int i = 0; i < size; i++) {
        printf("%d\n", numbers[i]);
    }

    // Function call
    greet("John");

    return 0;
}

// Function definition
void greet(char* name) {
    printf("Hello, %s!\n", name);
}
