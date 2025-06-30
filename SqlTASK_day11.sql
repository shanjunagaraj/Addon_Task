-- Task 1: Join students and marks
-- Create students and marks tables

CREATE DATABASE studentdb;
USE studentdb;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    mark INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Query

SELECT s.id, s.name, m.subject, m.mark
FROM students s
JOIN marks m ON s.id = m.student_id;

-- JDBC implementation

import java.sql.*;

public class StudentMarksJoin {
    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "root")) {
            String sql = "SELECT s.id, s.name, m.subject, m.mark " +
                         "FROM students s JOIN marks m ON s.id = m.student_id";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("--- Student Marks ---");
            while (rs.next()) {
                System.out.printf("ID: %d, Name: %s, Subject: %s, Mark: %d\n",
                        rs.getInt("id"), rs.getString("name"),
                        rs.getString("subject"), rs.getInt("mark"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


-- Task 2: Sub-query to find top performer
-- Query

SELECT name FROM students
WHERE id = (
    SELECT student_id FROM marks
    GROUP BY student_id
    ORDER BY SUM(mark) DESC
    LIMIT 1
);

-- JDBC implementation

import java.sql.*;

public class TopPerformer {
    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "root")) {
            String sql = "SELECT name FROM students " +
                         "WHERE id = (SELECT student_id FROM marks GROUP BY student_id ORDER BY SUM(mark) DESC LIMIT 1)";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                System.out.println("Top Performer: " + rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

 -- Task 3: Join orders and customers
 -- Query

SELECT c.id, c.name, o.product, o.amount
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- DBC implementation

import java.sql.*;

public class OrdersCustomersJoin {
    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/salesdb", "root", "root")) {
            String sql = "SELECT c.id, c.name, o.product, o.amount " +
                         "FROM customers c JOIN orders o ON c.id = o.customer_id";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("--- Orders with Customer Details ---");
            while (rs.next()) {
                System.out.printf("Customer ID: %d, Name: %s, Product: %s, Amount: %.2f\n",
                        rs.getInt("id"), rs.getString("name"),
                        rs.getString("product"), rs.getDouble("amount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

-- Task 4: Multi-table query app with filters

import java.sql.*;
import java.util.Scanner;

public class MultiTableQueryApp {
    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/salesdb", "root", "root")) {
            Scanner sc = new Scanner(System.in);
            int choice;

            do {
                System.out.println("\n--- Multi-table Query App ---");
                System.out.println("1. Show All Orders");
                System.out.println("2. Filter by Customer City");
                System.out.println("3. Filter Orders by Minimum Amount");
                System.out.println("4. Exit");
                System.out.print("Enter your choice: ");
                choice = sc.nextInt();
                sc.nextLine(); // consume newline

                switch (choice) {
                    case 1:
                        showAllOrders(conn);
                        break;
                    case 2:
                        System.out.print("Enter city name: ");
                        String city = sc.nextLine();
                        filterByCity(conn, city);
                        break;
                    case 3:
                        System.out.print("Enter minimum amount: ");
                        double amount = sc.nextDouble();
                        filterByAmount(conn, amount);
                        break;
                    case 4:
                        System.out.println("Exiting...");
                        break;
                    default:
                        System.out.println("Invalid choice.");
                }
            } while (choice != 4);

            sc.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void showAllOrders(Connection conn) throws SQLException {
        String sql = "SELECT c.id, c.name, c.city, o.product, o.amount " +
                     "FROM customers c JOIN orders o ON c.id = o.customer_id";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        System.out.println("--- All Orders ---");
        while (rs.next()) {
            System.out.printf("Customer ID: %d, Name: %s, City: %s, Product: %s, Amount: %.2f\n",
                    rs.getInt("id"), rs.getString("name"),
                    rs.getString("city"), rs.getString("product"),
                    rs.getDouble("amount"));
        }
    }

    public static void filterByCity(Connection conn, String city) throws SQLException {
        String sql = "SELECT c.id, c.name, c.city, o.product, o.amount " +
                     "FROM customers c JOIN orders o ON c.id = o.customer_id " +
                     "WHERE c.city = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, city);
        ResultSet rs = pstmt.executeQuery();

        System.out.println("--- Orders from " + city + " ---");
        while (rs.next()) {
            System.out.printf("Customer ID: %d, Name: %s, Product: %s, Amount: %.2f\n",
                    rs.getInt("id"), rs.getString("name"),
                    rs.getString("product"), rs.getDouble("amount"));
        }
    }

    public static void filterByAmount(Connection conn, double amount) throws SQLException {
        String sql = "SELECT c.id, c.name, c.city, o.product, o.amount " +
                     "FROM customers c JOIN orders o ON c.id = o.customer_id " +
                     "WHERE o.amount >= ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setDouble(1, amount);
        ResultSet rs = pstmt.executeQuery();

        System.out.println("--- Orders above " + amount + " ---");
        while (rs.next()) {
            System.out.printf("Customer ID: %d, Name: %s, City: %s, Product: %s, Amount: %.2f\n",
                    rs.getInt("id"), rs.getString("name"),
                    rs.getString("city"), rs.getString("product"),
                    rs.getDouble("amount"));
        }
    }
}

