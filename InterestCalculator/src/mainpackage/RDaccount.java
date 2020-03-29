package mainpackage;

public class RDaccount extends Account {
	double interestRate;
	double amount;
	int noOfMonths;
	double monthlyAmount;
	double ageOfAccountHolder;
	public double getAmount() {
		return amount;
	}

	public double getAgeOfAccountHolder() {
		return ageOfAccountHolder;
	}

	public void setAgeOfAccountHolder(double ageOfAccountHolder) {
		this.ageOfAccountHolder = ageOfAccountHolder;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getNoOfMonths() {
		return noOfMonths;
	}

	public void setNoOfMonths(int noOfMonths) {
		this.noOfMonths = noOfMonths;
	}

	public double getMonthlyAmount() {
		return monthlyAmount;
	}

	public void setMonthlyAmount(double monthlyAmount) {
		this.monthlyAmount = monthlyAmount;
	}

	public double calculateInterest() {
		if(noOfMonths == 6) {
			interestRate = 7.5;
		}
		else if(noOfMonths == 9) {
			interestRate = 7.75;
		}
		else if(noOfMonths == 12) {
			interestRate = 8;
		}
		else if(noOfMonths == 15) {
			interestRate = 8.25;
		}
		else if(noOfMonths == 18) {
			interestRate = 8.5;
		}
		else if(noOfMonths == 21) {
			interestRate = 8.75;
		}
		if(ageOfAccountHolder<65) {
			return amount*(interestRate/100);
		}
		return amount*((interestRate+0.5)/100);
	};
}
		