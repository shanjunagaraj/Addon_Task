TASK 1:

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


TASK 2:

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

TASK 3:

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

