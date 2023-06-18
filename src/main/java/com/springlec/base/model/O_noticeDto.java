package com.springlec.base.model;

import java.awt.TextArea;

public class O_noticeDto {

	// Field
	int seq;
	String adminid;
	String n_title;
	String n_content;
	String writedate;
	int isdelete;
	
	// Constructor
	public O_noticeDto() {
		// TODO Auto-generated constructor stub
	}

	public O_noticeDto(int seq, String adminid, String n_title, String n_content, String writedate) {
		super();
		this.seq = seq;
		this.adminid = adminid;
		this.n_title = n_title;
		this.n_content = n_content;
		this.writedate = writedate;
	}
	
	public O_noticeDto(int seq, String n_title, String n_content, int isdelete) {
		super();
		this.seq = seq;
		this.n_title = n_title;
		this.n_content = n_content;
		this.isdelete = isdelete;
	}

	
	
	public O_noticeDto(String n_title, String n_content, String writedate) {
		super();
		this.n_title = n_title;
		this.n_content = n_content;
		this.writedate = writedate;
	}

	// Getter And Setter
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	
}
