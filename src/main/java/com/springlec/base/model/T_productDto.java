package com.springlec.base.model;

import java.util.ArrayList;
import java.util.List;


public class T_productDto {

	// Field
	String ordernum;
	String pthumbnail;
	int seq;
	int count;
	String userid;
	String pid;
	String pname;
	int pprice;
	int orderprice;
	List<String> pidList = new ArrayList<>();
    List<String> pnameList = new ArrayList<>();
    List<Integer> orderpriceList = new ArrayList<>();
    List<Integer> countList = new ArrayList<>();
	
	// Constructor
	public T_productDto() {
		// TODO Auto-generated constructor stub
	}

	public T_productDto(int seq, String pthumbnail, String pid, String pname, int pprice, int count) {
		super();
		this.seq = seq;
		this.pthumbnail = pthumbnail;
		//this.userid = userid;
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.count = count;
	}
	
	

	//, HttpServletRequest request
	public T_productDto(String pthumbnail, String pid, String pname, int orderprice, int count) {
		super();
		this.pthumbnail = pthumbnail;
		this.pid = pid;
		this.pname = pname;
		this.orderprice = orderprice;
		this.count = count;
	}
	
	public String getPthumbnail() {
		return pthumbnail;
	}

	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}
	
	public List<String> getPidList() {
		return pidList;
	}

	public List<String> getPnameList() {
		return pnameList;
	}

	public List<Integer> getOrderpriceList() {
		return orderpriceList;
	}

	public List<Integer> getCountList() {
		return countList;
	}

	public void setPidList(List<String> pidList) {
		this.pidList = pidList;
	}

	public void setPnameList(List<String> pnameList) {
		this.pnameList = pnameList;
	}

	public void setOrderpriceList(List<Integer> orderpriceList) {
		this.orderpriceList = orderpriceList;
	}

	public void setCountList(List<Integer> countList) {
		this.countList = countList;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
	
	public int getOrderprice() {
		return orderprice;
	}

	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
	
	
}
