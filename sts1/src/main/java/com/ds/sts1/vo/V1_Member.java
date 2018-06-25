package com.ds.sts1.vo;

public class V1_Member {
	private String mem_id=null;
	private String mem_pw=null;
	private String mem_name=null;
	private int mem_age=0;
	private String mem_email=null;
	private String mem_date=null;
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}
	
	@Override
	public String toString() {
		return "V1_Member [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_age=" + mem_age
				+ ", mem_email=" + mem_email + ", mem_date=" + mem_date + "]";
	}

	
}
