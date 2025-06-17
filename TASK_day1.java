import java.util.Scanner;

public class ReverseArray {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

       
        System.out.print("Enter number of elements: ");
        int n = scanner.nextInt();

        int[] numbers = new int[n];
task 1
       
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
