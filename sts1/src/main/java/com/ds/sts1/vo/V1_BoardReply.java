package com.ds.sts1.vo;

public class V1_BoardReply {

	private int prl_no ;
	private String prl_content;
	private String prl_writer ;
	private int brd_no; 
	private String prl_date;
	
	
	public int getPrl_no() {
		return prl_no;
	}


	public void setPrl_no(int prl_no) {
		this.prl_no = prl_no;
	}


	public String getPrl_content() {
		return prl_content;
	}


	public void setPrl_content(String prl_content) {
		this.prl_content = prl_content;
	}


	public String getPrl_writer() {
		return prl_writer;
	}


	public void setPrl_writer(String prl_writer) {
		this.prl_writer = prl_writer;
	}


	public int getBrd_no() {
		return brd_no;
	}


	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}


	public String getPrl_date() {
		return prl_date;
	}


	public void setPrl_date(String prl_date) {
		this.prl_date = prl_date;
	}


	@Override
	public String toString() {
		return "V1_BoardReply [prl_no=" + prl_no + ", prl_content=" + prl_content + ", prl_writer=" + prl_writer
				+ ", brd_no=" + brd_no + ", prl_date=" + prl_date + "]";
	}
	
}
