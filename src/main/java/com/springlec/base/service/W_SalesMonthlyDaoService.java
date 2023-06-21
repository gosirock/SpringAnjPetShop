package com.springlec.base.service;


import java.util.List;

import com.springlec.base.model.W_SalesMonthly_Dto;
import com.springlec.base.model.W_SalesMonthlyChart_Dto;

public interface W_SalesMonthlyDaoService {

	
	public List<W_SalesMonthly_Dto> W_SalesMonthly(String day) throws Exception;
	public List<W_SalesMonthlyChart_Dto> W_SalesMonthlyChart(String day) throws Exception;
}
