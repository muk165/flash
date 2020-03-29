package mainpackage;

import static org.junit.jupiter.api.Assertions.*;

import java.math.RoundingMode;
import java.text.DecimalFormat;

import org.junit.jupiter.api.Test;

class AllAccountTest {

	@Test
	void fdtest() {
		FDaccount fdtest = new FDaccount();
		
		fdtest.setAgeOfAcHolder(60);
		fdtest.setAmount(100000);
		fdtest.setNoOfDays(15);
		fdtest.calculateInterest();
		double ir = fdtest.interestRate;
		assertEquals(ir,4.75);
	}

	@Test
	void rdtest() {
		RDaccount rdtest = new RDaccount();
		
		rdtest.setNoOfMonths(12);
		rdtest.setAgeOfAccountHolder(66);
		rdtest.setAmount(2500);
		
		double ir = rdtest.calculateInterest();
		System.out.println(new DecimalFormat("##.##").format(ir));
		assertEquals(new DecimalFormat("##.##").format(ir), "212.5");
	
	}
}
