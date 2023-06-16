package com.springlec.base.model;

public class W_UserList_Dto {

	
	
	String userid;
	String username;
	String usertel;
	String useremail;
	String useraddress;
	int mileage;
	String insertdate;
	String deletedate;
	int count;
	
	
	
	
	
	
	
	
	
	
	public W_UserList_Dto() {
		// TODO Auto-generated constructor stub
	}


	
	
	
	
	

	public W_UserList_Dto(String userid, String username, String usertel, String useremail, String useraddress,
			int mileage, String insertdate, String deletedate, int count) {
		super();
		this.userid = userid;
		this.username = username;
		this.usertel = usertel;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.mileage = mileage;
		this.insertdate = insertdate;
		this.deletedate = deletedate;
		this.count = count;
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



	public String getUseraddress() {
		return useraddress;
	}



	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}



	public int getMileage() {
		return mileage;
	}



	public void setMileage(int mileage) {
		this.mileage = mileage;
	}



	public String getInsertdate() {
		return insertdate;
	}



	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}



	public String getDeletedate() {
		return deletedate;
	}



	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}



	
	
	
	
	
	
}//End
