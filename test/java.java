// Java Example

import java.util.ArrayList;
import java.util.List;

public class JavaExample {
    public static void main(String[] args) {
        // Variables and data types
        int number = 10;
        double pi = 3.14159;
        String message = "Hello, World!";

        // Conditional statements
        if (number > 5) {
            System.out.println("Number is greater than 5");
        } else {
            System.out.println("Number is not greater than 5");
        }

        // Loops
        for (int i = 0; i < 5; i++) {
            System.out.println(i);
        }

        int i = 0;
        while (i < 5) {
            System.out.println(i);
            i++;
        }

        // Lists
        List<String> names = new ArrayList<>();
        names.add("John");
        names.add("Jane");
        names.add("Alice");

        for (String name : names) {
            System.out.println(name);
        }

        // Methods
        greet("John");

        // Classes and objects
        Rectangle rectangle = new Rectangle(5, 10);
        double area = rectangle.getArea();
        System.out.println("Area: " + area);
    }

    public static void greet(String name) {
        System.out.println("Hello, " + name + "!");
    }
}

class Rectangle {
    private int width;
    private int height;

    public Rectangle(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public int getArea() {
        return width * height;
    }
}
