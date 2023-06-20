package com.springlec.base.model;

public class J_userDto {
	
	String userid;
	String userpasswd;
	String username;
	String usertel;
	String useremail;
	int userpostcode;
	String useraddress;
	String userdetailaddress;
	String deletedate;
	int mileage; 
	
	public J_userDto() {
		// TODO Auto-generated constructor stub
	}

	public J_userDto(String userid, String userpasswd, String username, String usertel, String useremail,
			int userpostcode, String useraddress, String userdetailaddress, String deletedate, int mileage) {
		super();
		this.userid = userid;
		this.userpasswd = userpasswd;
		this.username = username;
		this.usertel = usertel;
		this.useremail = useremail;
		this.userpostcode = userpostcode;
		this.useraddress = useraddress;
		this.userdetailaddress = userdetailaddress;
		this.deletedate = deletedate;
		this.mileage = mileage;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpasswd() {
		return userpasswd;
	}

	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsertel() {
		return usertel;
	}

	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public int getUserpostcode() {
		return userpostcode;
	}

	public void setUserpostcode(int userpostcode) {
		this.userpostcode = userpostcode;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getUserdetailaddress() {
		return userdetailaddress;
	}

	public void setUserdetailaddress(String userdetailaddress) {
		this.userdetailaddress = userdetailaddress;
	}

	public String getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	
	

}
