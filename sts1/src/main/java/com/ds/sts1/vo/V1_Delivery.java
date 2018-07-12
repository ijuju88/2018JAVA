package com.ds.sts1.vo;

public class V1_Delivery {

	private int dvr_no=0;
	private int dvr_status=0;
	private String dvr_date=null;
	private int ord_id=0;
	
	public int getDvr_no() {
		return dvr_no;
	}

	public void setDvr_no(int dvr_no) {
		this.dvr_no = dvr_no;
	}

	public int getDvr_status() {
		return dvr_status;
	}

	public void setDvr_status(int dvr_status) {
		this.dvr_status = dvr_status;
	}

	public String getDvr_date() {
		return dvr_date;
	}

	public void setDvr_date(String dvr_date) {
		this.dvr_date = dvr_date;
	}

	public int getOrd_id() {
		return ord_id;
	}

	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}

	@Override
	public String toString() {
		return "V1_Delivery [dvr_no=" + dvr_no + ", dvr_status=" + dvr_status + ", dvr_date=" + dvr_date + ", ord_id="
				+ ord_id + "]";
	}
	
	
}
