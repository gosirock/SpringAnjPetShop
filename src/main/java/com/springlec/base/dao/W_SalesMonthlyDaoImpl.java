package com.springlec.base.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_SalesMonthlyChart_Dto;
import com.springlec.base.model.W_SalesMonthly_Dto;
import com.springlec.base.model.W_UserList_Dto;

public class W_SalesMonthlyDaoImpl implements W_SalesMonthlyDao {

	
	SqlSession session;
	public static String nameSpace = "com.springlec.base.dao.W_Dao";
	@Override
	public List<W_SalesMonthly_Dto> W_SalesMonthly(String day) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".W_SalesMonthly");
	}
	
	
	@Override
	public List<W_SalesMonthlyChart_Dto> W_SalesMonthlyChart(String day) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".W_SalesMonthlyChart");
	}
	
	
	
}
