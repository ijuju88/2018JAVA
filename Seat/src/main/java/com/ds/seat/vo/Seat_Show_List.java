package com.ds.seat.vo;

public class Seat_Show_List {

	private int show_id=0;
	private String ss_no=null;
	private String show_id_name=null;
	private Long show_no=0l;
	private String show_title=null;
	private String show_content=null;
	private String show_img1=null;
	private String show_img2=null;
	private String show_startdate=null;
	private String show_enddate=null;

	
	public Seat_Show_List() {
		super();
	}


	public Seat_Show_List(int show_id, String ss_no, String show_id_name, Long show_no, String show_title,
			String show_content, String show_img1, String show_img2, String show_startdate, String show_enddate) {
		super();
		this.show_id = show_id;
		this.ss_no = ss_no;
		this.show_id_name = show_id_name;
		this.show_no = show_no;
		this.show_title = show_title;
		this.show_content = show_content;
		this.show_img1 = show_img1;
		this.show_img2 = show_img2;
		this.show_startdate = show_startdate;
		this.show_enddate = show_enddate;
	}


	public int getShow_id() {
		return show_id;
	}


	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}


	public String getSs_no() {
		return ss_no;
	}


	public void setSs_no(String ss_no) {
		this.ss_no = ss_no;
	}


	public String getShow_id_name() {
		return show_id_name;
	}


	public void setShow_id_name(String show_id_name) {
		this.show_id_name = show_id_name;
	}


	public Long getShow_no() {
		return show_no;
	}


	public void setShow_no(Long show_no) {
		this.show_no = show_no;
	}


	public String getShow_title() {
		return show_title;
	}


	public void setShow_title(String show_title) {
		this.show_title = show_title;
	}


	public String getShow_content() {
		return show_content;
	}


	public void setShow_content(String show_content) {
		this.show_content = show_content;
	}


	public String getShow_img1() {
		return show_img1;
	}


	public void setShow_img1(String show_img1) {
		this.show_img1 = show_img1;
	}


	public String getShow_img2() {
		return show_img2;
	}


	public void setShow_img2(String show_img2) {
		this.show_img2 = show_img2;
	}


	public String getShow_startdate() {
		return show_startdate;
	}


	public void setShow_startdate(String show_startdate) {
		this.show_startdate = show_startdate;
	}


	public String getShow_enddate() {
		return show_enddate;
	}


	public void setShow_enddate(String show_enddate) {
		this.show_enddate = show_enddate;
	}


	@Override
	public String toString() {
		return "Seat_Show_List [show_id=" + show_id + ", ss_no=" + ss_no + ", show_id_name=" + show_id_name
				+ ", show_no=" + show_no + ", show_title=" + show_title + ", show_content=" + show_content
				+ ", show_img1=" + show_img1 + ", show_img2=" + show_img2 + ", show_startdate=" + show_startdate
				+ ", show_enddate=" + show_enddate + "]";
	}
	

}
