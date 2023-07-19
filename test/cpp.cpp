// C++ Example

#include <iostream>
#include <vector>

// Function declaration
void greet(const std::string& name);

int main() {
    // Variables and data types
    int number = 10;
    double pi = 3.14159;
    std::string message = "Hello, World!";

    // Conditional statements
    if (number > 5) {
        std::cout << "Number is greater than 5" << std::endl;
    } else {
        std::cout << "Number is not greater than 5" << std::endl;
    }

    // Loops
    for (int i = 0; i < 5; i++) {
        std::cout << i << std::endl;
    }

    int i = 0;
    while (i < 5) {
        std::cout << i << std::endl;
        i++;
    }

    // Vectors
    std::vector<std::string> names = { "John", "Jane", "Alice" };
    for (const std::string& name : names) {
        std::cout << name << std::endl;
    }

    // Function call
    greet("John");

    return 0;
}

// Function definition
void greet(const std::string& name) {
    std::cout << "Hello, " << name << "!" << std::endl;
}
