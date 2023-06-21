package com.springlec.base.model;

public class A_LoginDto {

	
	String id;
	String pw;
	
	public A_LoginDto() {
		// TODO Auto-generated constructor stub
	}

	public A_LoginDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
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
	
}
