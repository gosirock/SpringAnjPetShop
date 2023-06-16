package com.springlec.base.model;

public class O_QnaDto {

	// Field
	int seq;
	String category;
	String qna_title;
	String qna_content;
	int parentseq;
	String writedate;
	String userid;
	String adminid;
	
	// Constructor
	public O_QnaDto() {
		// TODO Auto-generated constructor stub
	}

	public O_QnaDto(int seq, String category, String qna_title, String qna_content, int parentseq, String writedate,
			String userid, String adminid) {
		super();
		this.seq = seq;
		this.category = category;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.parentseq = parentseq;
		this.writedate = writedate;
		this.userid = userid;
		this.adminid = adminid;
	}

	// Getter And Setter
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getParentseq() {
		return parentseq;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	
	
}
