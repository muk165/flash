package mainpackage;

public class SBaccount extends Account{
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	String typeOfAccount;
	
	public String getTypeOfAccount() {
		return typeOfAccount;
	}

	public void setTypeOfAccount(String typeOfAccount) {
		this.typeOfAccount = typeOfAccount;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public double calculateInterest() {
		
		if(typeOfAccount == "NRI") {
			setInterestRate(6);
		}
		else if(typeOfAccount == "Normal") setInterestRate(4);
		
		double interestRate = getInterestRate();
		double amount = getAmount();
		
		return amount*(interestRate/100);
		
	}
	
}
