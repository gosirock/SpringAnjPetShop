package com.springlec.base.dao;


import java.util.List;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_SalesMonthlyChart_Dto;
import com.springlec.base.model.W_SalesMonthly_Dto;
import com.springlec.base.model.W_UserList_Dto;

public interface W_SalesMonthlyDao {

	
	public List<W_SalesMonthly_Dto> W_SalesMonthly(String day) throws Exception;
	public List<W_SalesMonthlyChart_Dto> W_SalesMonthlyChart(String day) throws Exception;
	
}
