package com.ds.sts1.vo;

public class V1_Cart2{
	private int cate_no1=0;
	private String cate_name=null;
	private int cate_no=0;
	
	@Override
	public String toString() {
		return "V1_Cart2 [cate_no1=" + cate_no1 + ", cate_name=" + cate_name + ", cate_no=" + cate_no + "]";
	}
	public int getCate_no1() {
		return cate_no1;
	}
	public void setCate_no1(int cate_no1) {
		this.cate_no1 = cate_no1;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	
}