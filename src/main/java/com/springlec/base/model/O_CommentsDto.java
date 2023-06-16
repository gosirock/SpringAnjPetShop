package com.springlec.base.model;

public class O_CommentsDto {

	// Field
	int c_seq;
	int rootseq;
	int ref;
	int step;
	int reforder;
	int answernum;
	String writer;
	int parentseq;
	String comments;
	String writedate;
	int isdelete;
	
	// Constructor
	public O_CommentsDto() {
		// TODO Auto-generated constructor stub
	}


	public O_CommentsDto(int c_seq, int rootseq, int ref, int step, int reforder, int answernum, String writer,
			int parentseq, String comments, String writedate, int isdelete) {
		super();
		this.c_seq = c_seq;
		this.rootseq = rootseq;
		this.ref = ref;
		this.step = step;
		this.reforder = reforder;
		this.answernum = answernum;
		this.writer = writer;
		this.parentseq = parentseq;
		this.comments = comments;
		this.writedate = writedate;
		this.isdelete = isdelete;
	}

	// Getter And Setter
	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public int getRootseq() {
		return rootseq;
	}

	public void setRootseq(int rootseq) {
		this.rootseq = rootseq;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getReforder() {
		return reforder;
	}

	public void setReforder(int reforder) {
		this.reforder = reforder;
	}

	public int getAnswernum() {
		return answernum;
	}

	public void setAnswernum(int answernum) {
		this.answernum = answernum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getParentseq() {
		return parentseq;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
}
