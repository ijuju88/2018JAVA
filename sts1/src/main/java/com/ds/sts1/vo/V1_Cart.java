package com.ds.sts1.vo;

public class V1_Cart {
	private int crt_no=0;
	private int crt_cnt=0;
	private String crt_date=null;
	private int itm_no=0;
	private String mem_id=null;
	
	private String itm_name=null;
	private int itm_price=0;
	public int getCrt_no() {
		return crt_no;
	}
	public void setCrt_no(int crt_no) {
		this.crt_no = crt_no;
	}
	public int getCrt_cnt() {
		return crt_cnt;
	}
	public void setCrt_cnt(int crt_cnt) {
		this.crt_cnt = crt_cnt;
	}
	public String getCrt_date() {
		return crt_date;
	}
	public void setCrt_date(String crt_date) {
		this.crt_date = crt_date;
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
	public String getItm_name() {
		return itm_name;
	}
	public void setItm_name(String itm_name) {
		this.itm_name = itm_name;
	}
	public int getItm_price() {
		return itm_price;
	}
	public void setItm_price(int itm_price) {
		this.itm_price = itm_price;
	}
	
	public String toString1() {
		return "V1_Cart [crt_no=" + crt_no + ", crt_cnt=" + crt_cnt + ", crt_date=" + crt_date + ", itm_no=" + itm_no
				+ ", mem_id=" + mem_id + "]";
	}
	
	@Override
	public String toString() {
		return "V1_Cart [crt_no=" + crt_no + ", crt_cnt=" + crt_cnt + ", crt_date=" + crt_date + ", itm_no=" + itm_no
				+ ", mem_id=" + mem_id + ", itm_name=" + itm_name + ", itm_price=" + itm_price + "]";
	}
	
	
	
	
}
