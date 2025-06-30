//TASK 1:

import java.util.ArrayList;
import java.util.Iterator;

public class SimpleStudentList {
    public static void main(String[] args) {
        ArrayList<String> students = new ArrayList<>();

        students.add("Alice");
        students.add("Bob");
        students.add("Charlie");

         Iterator<String>  terator = students.iterator();
        System.out.println("Student Names:");
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}

//TASK 2:

import java.util.HashSet;

public class UniqueEmail {
    public static void main(String[] args) {
                HashSet<String> emailSet = new HashSet<>();

                emailSet.add("shanju@gmail.com");
        emailSet.add("nagaraj@gmail.com");
        emailSet.add("menaka@gmail.com");
        emailSet.add("harshit@gmail.com"); 
               System.out.println("Unique Email Addresses:");
        for (String email : emailSet) {
            System.out.println(email);
        }
    }
}

//TASK 3:

import java.util.HashMap;

public class SimpleAverage {
    public static void main(String[] args) {
        HashMap<String, Integer> marks = new HashMap<>();

        marks.put("John", 80);
        marks.put("Emma", 90);
        marks.put("Alex", 70);

        int total = 0;
        for (int m : marks.values()) {
            total += m;
        }

        double average = total / (double) marks.size();

    for (String name : marks.keySet()) {
            System.out.println(name + ": " + marks.get(name));
        }
    
    
 System.out.println("Average Marks: " + average);
    }
}

//TASK 4:

import java.util.*;

public class StudentCourseManager {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // ArrayList for student names
        ArrayList<String> students = new ArrayList<>();

        // HashMap to store student name and their courses (List)
        HashMap<String, ArrayList<String>> studentCourses = new HashMap<>();

        int choice;
        do {
            System.out.println("\n--- Student Course Manager ---");
            System.out.println("1. Add Student");
            System.out.println("2. Add Course to Student");
            System.out.println("3. Remove Student");
            System.out.println("4. Display All Students and Courses");
            System.out.println("5. Exit");
            System.out.print("Enter choice: ");
            choice = sc.nextInt();
            sc.nextLine(); // consume newline

            switch (choice) {
                case 1:
                    System.out.print("Enter student name: ");
                    String studentName = sc.nextLine();
                    students.add(studentName);
                    studentCourses.put(studentName, new ArrayList<>());
                    System.out.println("Student added.");
                    break;

                case 2:
                    System.out.print("Enter student name: ");
                    String sName = sc.nextLine();
                    if (studentCourses.containsKey(sName)) {
                        System.out.print("Enter course name to add: ");
                        String courseName = sc.nextLine();
                        studentCourses.get(sName).add(courseName);
                        System.out.println("Course added to " + sName);
                    } else {
                        System.out.println("Student not found.");
                    }
                    break;

                case 3:
                    System.out.print("Enter student name to remove: ");
                    String removeName = sc.nextLine();
                    if (students.remove(removeName)) {
                        studentCourses.remove(removeName);
                        System.out.println("Student removed.");
                    } else {
                        System.out.println("Student not found.");
                    }
                    break;

                case 4:
                    System.out.println("--- All Students and Their Courses ---");
                    Iterator<String> studentIterator = students.iterator();
                    while (studentIterator.hasNext()) {
                        String name = studentIterator.next();
                        System.out.print("Student: " + name + " | Courses: ");
                        ArrayList<String> courses = studentCourses.get(name);
                        Iterator<String> courseIterator = courses.iterator();
                        while (courseIterator.hasNext()) {
                            System.out.print(courseIterator.next());
                            if (courseIterator.hasNext()) System.out.print(", ");
                        }
                        System.out.println();
                    }
                    break;

                case 5:
                    System.out.println("Exiting...");
                    break;

                default:
                    System.out.println("Invalid choice.");
            }
        } while (choice != 5);

        sc.close();
    }
}


