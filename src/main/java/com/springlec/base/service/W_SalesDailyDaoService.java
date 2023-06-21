package com.springlec.base.service;


import java.util.List;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_UserList_Dto;

public interface W_SalesDailyDaoService {

	
	public List<W_SalesDaily_Dto> W_SalesDaily(String day) throws Exception;
}
