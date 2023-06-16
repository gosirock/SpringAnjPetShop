package com.springlec.base.model;

public class T_userinfoDto {
    // Fields
    private String userid;
    private String username;
    private String usertel;
    private String useremail;
    private String userpostcode;
    private String useraddress;
    private String userdetailaddress;
    private int mileage;
    private int usedmileage;

    // Constructors
    public T_userinfoDto() {
    }

    public T_userinfoDto(String username, String userpostcode, String useraddress, String userdetailaddress, String usertel, String useremail, int mileage, int usedmileage) {
        this.username = username;
        this.userpostcode = userpostcode;
        this.useraddress = useraddress;
        this.userdetailaddress = userdetailaddress;
        this.usertel = usertel;
        this.useremail = useremail;
        this.mileage = mileage;
        this.usedmileage = usedmileage;
    }

    // Getters and Setters
    
 
    

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
    
    public String getUserpostcode() {
    	return userpostcode;
    }
    
    public void setUserpostcode(String userpostcode) {
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
    
    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public int getUsedmileage() {
    	return usedmileage;
    }
    
    public void setUsedmileage(int usedmileage) {
    	this.usedmileage = usedmileage;
    }
}
