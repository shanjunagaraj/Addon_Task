//TASk : 1

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/studentdb";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully.");
        } catch (SQLException e) {
            System.out.println("Error connecting to database: " + e.getMessage());
        }
        return conn;
    }

    public static void main(String[] args) {
        getConnection(); // Test connection
    }
}


//TASK : 1

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertStudent {
    public static void main(String[] args) {
        Connection conn = DatabaseConnection.getConnection();

        if (conn != null) {
            String sql = "INSERT INTO students (name, grade) VALUES (?, ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "John Doe");
                pstmt.setString(2, "A");
                int rows = pstmt.executeUpdate();
                System.out.println(rows + " student(s) inserted successfully.");
            } catch (SQLException e) {
                System.out.println("Error inserting data: " + e.getMessage());
            }
        }
    }
}


//TASK :3


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DisplayStudents {
    public static void main(String[] args) {
        Connection conn = DatabaseConnection.getConnection();

        if (conn != null) {
            try {
                String sql = "SELECT * FROM students";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                System.out.println("--- Student List ---");
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String grade = rs.getString("grade");

                    System.out.println("ID: " + id + ", Name: " + name + ", Grade: " + grade);
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error retrieving data: " + e.getMessage());
            }
        }
    }
}

//TASK :4 (Main program)

import java.sql.*;
import java.util.Scanner;

public class StudentDBManager {
    private static Connection conn = DatabaseConnection.getConnection();

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n--- Student DB Manager ---");
            System.out.println("1. View All Students");
            System.out.println("2. Add Student");
            System.out.println("3. Delete Student");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();
            sc.nextLine(); // consume newline

            switch (choice) {
                case 1:
                    viewAllStudents();
                    break;
                case 2:
                    addStudent(sc);
                    break;
                case 3:
                    deleteStudent(sc);
                    break;
                case 4:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.out.println("Invalid choice.");
            }
        } while (choice != 4);

        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }

        sc.close();
    }

    public static void viewAllStudents() {
        String sql = "SELECT * FROM students";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("--- Student List ---");
            while (rs.next()) {
                System.out.printf("ID: %d, Name: %s, Grade: %s\n", rs.getInt("id"), rs.getString("name"), rs.getString("grade"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching students: " + e.getMessage());
        }
    }

    public static void addStudent(Scanner sc) {
        System.out.print("Enter student name: ");
        String name = sc.nextLine();
        System.out.print("Enter student grade: ");
        String grade = sc.nextLine();

        String sql = "INSERT INTO students (name, grade) VALUES (?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, grade);
            int rows = pstmt.executeUpdate();
            System.out.println(rows + " student(s) added.");
        } catch (SQLException e) {
            System.out.println("Error adding student: " + e.getMessage());
        }
    }

    public static void deleteStudent(Scanner sc) {
        System.out.print("Enter student ID to delete: ");
        int id = sc.nextInt();

        String sql = "DELETE FROM students WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                System.out.println("Student deleted.");
            } else {
                System.out.println("Student ID not found.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting student: " + e.getMessage());
        }
    }
}
