package com.springlec.base.model;

public class O_calcCommentDto {

	int maxRefOrder;
	int maxAnswerNum;
	
	public O_calcCommentDto() {
		// TODO Auto-generated constructor stub
	}

	public O_calcCommentDto(int maxRefOrder, int maxAnswerNum) {
		super();
		this.maxRefOrder = maxRefOrder;
		this.maxAnswerNum = maxAnswerNum;
	}

	public int getMaxRefOrder() {
		return maxRefOrder;
	}

	public void setMaxRefOrder(int maxRefOrder) {
		this.maxRefOrder = maxRefOrder;
	}

	public int getMaxAnswerNum() {
		return maxAnswerNum;
	}

	public void setMaxAnswerNum(int maxAnswerNum) {
		this.maxAnswerNum = maxAnswerNum;
	}
	
	
}
