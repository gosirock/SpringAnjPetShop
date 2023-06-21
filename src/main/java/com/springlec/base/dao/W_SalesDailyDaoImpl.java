package com.springlec.base.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_UserList_Dto;

public class W_SalesDailyDaoImpl implements W_SalesDailyDao {

	
	SqlSession session;
	public static String nameSpace = "com.springlec.base.dao.W_Dao";
	@Override
	public List<W_SalesDaily_Dto> W_SalesDaily(String day) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".W_SalesDaily");
	}
	
	
	
}
