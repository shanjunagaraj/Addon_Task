// TASK 1:

class MyThread extends Thread {
    public void run() {
        for (int i = 1; i <= 10; i++) {
            System.out.println(i);
        }
        
        try {
                Thread.sleep(500);             } catch (InterruptedException e) {
                System.out.println("Thread interrupted");
            }

        
        
    }
}

public class Main {
    public static void main(String[] args) {
        MyThread th = new MyThread();
        th.start();     }
}


// TASK 2:

class MessagePrinter implements Runnable {
    public void run() {
        System.out.println("Hello from " + Thread.currentThread().getName());
    }
}

public class MultiThreadExample {
    public static void main(String[] args) {
        MessagePrinter task = new MessagePrinter();

        Thread t1 = new Thread(task, "Thread-1");
        Thread t2 = new Thread(task, "Thread-2");
        Thread t3 = new Thread(task, "Thread-3");

        t1.start();
        t2.start();
        t3.start();
    }
}

// TASK 3:


class ThreadA extends Thread {
    public void run() {
        try {
            for (int i = 1; i <= 5; i++) {
                System.out.println("Thread A: " + i);
                Thread.sleep(500);  // Sleep for 500 milliseconds
            }
        } catch (InterruptedException e) {
            System.out.println("Thread A interrupted");
        }
    }
}

class ThreadB extends Thread {
    ThreadA threadA;

    ThreadB(ThreadA t) {
        this.threadA = t;
    }

    public void run() {
        try {
            threadA.join();  // Wait for ThreadA to finish
            for (int i = 1; i <= 5; i++) {
                System.out.println("Thread B: " + i);
                Thread.sleep(500);  // Sleep for 500 milliseconds
            }
        } catch (InterruptedException e) {
            System.out.println("Thread B interrupted");
        }
    }
}

public class SleepJoinDemo {
    public static void main(String[] args) {
        ThreadA tA = new ThreadA();
        ThreadB tB = new ThreadB(tA);

        tA.start();
        tB.start();
    }
}

// TASK 4:

class TicketCounter {
    private int seatsAvailable = 10;

    // Synchronized method to book ticket
    public void bookTicket(String name, int numberOfSeats) {
        synchronized (this) {
            System.out.println(name + " is trying to book " + numberOfSeats + " seat(s).");
            
            if (numberOfSeats <= seatsAvailable) {
                System.out.println("Seats available. Processing booking for " + name + "...");

                try {
                    Thread.sleep(2000); // Simulate delay
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                seatsAvailable -= numberOfSeats;
                System.out.println("Booking successful for " + name + ". Seats remaining: " + seatsAvailable);
            } else {
                System.out.println("Booking failed for " + name + ". Not enough seats. Seats remaining: " + seatsAvailable);
            }
        }
    }
}

class User extends Thread {
    private TicketCounter counter;
    private String name;
    private int seatsNeeded;

    public User(TicketCounter counter, String name, int seatsNeeded) {
        this.counter = counter;
        this.name = name;
        this.seatsNeeded = seatsNeeded;
    }

    public void run() {
        counter.bookTicket(name, seatsNeeded);
    }
}

public class TicketBookingSimulation {
    public static void main(String[] args) {
        TicketCounter counter = new TicketCounter();

        User u1 = new User(counter, "Alice", 4);
        User u2 = new User(counter, "Bob", 5);
        User u3 = new User(counter, "Charlie", 3);

        u1.start();
        u2.start();
        u3.start();
    }
}


