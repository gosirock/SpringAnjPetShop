package com.springlec.base.dao;


import java.util.List;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_UserList_Dto;

public interface W_SalesDailyDao {

	
	public List<W_SalesDaily_Dto> W_SalesDaily(String day) throws Exception;
	
}
