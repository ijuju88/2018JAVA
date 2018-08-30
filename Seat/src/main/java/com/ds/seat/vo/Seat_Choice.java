package com.ds.seat.vo;

import java.io.Serializable;

public class Seat_Choice implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private long show_no=0;
	private int sc_vipseat=0;
	private int sc_rseat=0;
	private int sc_sseat=0;
	private int sc_aseat=0;
	
	public Seat_Choice() {
		super();
	}
	
	public Seat_Choice(long show_no, int sc_vipseat, int sc_rseat, int sc_sseat, int sc_aseat) {
		super();
		this.show_no = show_no;
		this.sc_vipseat = sc_vipseat;
		this.sc_rseat = sc_rseat;
		this.sc_sseat = sc_sseat;
		this.sc_aseat = sc_aseat;
	}

	
	public long getShow_no() {
		return show_no;
	}



	public void setShow_no(long l) {
		this.show_no = l;
	}



	public int getSc_vipseat() {
		return sc_vipseat;
	}



	public void setSc_vipseat(int sc_vipseat) {
		this.sc_vipseat = sc_vipseat;
	}



	public int getSc_rseat() {
		return sc_rseat;
	}



	public void setSc_rseat(int sc_rseat) {
		this.sc_rseat = sc_rseat;
	}



	public int getSc_sseat() {
		return sc_sseat;
	}



	public void setSc_sseat(int sc_sseat) {
		this.sc_sseat = sc_sseat;
	}



	public int getSc_aseat() {
		return sc_aseat;
	}



	public void setSc_aseat(int sc_aseat) {
		this.sc_aseat = sc_aseat;
	}



	@Override
	public String toString() {
		return "Seat_Choice [sc_no=" + show_no + ", sc_vipseat=" + sc_vipseat + ", sc_rseat=" + sc_rseat + ", sc_sseat="
				+ sc_sseat + ", sc_aseat=" + sc_aseat + "]";
	}
	
	

}
