package com.springlec.base.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.W_TodayDao;
import com.springlec.base.model.W_SalesToday_Dto;

@Service
public class W_TodayDaoServiceImpl implements W_TodayDaoService {

	@Autowired
	W_TodayDao dao;
	
	@Override
	public W_SalesToday_Dto W_TodayTable() throws Exception {
		// TODO Auto-generated method stub
		return dao.W_TodayTable();
	}

	@Override
	public int W_Yesterday() throws Exception {
		// TODO Auto-generated method stub
		return dao.W_Yesterday();
	}

	@Override
	public int W_avg() throws Exception {
		// TODO Auto-generated method stub
		return dao.W_avg();
	}
	
	

}
