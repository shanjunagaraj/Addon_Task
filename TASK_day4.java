// TASK1:
  import java.util.Scanner;

public class DivideByZeroHandling {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter numerator: ");
        int numerator = sc.nextInt();

        System.out.print("Enter denominator: ");
        int denominator = sc.nextInt();

        try {
            int result = numerator / denominator;
            System.out.println("Result: " + result);
        } catch (ArithmeticException e) {
            System.out.println("Error: Cannot divide by zero.");
        }

        System.out.println("Program continues...");
        sc.close();
    }
}

//TASK2:
import java.io.*;

public class SimpleBufferedReader {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader("example.txt"));
            String line;

            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            reader.close();
        } catch (IOException e) {
            System.out.println("Error reading the file.");
        }
    }
}

TASK3:

import java.io.FileWriter;
import java.io.IOException;

public class SimpleFileWrite {
    public static void main(String[] args) {
        try {
            FileWriter writer = new FileWriter("output.txt");

            writer.write("First line\n");
            writer.write("Second line\n");
            writer.write("Third line\n");

            writer.close();
            System.out.println("Successfully wrote to the file.");

        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}

//MAIN PROGRAM:

import java.io.*;

public class SimpleResultProcessing {
    public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("marks.txt"));
             BufferedWriter writer = new BufferedWriter(new FileWriter("result.txt"))) {

            writer.write("Name Total");
            writer.newLine();

            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(" ");
                String name = parts[0];
                int total = 0;

                for (int i = 1; i < parts.length; i++) {
                    total += Integer.parseInt(parts[i]);
                }

                writer.write(name + " " + total);
                writer.newLine();
            }

            System.out.println("Result written successfully.");

        } catch (IOException e) {
            System.out.println("Error occurred.");
        }
    }
}

