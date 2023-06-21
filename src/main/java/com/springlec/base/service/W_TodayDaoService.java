package com.springlec.base.service;


import com.springlec.base.model.W_SalesToday_Dto;

public interface W_TodayDaoService {

	
	public W_SalesToday_Dto W_TodayTable() throws Exception;
	public int W_Yesterday() throws Exception;
	public int W_avg() throws Exception;
}
