package com.ds.sts1.vo;

public class V1_Order {
	private int ord_id=0;
	private int ord_cnt=0;
	private String ord_date=null;
	private int itm_no=0;
	private String mem_id=null;
	
	
	public int getOrd_id() {
		return ord_id;
	}


	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}


	public int getOrd_cnt() {
		return ord_cnt;
	}


	public void setOrd_cnt(int ord_cnt) {
		this.ord_cnt = ord_cnt;
	}


	public String getOrd_date() {
		return ord_date;
	}


	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}


	public int getItm_no() {
		return itm_no;
	}


	public void setItm_no(int itm_no) {
		this.itm_no = itm_no;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	@Override
	public String toString() {
		return "V1_Order [ord_id=" + ord_id + ", ord_cnt=" + ord_cnt + ", ord_date=" + ord_date + ", itm_no=" + itm_no
				+ ", mem_id=" + mem_id + "]";
	}
	
	
	
}
