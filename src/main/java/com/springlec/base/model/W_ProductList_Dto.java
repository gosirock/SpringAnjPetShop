package com.springlec.base.model;

public class W_ProductList_Dto {
	
	// Field
	
	String pthumbnail;
	String pid;
	String pname;
	String pcategory;
	int pprice;
	int pstock;
	String available;
	int count;
	String pth2;
	String pth3;
	public W_ProductList_Dto() {
		// TODO Auto-generated constructor stub
	}



	public W_ProductList_Dto(String pthumbnail, String pid, String pname, String pcategory, int pprice, int pstock,
			String available, int count) {
		super();
		this.pthumbnail = pthumbnail;
		this.pid = pid;
		this.pname = pname;
		this.pcategory = pcategory;
		this.pprice = pprice;
		this.pstock = pstock;
		this.available = available;
		this.count = count;
	}


	public W_ProductList_Dto(String pthumbnail, String pid, String pname, String pcategory, int pprice, int pstock,
			String available, String pth2, String pth3) {
		super();
		this.pthumbnail = pthumbnail;
		this.pid = pid;
		this.pname = pname;
		this.pcategory = pcategory;
		this.pprice = pprice;
		this.pstock = pstock;
		this.available = available;
		this.pth2 = pth2;
		this.pth3 = pth3;
	}



	public int getCount() {
		return count;
	}














	public void setCount(int count) {
		this.count = count;
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



	public String getPthumbnail() {
		return pthumbnail;
	}

	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
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

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}
	
	
	
	
	
	
	
}
