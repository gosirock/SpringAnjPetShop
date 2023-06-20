package com.springlec.base.model;

import java.sql.Timestamp;

public class J_ordersDto {

	String ordernum;
	int count;				// 주문한 수량 
	int orderprice;
	String username;
	String userpostcode;
	String shipaddress;
	String usertel;
	Timestamp orderdate; 
	String userid;
	String pid;
	String ordermessage;
	String payment;
	int usedmileage;
	
	int ordercount; 		// 주문 횟수 
	int totalUsedMileage; 	// 주문시 사용한 마일리지 총 합 
	int totalMileage;		// 총 적립된 마일리지 합 
	int totalPrice;	
	
	public J_ordersDto() {
		// TODO Auto-generated constructor stub
	}

	public J_ordersDto(String ordernum, int count, int orderprice, String username, String userpostcode,
			String shipaddress, String usertel, Timestamp orderdate, String userid, String pid, String ordermessage,
			String payment, int usedmileage, int ordercount, int totalUsedMileage, int totalMileage, int totalPrice) {
		super();
		this.ordernum = ordernum;
		this.count = count;
		this.orderprice = orderprice;
		this.username = username;
		this.userpostcode = userpostcode;
		this.shipaddress = shipaddress;
		this.usertel = usertel;
		this.orderdate = orderdate;
		this.userid = userid;
		this.pid = pid;
		this.ordermessage = ordermessage;
		this.payment = payment;
		this.usedmileage = usedmileage;
		this.ordercount = ordercount;
		this.totalUsedMileage = totalUsedMileage;
		this.totalMileage = totalMileage;
		this.totalPrice = totalPrice;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getOrderprice() {
		return orderprice;
	}

	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpostcode() {
		return userpostcode;
	}

	public void setUserpostcode(String userpostcode) {
		this.userpostcode = userpostcode;
	}

	public String getShipaddress() {
		return shipaddress;
	}

	public void setShipaddress(String shipaddress) {
		this.shipaddress = shipaddress;
	}

	public String getUsertel() {
		return usertel;
	}

	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}

	public Timestamp getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
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

	public String getOrdermessage() {
		return ordermessage;
	}

	public void setOrdermessage(String ordermessage) {
		this.ordermessage = ordermessage;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getUsedmileage() {
		return usedmileage;
	}

	public void setUsedmileage(int usedmileage) {
		this.usedmileage = usedmileage;
	}

	public int getOrdercount() {
		return ordercount;
	}

	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}

	public int getTotalUsedMileage() {
		return totalUsedMileage;
	}

	public void setTotalUsedMileage(int totalUsedMileage) {
		this.totalUsedMileage = totalUsedMileage;
	}

	public int getTotalMileage() {
		return totalMileage;
	}

	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
