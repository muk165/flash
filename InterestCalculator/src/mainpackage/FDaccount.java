package mainpackage;

public class FDaccount extends Account {
	double interestRate;
	double amount;
	int noOfDays;
	int ageOfAcHolder;

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}

	public int getAgeOfAcHolder() {
		return ageOfAcHolder;
	}

	public void setAgeOfAcHolder(int ageOfAcHolder) {
		this.ageOfAcHolder = ageOfAcHolder;
	}

	public double calculateInterest() {
		if(amount<10000000) {
			if(ageOfAcHolder>=65) {
				//System.out.println("Comes under Senior citizen");
				if(noOfDays>=7 & noOfDays<=14) {
					interestRate = 5;
					
				}
				if(noOfDays>=15 & noOfDays<=29) {
					interestRate = 5.25;
				}
				if(noOfDays>=30 & noOfDays<=45) {
					interestRate = 6;
				}
				if(noOfDays>=46 & noOfDays<=60) {
					interestRate = 7.5;
				}
				if(noOfDays>61 & noOfDays<=184) {
					interestRate = 8;
				}
				if(noOfDays>184 & noOfDays<=365) {
					interestRate = 8.5;
				}
			}
			else {
				System.out.println("Comes under General");
				if(noOfDays>=7 & noOfDays<=14) {
					interestRate = 4.5;
					
				}
				if(noOfDays>=15 & noOfDays<=29) {
					interestRate = 4.75;
				}
				if(noOfDays>=30 & noOfDays<=45) {
					interestRate = 5.50;
				}
				if(noOfDays>=46 & noOfDays<=60) {
					interestRate = 7;
				}
				if(noOfDays>61 & noOfDays<=184) {
					interestRate = 7.5;
				}
				if(noOfDays>184 & noOfDays<=365) {
					interestRate = 8;
				}
			}
		}
		
		else if(amount>10000000) {
			if(noOfDays>=7 & noOfDays<=14) {
				interestRate = 6.5;
				
			}
			if(noOfDays>=15 & noOfDays<=29) {
				interestRate = 6.75;
			}
			if(noOfDays>=30 & noOfDays<=45) {
				interestRate = 6.75;
			}
			if(noOfDays>=46 & noOfDays<=60) {
				interestRate = 8;
			}
			if(noOfDays>61 & noOfDays<=184) {
				interestRate = 8.50;
			}
			if(noOfDays>184 & noOfDays<=365) {
				interestRate = 10;
			}
		}
		return amount*(interestRate/100);
	
	}
}
