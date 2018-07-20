package com.ds.sts1.vo;

public class V1_Cart1{
	private int cate_no=0;
	private String cate_name=null;
	private int itm_no=0;
	
	@Override
	public String toString() {
		return "V1_Cart1 [cate_no=" + cate_no + ", cate_name=" + cate_name + ", itm_no=" + itm_no + "]";
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getItm_no() {
		return itm_no;
	}
	public void setItm_no(int itm_no) {
		this.itm_no = itm_no;
	}
	
}
