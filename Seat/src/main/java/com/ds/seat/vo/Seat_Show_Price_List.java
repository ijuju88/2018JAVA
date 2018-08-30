package com.ds.seat.vo;

import java.io.Serializable;

public class Seat_Show_Price_List implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public long show_no=0; //FK_SHOW_PRICE_NO
	
	public String show_title=null; //공연명
	public String show_content=null; //공연간단내용
	public String show_img1=null;  //이미지1
	public String show_img2=null;  //이미지2
	public String show_startdate=null; //시작일
	public String show_enddate=null; //마지막일
	public int show_id=0; //공연장아이디
	public String show_id_name=null; //공연장명
	
	public int show_vipprice=0; //vip석가격
	public int show_rprice=0; //r석가격
	public int show_sprice=0; //s석가격
	public int show_aprice=0; //a석가격
	
	public Seat_Show_Price_List() {
		super();
	}

	
	
	public Seat_Show_Price_List(long show_no, String show_title, String show_content, String show_img1,
			String show_img2, String show_startdate, String show_enddate, int show_id, String show_id_name,
			int show_vipprice, int show_rprice, int show_sprice, int show_aprice) {
		super();
		this.show_no = show_no;
		this.show_title = show_title;
		this.show_content = show_content;
		this.show_img1 = show_img1;
		this.show_img2 = show_img2;
		this.show_startdate = show_startdate;
		this.show_enddate = show_enddate;
		this.show_id = show_id;
		this.show_id_name = show_id_name;
		this.show_vipprice = show_vipprice;
		this.show_rprice = show_rprice;
		this.show_sprice = show_sprice;
		this.show_aprice = show_aprice;
	}



	public String getShow_id_name() {
		return show_id_name;
	}



	public void setShow_id_name(String show_id_name) {
		this.show_id_name = show_id_name;
	}



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
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
	public int getShow_vipprice() {
		return show_vipprice;
	}
	public void setShow_vipprice(int show_vipprice) {
		this.show_vipprice = show_vipprice;
	}
	public int getShow_rprice() {
		return show_rprice;
	}
	public void setShow_rprice(int show_rprice) {
		this.show_rprice = show_rprice;
	}
	public int getShow_sprice() {
		return show_sprice;
	}
	public void setShow_sprice(int show_sprice) {
		this.show_sprice = show_sprice;
	}
	public int getShow_aprice() {
		return show_aprice;
	}
	public void setShow_aprice(int show_aprice) {
		this.show_aprice = show_aprice;
	}



	@Override
	public String toString() {
		return "Seat_Show_Price_List [show_no=" + show_no + ", show_title=" + show_title + ", show_content="
				+ show_content + ", show_img1=" + show_img1 + ", show_img2=" + show_img2 + ", show_startdate="
				+ show_startdate + ", show_enddate=" + show_enddate + ", show_id=" + show_id + ", show_id_name="
				+ show_id_name + ", show_vipprice=" + show_vipprice + ", show_rprice=" + show_rprice + ", show_sprice="
				+ show_sprice + ", show_aprice=" + show_aprice + "]";
	}
	
	
	
=======
	public String show_title=null;
	public String show_content=null;
	public String show_img1=null; 
	public String show_img2=null; 
	public String show_startdate=null;
	public String show_enddate=null;
	
	public int show_vipprice=0; 
	public int show_rprice=0;
	public int show_sprice=0;
	public int show_aprice=0;
	
	public Seat_Show_Price_List() {
		super();
	}

	
	public Seat_Show_Price_List(long show_no, String show_title, String show_content, String show_img1,
			String show_img2, String show_startdate, String show_enddate, int show_vipprice, int show_rprice,
			int show_sprice, int show_aprice) {
		super();
		this.show_no = show_no;
		this.show_title = show_title;
		this.show_content = show_content;
		this.show_img1 = show_img1;
		this.show_img2 = show_img2;
		this.show_startdate = show_startdate;
		this.show_enddate = show_enddate;
		this.show_vipprice = show_vipprice;
		this.show_rprice = show_rprice;
		this.show_sprice = show_sprice;
		this.show_aprice = show_aprice;
	}


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


	public int getShow_vipprice() {
		return show_vipprice;
	}


	public void setShow_vipprice(int show_vipprice) {
		this.show_vipprice = show_vipprice;
	}


	public int getShow_rprice() {
		return show_rprice;
	}


	public void setShow_rprice(int show_rprice) {
		this.show_rprice = show_rprice;
	}


	public int getShow_sprice() {
		return show_sprice;
	}


	public void setShow_sprice(int show_sprice) {
		this.show_sprice = show_sprice;
	}


	public int getShow_aprice() {
		return show_aprice;
	}


	public void setShow_aprice(int show_aprice) {
		this.show_aprice = show_aprice;
	}


	@Override
	public String toString() {
		return "Seat_Show_Price_List [show_no=" + show_no + ", show_title=" + show_title + ", show_content="
				+ show_content + ", show_img1=" + show_img1 + ", show_img2=" + show_img2 + ", show_startdate="
				+ show_startdate + ", show_enddate=" + show_enddate + ", show_vipprice=" + show_vipprice
				+ ", show_rprice=" + show_rprice + ", show_sprice=" + show_sprice + ", show_aprice=" + show_aprice
				+ "]";
	}

	
	
	
}
