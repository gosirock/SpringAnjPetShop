package com.springlec.base.dao;


import com.springlec.base.model.W_SalesToday_Dto;

public interface W_TodayDao {

	
	public W_SalesToday_Dto W_TodayTable() throws Exception;
	public int W_Yesterday() throws Exception;
	public int W_avg() throws Exception;
	
	
}
