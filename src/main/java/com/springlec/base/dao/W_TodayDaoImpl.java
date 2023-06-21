package com.springlec.base.dao;


import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.W_SalesToday_Dto;

public class W_TodayDaoImpl implements W_TodayDao {

	
	SqlSession session;
	public static String nameSpace = "com.springlec.base.dao.W_Dao";
	
	@Override
	public W_SalesToday_Dto W_TodayTable() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".W_TodayTable");
	}
		
	@Override
	public int W_Yesterday() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".W_Yesterday");
	}

	@Override
	public int W_avg() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".W_avg");
	}
	
}
