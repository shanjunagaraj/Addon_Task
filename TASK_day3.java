import java.util.Scanner;

public class ReverseArray {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

       
        System.out.print("Enter number of elements: ");
        int n = scanner.nextInt();

        int[] numbers = new int[n];

       
        System.out.println("Enter the numbers:");
        for (int i = 0; i < n; i++) {
            numbers[i] = scanner.nextInt();
        }

       
        System.out.println("Reversed array:");
        for (int i = n - 1; i >= 0; i--) {
            System.out.print(numbers[i] + " ");
        }

        scanner.close();
    }
}

task 2

class Main {
    public static void main(String[] args) {
        String name = "manut";
        int n= name.length();
        int count= 0;
        int count1=0;
        for(int i=0;i<n;i++){
            System.out.println(name.charAt(i));
            if(name.charAt(i)=='a' || name.charAt(i)=='i' || name.charAt(i)=='e' || name.charAt(i)=='o' || name.charAt(i)=='u')
                count++;
       
           else if(name.charAt(i)>='a'&& name.charAt(i)<='z') {
               count1++;
           
               
           }
               
        }
       
        System.out.println(count);
        System.out.println(count1);
       
               
               
                }
}
               
