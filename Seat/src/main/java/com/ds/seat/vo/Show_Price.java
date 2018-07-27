package com.ds.seat.vo;


import java.io.Serializable;
import java.util.List;

public class Show_Price implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3082271036640935712L;

	public int show_priceno=0; //al - SHOW_NO_idx
	public long show_no=0; //FK_SHOW_PRICE_NO
	public int show_vipprice=0; 
	public int show_rprice=0;
	public int show_sprice=0;
	public int show_aprice=0;
	
	public Show_Price() {
		super();
	}
	
	public Show_Price(int show_priceno, long show_no, int show_vipprice, int show_rprice, int show_sprice,
			int show_aprice) {
		super();
		this.show_priceno = show_priceno;
		this.show_no = show_no;
		this.show_vipprice = show_vipprice;
		this.show_rprice = show_rprice;
		this.show_sprice = show_sprice;
		this.show_aprice = show_aprice;
	}
	public int getShow_priceno() {
		return show_priceno;
	}
	public void setShow_priceno(int show_priceno) {
		this.show_priceno = show_priceno;
	}
	public long getShow_no() {
		return show_no;
	}
	public void setShow_no(long show_no) {
		this.show_no = show_no;
	}
	public int getShow_vipprice() {
		return show_vipprice;
	}
	public void setShow_vipprice(int show_vipprice) {
		this.show_vipprice = show_vipprice;
	}
	public int getShow_rprice() {
		return show_rprice;
	}
	public void setShow_rprice(int show_rprice) {
		this.show_rprice = show_rprice;
	}
	public int getShow_sprice() {
		return show_sprice;
	}
	public void setShow_sprice(int show_sprice) {
		this.show_sprice = show_sprice;
	}
	public int getShow_aprice() {
		return show_aprice;
	}
	public void setShow_aprice(int show_aprice) {
		this.show_aprice = show_aprice;
	}
	@Override
	public String toString() {
		return "Show_Price [show_priceno=" + show_priceno + ", show_no=" + show_no + ", show_vipprice=" + show_vipprice
				+ ", show_rprice=" + show_rprice + ", show_sprice=" + show_sprice + ", show_aprice=" + show_aprice
				+ "]";
	}

	
	
	
	
	
	
	
}
