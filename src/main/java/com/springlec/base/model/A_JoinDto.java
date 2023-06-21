package com.springlec.base.model;

public class A_JoinDto {

	String id;
	String pw;
	String name;
	String tel;
	String email;
	int postcode;
	String address;
	String detailaddress;
	
	
	public A_JoinDto() {
	// TODO Auto-generated constructor stub
}


	public A_JoinDto(String id, String pw, String name, String tel, String email, int postcode, String address,
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
