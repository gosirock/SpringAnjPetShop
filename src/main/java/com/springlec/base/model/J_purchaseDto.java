package com.springlec.base.model;

public class J_purchaseDto {
	int count;
	String userid;
	String pid;
	String pthumbnail;
	String pname;
	int pprice;
	
	
	public J_purchaseDto() {
		// TODO Auto-generated constructor stub
	}

	

	public J_purchaseDto(int count, String userid, String pid, String pthumbnail, String pname, int pprice) {
		super();
		this.count = count;
		this.userid = userid;
		this.pid = pid;
		this.pthumbnail = pthumbnail;
		this.pname = pname;
		this.pprice = pprice;
	}



	public String getPthumbnail() {
		return pthumbnail;
	}



	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}



	public String getPname() {
		return pname;
	}



	public void setPname(String pname) {
		this.pname = pname;
	}



	public int getPprice() {
		return pprice;
	}



	public void setPprice(int pprice) {
		this.pprice = pprice;
	}



	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	
	

}
