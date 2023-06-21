package com.springlec.base.model;

public class W_SalesMonthlyChart_Dto {

	
	String date;
	int total;
	
	
	public W_SalesMonthlyChart_Dto() {
		// TODO Auto-generated constructor stub
	}

	
	
	

	public W_SalesMonthlyChart_Dto(int total, String date) {
		super();
		this.total = total;
		this.date = date;
	}





	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	
	
	
	
}

