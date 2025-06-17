TASK:1
public class EvenNumbers {
    public static void main(String[] args) {
        System.out.println("Even numbers between 1 and 100:");
        for (int i = 2; i <= 100; i += 2) {
            System.out.print(i + " ");
        }
    }
}




TASK : 2

import java.util.Scanner;

public class SimpleInterestCalculator {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Enter Principal amount: ");
        double principal = input.nextDouble();

        System.out.print("Enter Rate of interest: ");
        double rate = input.nextDouble();

        System.out.print("Enter Time in years: ");
        double time = input.nextDouble();

        if (principal > 0 && rate > 0 && time > 0) {
            double simpleInterest = (principal * rate * time) / 100;
            System.out.println("Simple Interest = " + simpleInterest);
        } else {
            System.out.println("Error: Principal, rate, and time must be positive numbers.");
        }

        input.close();
    }
}


TASK:3

public class LeapYearSimple2 {
    public static void main(String[] args) {
        int year = 2025; 

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            System.out.println(year + " is a leap year.");
        } else {
            System.out.println(year + " is not a leap year.");
        }
    }
}

TASK:4

import java.util.Scanner;
  public class{
       public static void main(String[] args)
        {
         Scanner s1=new Scanner(System.in);
         System.out.println("Enter student mark:");
         int mark = input.nextInt();
         if(mark>=90)
         {
             System.out.println("Grade:A+");
           }
         else if(mark>=80) {
                System.out.println("Grade:A");
          } 
        else if(mark>=70) {
               System.out.println("Grade:B");
         }
        else if (mark>=60) {
                System.out.println("Grade:C");
          }
      else if (mark>=50) {
                System.out.println("Grade:D");
          }
       else if (mark>=35) {
                System.out.println("Grade:E(pass)");
           }
     else
            System.out.println("Grade:F(fail)");
          }
      s1.close();
   }
}
