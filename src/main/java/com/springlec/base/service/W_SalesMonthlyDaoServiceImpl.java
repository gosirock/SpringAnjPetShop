package com.springlec.base.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.W_ProductListDao;
import com.springlec.base.dao.W_SalesDailyDao;
import com.springlec.base.dao.W_SalesMonthlyDao;
import com.springlec.base.dao.W_TodayDao;
import com.springlec.base.dao.W_UserListDao;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_SalesMonthly_Dto;
import com.springlec.base.model.W_SalesMonthlyChart_Dto;
import com.springlec.base.model.W_SalesToday_Dto;
import com.springlec.base.model.W_UserList_Dto;

@Service
public class W_SalesMonthlyDaoServiceImpl implements W_SalesMonthlyDaoService {

	@Autowired
	W_SalesMonthlyDao dao;


	@Override
	public List<W_SalesMonthly_Dto> W_SalesMonthly(String day) throws Exception {
		// TODO Auto-generated method stub
		day = day + "-01";
		
		return dao.W_SalesMonthly(day);
	}


	@Override
	public List<W_SalesMonthlyChart_Dto> W_SalesMonthlyChart(String day) throws Exception {
		// TODO Auto-generated method stub
		day = day + "-01";
		return dao.W_SalesMonthlyChart(day);
	}

	
	

}
