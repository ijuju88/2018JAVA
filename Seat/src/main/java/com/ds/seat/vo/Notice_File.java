package com.ds.seat.vo;

import java.io.Serializable;
import java.util.Arrays;

public class Notice_File implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private int nf_num=0;
	private String nf_filename=null;
	private byte[] nf_filebyte=null;
	private int nb_no=0;

	public Notice_File() {
		super();
	}

	public Notice_File(int nf_num, String nf_filename, byte[] nf_filebyte, int nb_no) {
		super();
		this.nf_num = nf_num;
		this.nf_filename = nf_filename;
		this.nf_filebyte = nf_filebyte;
		this.nb_no = nb_no;
	}



	public int getNf_num() {
		return nf_num;
	}



	public void setNf_num(int nf_num) {
		this.nf_num = nf_num;
	}



	public String getNf_filename() {
		return nf_filename;
	}



	public void setNf_filename(String nf_filename) {
		this.nf_filename = nf_filename;
	}



	public byte[] getNf_filebyte() {
		return nf_filebyte;
	}



	public void setNf_filebyte(byte[] nf_filebyte) {
		this.nf_filebyte = nf_filebyte;
	}



	public int getNb_no() {
		return nb_no;
	}



	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}



	@Override
	public String toString() {
		return "Notice_file [nf_num=" + nf_num + ", nf_filename=" + nf_filename + ", nf_filebyte="
				+ Arrays.toString(nf_filebyte) + ", nb_no=" + nb_no + "]";
	}


}
