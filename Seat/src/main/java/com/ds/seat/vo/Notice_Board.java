package com.ds.seat.vo;

import java.io.Serializable;
import java.util.Date;

public class Notice_Board implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	//http://devofhwb.tistory.com/17
	private int nb_no=0; 
	private String nb_category=null; //카테고리
	private String nb_title=null;
	private String nb_content=null;
	private Date nb_date=null;

	public Notice_Board() {
		super();
	}

	public Notice_Board(int nb_no, String nb_category, String nb_title, String nb_content, Date nb_date) {
		super();
		this.nb_no = nb_no;
		this.nb_category = nb_category;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_date = nb_date;
	}

	public String getNb_category() {
		return nb_category;
	}



	public void setNb_category(String nb_category) {
		this.nb_category = nb_category;
	}



	public int getNb_no() {
		return nb_no;
	}



	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}



	public String getNb_title() {
		return nb_title;
	}



	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}



	public String getNb_content() {
		return nb_content;
	}



	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}



	public Date getNb_date() {
		return nb_date;
	}



	public void setNb_date(Date nb_date) {
		this.nb_date = nb_date;
	}



	@Override
	public String toString() {
		return "Notice_Board [nb_no=" + nb_no + ", nb_category=" + nb_category + ", nb_title=" + nb_title
				+ ", nb_content=" + nb_content + ", nb_date=" + nb_date +  "]";
	}
	
	
	
}
