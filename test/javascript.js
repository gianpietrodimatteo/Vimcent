// Reserved words
var let = 10;
const PI = 3.14159;

// Conditional statements
if (let > 5) {
  console.log("let is greater than 5");
} else {
  console.log("let is not greater than 5");
}

// Loops
for (let i = 0; i < 5; i++) {
  console.log(i);
}

let i = 0;
while (i < 5) {
  console.log(i);
  i++;
}

// Functions
function greet(name) {
  console.log("Hello, " + name + "!");
}

greet("John");

// Objects
const person = {
  name: "John",
  age: 25,
  hobbies: ["reading", "gaming", "traveling"],
  greet: function() {
    console.log("Hello, my name is " + this.name + ".");
  }
};

person.greet();

// Arrays
const numbers = [1, 2, 3, 4, 5];
console.log(numbers.length);
console.log(numbers[2]);

// String methods
const message = "Hello, World!";
console.log(message.length);
console.log(message.toUpperCase());
console.log(message.indexOf("World"));

// Error handling
try {
  undefinedFunction();
} catch (error) {
  console.log("An error occurred: " + error.message);
}

// Classes
class Rectangle {
  constructor(width, height) {
    this.width = width;
    this.height = height;
  }

  getArea() {
    return this.width * this.height;
  }
}

const rectangle = new Rectangle(5, 10);
console.log(rectangle.getArea());
