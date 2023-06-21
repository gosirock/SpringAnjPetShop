package com.springlec.base.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.W_ProductListDao;
import com.springlec.base.dao.W_SalesDailyDao;
import com.springlec.base.dao.W_TodayDao;
import com.springlec.base.dao.W_UserListDao;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_SalesToday_Dto;
import com.springlec.base.model.W_UserList_Dto;

@Service
public class W_SalesDailyDaoServiceImpl implements W_SalesDailyDaoService {

	@Autowired
	W_SalesDailyDao dao;


	@Override
	public List<W_SalesDaily_Dto> W_SalesDaily(String day) throws Exception {
		// TODO Auto-generated method stub
		return dao.W_SalesDaily(day);
	}

	
	

}
