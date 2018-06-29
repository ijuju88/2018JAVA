package com.ds.sts1;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.ds.sts1.func.Calc;

public class CalcTest {
	@Test
	public void testPlus() {
		Calc calc=new Calc();
		int res=calc.plus(1, 2);
		
		assertEquals(3, res);
	}
	
	
	@Test
	public void testMinus() {
		Calc calc=new Calc();
	
		assertEquals(-1, calc.minus(1, 2));
	}
}
