package com.ds.seat.vo;

import java.util.Arrays;
import java.util.Date;

public class Seat_Show {
	public long show_no=0;
	public String show_title=null;
	public String show_content=null;
	//public byte[] show_img=null; //blob
	public String show_startdate=null;
	public String show_enddate=null;
	
	public long getShow_no() {
		return show_no;
	}
	public void setShow_no(long show_no) {
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
	
	/*public byte[] getShow_img() {
		return show_img;
	}
	public void setShow_img(byte[] show_img) {
		this.show_img = show_img;
	}*/
	
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
		return "Seat_Show [show_no=" + show_no + ", show_title=" + show_title + ", show_content=" + show_content
				+ ", show_startdate=" + show_startdate + ", show_enddate="
				+ show_enddate + "]";
	}
}
