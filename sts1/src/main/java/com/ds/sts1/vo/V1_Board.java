package com.ds.sts1.vo;

import java.util.Arrays;

public class V1_Board {
	private int brd_no=0;
	private String brd_title=null; 
	private String brd_writer=null;
	private String brd_content=null; //CLOB
	private int brd_hit=1; 
	private byte[] brd_img=null;//BLOB
	private String brd_date=null;
	
	
	//select를 위한 임시 vo변수
	private String slist=null;
	private String[] Slistary=null;
	
	public V1_Board() {
		super();
	}
	
	
	public V1_Board(int brd_no, String brd_title, String brd_writer, String brd_content) {
		super();
		this.brd_no = brd_no;
		this.brd_title = brd_title;
		this.brd_writer = brd_writer;
		this.brd_content = brd_content;
	}

	public V1_Board(int brd_no, String brd_title, String brd_writer, String brd_content, int brd_hit, byte[] brd_img,
			String brd_date, String slist, String[] slistary) {
		super();
		this.brd_no = brd_no;
		this.brd_title = brd_title;
		this.brd_writer = brd_writer;
		this.brd_content = brd_content;
		this.brd_hit = brd_hit;
		this.brd_img = brd_img;
		this.brd_date = brd_date;
		this.slist = slist;
		Slistary = slistary;
	}



	public V1_Board(int brd_no, String brd_title, String brd_writer, String brd_content, int brd_hit, byte[] brd_img,
			String brd_date) {
		super();
		this.brd_no = brd_no;
		this.brd_title = brd_title;
		this.brd_writer = brd_writer;
		this.brd_content = brd_content;
		this.brd_hit = brd_hit;
		this.brd_img = brd_img;
		this.brd_date = brd_date;
	}

	






	public int getBrd_no() {
		return brd_no;
	}
	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
	public String getBrd_content() {
		return brd_content;
	}
	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}
	public int getBrd_hit() {
		return brd_hit;
	}
	public void setBrd_hit(int brd_hit) {
		this.brd_hit = brd_hit;
	}
	
	
	public byte[] getBrd_img() {
		return brd_img;
	}
	public void setBrd_img(byte[] brd_img) {
		this.brd_img = brd_img;
	}
	
	public String getBrd_date() {
		return brd_date;
	}
	public void setBrd_date(String brd_date) {
		this.brd_date = brd_date;
	}


	public String getSlist() {
		return slist;
	}


	public void setSlist(String slist) {
		this.slist = slist;
	}



	public String[] getSlistary() {
		return Slistary;
	}



	public void setSlistary(String[] slistary) {
		Slistary = slistary;
	}



	@Override
	public String toString() {
		return "V1_Board [brd_no=" + brd_no + ", brd_title=" + brd_title + ", brd_writer=" + brd_writer
				+ ", brd_content=" + brd_content + ", brd_hit=" + brd_hit + ", brd_date=" + brd_date + "]";
	}
	

	
}
