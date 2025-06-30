// TASK1:

class BankAccount {
    private double balance;

    // Constructor
    public BankAccount(double balance) {
        this.balance = balance;
    }

    // Deposit method
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposited: " + amount);
        } else {
            System.out.println("Deposit amount must be positive.");
        }
    }

    // Withdraw method
    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrew: " + amount);
        } else {
            System.out.println("Insufficient balance or invalid amount.");
        }
    }

    // Get balance method
    public double getBalance() {
        return balance;
    }
}

public class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount(1000);
        account.deposit(500);
        account.withdraw(200);
        System.out.println("Current Balance: " + account.getBalance());
    }
}


//TASK 2:


class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age);
    }
}

class Employee extends Person {
    private double salary;

    public Employee(String name, int age, double salary) {
        super(name, age);
        this.salary = salary;
    }

    public void calculateSalary() {
        System.out.println("Salary: " + salary);
    }
}

public class Main {
    public static void main(String[] args) {
        Employee emp = new Employee("Vikram", 27, 50000);
        emp.displayInfo();
        emp.calculateSalary();
    }
}


TASK 3


public class Task {

   
    public int sum(int a, int b) {
        return a + b;
    }

    
    public double sum(double a, double b) {
        return a + b;
    }

    public static void main(String[] args) {
        Task obj = new Task();

        System.out.println(obj.sum(5, 5));       // calls sum(int, int)
        System.out.println(obj.sum(4.5, 3.5));   // calls sum(double, double)
    }
}

//TASK 3:

public class OverloadingDemo {
    // sum method for integers
    public int sum(int a, int b) {
        return a + b;
    }

    // sum method for doubles
    public double sum(double a, double b) {
        return a + b;
    }

    public static void main(String[] args) {
        OverloadingDemo obj = new OverloadingDemo();

        // Calling sum(int, int)
        int intResult = obj.sum(10, 20);
        System.out.println("Sum of integers: " + intResult);

        // Calling sum(double, double)
        double doubleResult = obj.sum(15.5, 24.5);
        System.out.println("Sum of doubles: " + doubleResult);
    }
}

//TASK 4

class Student {
    private String name;
    private int marks;

    public Student(String name) {
        this.name = name;
    }

    public void assignMarks(int marks) {
        this.marks = marks;
    }

    public void displayResults() {
        System.out.println("Student: " + name + ", Marks: " + marks);
    }
}

public class Main {
    public static void main(String[] args) {
        Student student1 = new Student("Arjun");
        student1.assignMarks(85);
        student1.displayResults();

        Student student2 = new Student("Akshaya");
        student2.assignMarks(92);
        student2.displayResults();
    }
}
