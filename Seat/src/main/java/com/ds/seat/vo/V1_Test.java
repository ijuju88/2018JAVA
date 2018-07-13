package com.ds.seat.vo;

import java.io.Serializable;

public class V1_Test implements Serializable {


	private static final long serialVersionUID = 1L;
	
	public int no=0;
	public String name=null;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "V1_Test [no=" + no + ", name=" + name + "]";
	}
	
}
