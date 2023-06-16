package com.springlec.base.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class T_ordersDto {
	
	// Filed
	String userid;
	String ordernum;
	String orderdate;
	int orderprice;
	String payment;
	String pid;
	String pname;
	int pprice;
	int count;
	String username;
	String userpostcode;
	private String useraddress;
	String shipaddress;
	String usertel;
	int usedmileage;
	String ordermessage;
	private List<String> pidList;
    private List<String> pnameList;
    private List<Integer> orderpriceList;
    private List<Integer> countList;
    
    private List<T_productDto> productList;
    
	
	// Construct
	
	public T_ordersDto() {
//	    this.ordernum = "";
//	    this.orderdate = "";
//	    this.usedmileage = 0;
//	    this.orderprice = 0;
//	    this.payment = "";
//	    this.pid = "";
//	    this.pname = "";
//	    this.count = 0;
//	    this.username = "";
//	    this.userpostcode = "";
//	    this.shipaddress = "";
//	    this.usertel = "";
//	    this.ordermessage = "";
	}
	/* , HttpServletRequest request */
	public T_ordersDto(String userid, String ordernum, String orderdate, int orderprice, String payment, String pid,
			String pname, int pprice, int count, String username, String userpostcode, String shipaddress,
			String usertel, int usedmileage, String ordermessage) {
		super();
		this.userid = userid;
		this.ordernum = ordernum;
		this.orderdate = orderdate;
		this.orderprice = orderprice;
		this.payment = payment;
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.count = count;
		this.username = username;
		this.userpostcode = userpostcode;
		this.shipaddress = shipaddress;
		this.usertel = usertel;
		this.usedmileage = usedmileage;
		this.ordermessage = ordermessage;
	}

	public String getUserid() {
		return userid;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public int getOrderprice() {
		return orderprice;
	}

	public String getPayment() {
		return payment;
	}

	public String getPid() {
		return pid;
	}

	public String getPname() {
		return pname;
	}

	public int getPprice() {
		return pprice;
	}

	public int getCount() {
		return count;
	}

	public String getUsername() {
		return username;
	}

	public String getUserpostcode() {
		return userpostcode;
	}

	public String getShipaddress() {
		return shipaddress;
	}

	public String getUsertel() {
		return usertel;
	}

	public int getUsedmileage() {
		return usedmileage;
	}

	public String getOrdermessage() {
		return ordermessage;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserpostcode(String userpostcode) {
		this.userpostcode = userpostcode;
	}

	public void setShipaddress(String shipaddress) {
		this.shipaddress = shipaddress;
	}

	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}

	public void setUsedmileage(int usedmileage) {
		this.usedmileage = usedmileage;
	}

	public void setOrdermessage(String ordermessage) {
		this.ordermessage = ordermessage;
	}
	public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }
    public List<String> getPidList() {
        return pidList;
    }

    public void setPidList(List<String> pidList) {
        this.pidList = pidList;
    }

    public List<String> getPnameList() {
        return pnameList;
    }

    public void setPnameList(List<String> pnameList) {
        this.pnameList = pnameList;
    }

    public List<Integer> getCountList() {
        return countList;
    }

    public void setCountList(List<Integer> countList) {
        this.countList = countList;
    }
    
    public List<Integer> getOrderpriceList() {
        return orderpriceList;
    }

    public void setOrderpriceList(List<Integer> orderpriceList) {
        this.orderpriceList = orderpriceList;
    }

    public List<T_productDto> getProductList() {
        return productList;
    }
	
    public void setProductList(List<T_productDto> productList) {
        this.productList = productList;
    }
}
