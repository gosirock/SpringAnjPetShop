package com.springlec.base.model;

public class J_productDto {
	String pid;
	String pname;
	String pcategory;
	int pprice;
	int pstock;
	int available;
	String pthumbnail;
	String pth2;
	String pth3;
	String pfilename;
	
	public J_productDto() {
		// TODO Auto-generated constructor stub
	}

	public J_productDto(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3, String pfilename) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcategory = pcategory;
		this.pprice = pprice;
		this.pstock = pstock;
		this.available = available;
		this.pthumbnail = pthumbnail;
		this.pth2 = pth2;
		this.pth3 = pth3;
		this.pfilename = pfilename;
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

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public String getPthumbnail() {
		return pthumbnail;
	}

	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}

	public String getPth2() {
		return pth2;
	}

	public void setPth2(String pth2) {
		this.pth2 = pth2;
	}

	public String getPth3() {
		return pth3;
	}

	public void setPth3(String pth3) {
		this.pth3 = pth3;
	}

	public String getPfilename() {
		return pfilename;
	}

	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}
	
	
	
	
	
	
	
	
	

}
