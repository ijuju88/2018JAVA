package com.ds.seat.vo;

import java.io.Serializable;

public class Seat_Member implements Serializable{

	 
	private static final long serialVersionUID = 1L;
	
	public int m_no=0; 
	public String m_id=null; //아이디
	public String m_pw=null;  //비번
	public String m_name=null;  //이름
	public int m_age=0;  //나이
	public String m_tel=null;  //전화번호
	public int m_jumin1=0; //주민등록번호앞자리 
	public String m_zip=null; //우편번호
	public String m_addr1=null;  //기본주소
	public String m_addr2=null; //상세주소
	public String m_date=null; //가입일
	public int m_reting=0;  //등급 (0-관리자 1-사용자)
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public int getM_jumin1() {
		return m_jumin1;
	}
	public void setM_jumin1(int m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}
	public String getM_zip() {
		return m_zip;
	}
	public void setM_zip(String m_zip) {
		this.m_zip = m_zip;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getM_reting() {
		return m_reting;
	}
	public void setM_reting(int m_reting) {
		this.m_reting = m_reting;
	}
	@Override
	public String toString() {
		return "V1_Member [m_no=" + m_no + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_age="
				+ m_age + ", m_tel=" + m_tel + ", m_jumin1=" + m_jumin1 + ", m_zip=" + m_zip + ", m_addr1=" + m_addr1
				+ ", m_addr2=" + m_addr2 + ", m_date=" + m_date + ", m_reting=" + m_reting + "]";
	}
	
	
}
