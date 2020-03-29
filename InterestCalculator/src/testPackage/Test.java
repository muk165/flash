package testPackage;
import mainpackage.FDaccount;
import mainpackage.RDaccount;
import mainpackage.SBaccount;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		int selectOption=0;
		do {
			System.out.print("\n1. Interest Calculator – SB: ");
			System.out.print("\n2. Interest Calculator – FD: ");
			System.out.print("\n3. Interest Calculator – RD: ");
			System.out.print("\n4. Exit");
			System.out.print("\nEnter your option");
			
			switch(selectOption) {
			case 1:
				SBaccount sbAcc = new SBaccount();
				System.out.print("\nEnter the Average amount in your account: ");
				double a = input.nextDouble();
				sbAcc.setAmount(a);
				System.out.println("Interest gained: Rs. " + sbAcc.calculateInterest());
				break;	
			
			case 2:
				FDaccount fdAccount = new FDaccount();
				System.out.print("\nEnter the FD ammount: ");
				double b = input.nextDouble();
				fdAccount.setAmount(b);
				
				System.out.print("\nEnter number of days: ");
				int noOfDays = input.nextInt();
				while (noOfDays < 0) {
					System.out.println("Invalid Number of days. Please enter non - negative values.");
					System.out.print("\nEnter number of days: ");
					noOfDays = input.nextInt();
				}
				fdAccount.setNoOfDays(noOfDays);
				
				System.out.print("\nEnter your age: ");
				int age = input.nextInt();
				while (age < 0) {
					System.out.println("Invalid age. Please enter non - negative values.");
					System.out.print("\nEnter your age: ");
					age = input.nextInt();
				}
				fdAccount.setAgeOfAcHolder(age);
				
				System.out.println("Interest gained: Rs. " + fdAccount.calculateInterest());
				break;
				
		case 3:
			RDaccount rdAccount = new RDaccount();
			System.out.print("\nEnter the RD ammount: ");
			rdAccount.setAmount(input.nextDouble());
			
			System.out.print("\nEnter number of months: ");
			int noOfMonths = input.nextInt();
			while (noOfMonths < 0) {
				System.out.println("Invalid Number of months. Please enter non - negative values.");
				System.out.print("\nEnter number of months: ");
				noOfMonths = input.nextInt();
			}
			rdAccount.setNoOfMonths(noOfMonths);
			
			System.out.print("\nEnter your age: ");
			age = input.nextInt();
			while (age < 0) {
				System.out.println("Invalid age. Please enter non - negative values.");
				System.out.print("\nEnter your age: ");
				age = input.nextInt();
			}
			rdAccount.setAgeOfAccountHolder(age);
			
			System.out.println("Interest gained: Rs. " + rdAccount.calculateInterest());
			break;
			
		case 4:
			System.out.println("Thanks for using Interest Calculator.");
			break;
			
		default:
			break;
			
			
			} 
		}
		while(selectOption != 4);
	}
}
