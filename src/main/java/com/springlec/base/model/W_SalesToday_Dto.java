package com.springlec.base.model;

public class W_SalesToday_Dto {

	int count;
	int orderprice;
	int usedmileage;
	int total;
	int productcount;

	public W_SalesToday_Dto() {
		// TODO Auto-generated constructor stub
	}

	public W_SalesToday_Dto(int count, int orderprice, int usedmileage, int total, int productcount) {
		super();
		this.count = count;
		this.orderprice = orderprice;
		this.usedmileage = usedmileage;
		this.total = total;
		this.productcount = productcount;
	}

	public int getProductcount() {
		return productcount;
	}

	public void setProductcount(int productcount) {
		this.productcount = productcount;
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

	public int getUsedmileage() {
		return usedmileage;
	}

	public void setUsedmileage(int usedmileage) {
		this.usedmileage = usedmileage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
