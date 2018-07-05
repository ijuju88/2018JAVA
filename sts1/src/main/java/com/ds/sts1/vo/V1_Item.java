package com.ds.sts1.vo;

import java.util.Arrays;

public class V1_Item {

	private int itm_no =0;
	private String itm_name=null;
	private String itm_content=null; //CLOB
	private int itm_price=0;
	private int itm_qty=0;
	private byte[] itm_img1=null; //BLOB
	private byte[] itm_img2=null; //BLOB
	private byte[] itm_img3=null; //BLOB
	private String itm_date=null;
	
	public V1_Item () {
		super();
	}
	
	public V1_Item(int itm_no, String itm_name, String itm_content, int itm_price, int itm_qty, byte[] itm_img1,
			byte[] itm_img2, byte[] itm_img3, String itm_date) {
		super();
		this.itm_no = itm_no;
		this.itm_name = itm_name;
		this.itm_content = itm_content;
		this.itm_price = itm_price;
		this.itm_qty = itm_qty;
		this.itm_img1 = itm_img1;
		this.itm_img2 = itm_img2;
		this.itm_img3 = itm_img3;
		this.itm_date = itm_date;
	}


	public int getItm_no() {
		return itm_no;
	}
	public void setItm_no(int itm_no) {
		this.itm_no = itm_no;
	}
	public String getItm_name() {
		return itm_name;
	}
	public void setItm_name(String itm_name) {
		this.itm_name = itm_name;
	}
	public String getItm_content() {
		return itm_content;
	}
	public void setItm_content(String itm_content) {
		this.itm_content = itm_content;
	}
	public int getItm_price() {
		return itm_price;
	}
	public void setItm_price(int itm_price) {
		this.itm_price = itm_price;
	}
	public int getItm_qty() {
		return itm_qty;
	}
	public void setItm_qty(int itm_qty) {
		this.itm_qty = itm_qty;
	}
	public byte[] getItm_img1() {
		return itm_img1;
	}
	public void setItm_img1(byte[] itm_img1) {
		this.itm_img1 = itm_img1;
	}
	public byte[] getItm_img2() {
		return itm_img2;
	}
	public void setItm_img2(byte[] itm_img2) {
		this.itm_img2 = itm_img2;
	}
	public byte[] getItm_img3() {
		return itm_img3;
	}
	public void setItm_img3(byte[] itm_img3) {
		this.itm_img3 = itm_img3;
	}
	public String getItm_date() {
		return itm_date;
	}
	public void setItm_date(String itm_date) {
		this.itm_date = itm_date;
	}
	@Override
	public String toString() {
		return "V1_Item [itm_no=" + itm_no + ", itm_name=" + itm_name + ", itm_content=" + itm_content + ", itm_price="
				+ itm_price + ", itm_qty=" + itm_qty + ", itm_img1=" + Arrays.toString(itm_img1) + ", itm_img2="
				+ Arrays.toString(itm_img2) + ", itm_img3=" + Arrays.toString(itm_img3) + ", itm_date=" + itm_date
				+ "]";
	}
	
	
	
}
