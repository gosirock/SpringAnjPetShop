package com.springlec.base.model;

public class O_reviewDto {

	// Field
	int seq;
	String r_title;
	String r_content;
	String writedate;
	int isdelete;
	String userid;
	int orderseq;
	String filename;
	String pname;
	String pthumbnail;
	
	// Constructor
	public O_reviewDto() {
		// TODO Auto-generated constructor stub
	}

	
	// 상품 이름과 썸네일 같이 가지고 오기 위한 생성자
	public O_reviewDto(int seq, String r_title, String r_content, String writedate, int isdelete, String userid,
			int orderseq, String filename, String pname, String pthumbnail) {
		super();
		this.seq = seq;
		this.r_title = r_title;
		this.r_content = r_content;
		this.writedate = writedate;
		this.isdelete = isdelete;
		this.userid = userid;
		this.orderseq = orderseq;
		this.filename = filename;
		this.pname = pname;
		this.pthumbnail = pthumbnail;
	}

	// 리스트 들고오기 위한 생성자
	public O_reviewDto(int seq, String r_title, String r_content, String writedate, int isdelete, String userid,
			int orderseq, String filename) {
		super();
		this.seq = seq;
		this.r_title = r_title;
		this.r_content = r_content;
		this.writedate = writedate;
		this.isdelete = isdelete;
		this.userid = userid;
		this.orderseq = orderseq;
		this.filename = filename;
	}


	// Getter And Setter
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getOrderseq() {
		return orderseq;
	}

	public void setOrderseq(int orderseq) {
		this.orderseq = orderseq;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPthumbnail() {
		return pthumbnail;
	}

	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
} // End