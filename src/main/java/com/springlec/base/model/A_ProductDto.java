package com.springlec.base.model;

public class A_ProductDto {
	
	
	String pid;
	String pname;
	int pprice;
	String pthumbnail;
	String pcategory;
	String id;
	String pw;
	String name;
	String tel;
	String email;
	int postcode;
	String address;
	String detailaddress;

	
	public A_ProductDto(String id, String pw, String name, String tel, String email, int postcode, String address,
			String detailaddress) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
	}

	public A_ProductDto(String pid, String pname, int pprice, String pthumbnail) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pthumbnail = pthumbnail;
	}

	public A_ProductDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public A_ProductDto(String pid, String pname, int pprice, String pthumbnail, String pcategory) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pthumbnail = pthumbnail;
		this.pcategory = pcategory;
	}

	public A_ProductDto(String pid, String pname, int pprice) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
	}
	
	public A_ProductDto(String pid) {
		super();
		this.pid = pid;
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

	public String getPthumbnail() {
		return pthumbnail;
	}

	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPostcode() {
		return postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
}
