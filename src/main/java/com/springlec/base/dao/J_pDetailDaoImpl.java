package com.springlec.base.dao;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.J_productDto;

public class J_pDetailDaoImpl implements J_pDetailDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.J_pDetailDao";
	
	@Override
	public J_productDto viewPDetail(String pid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".viewPDetail");
	}

	@Override
	public void insertCart(String pid, String uid, int count) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertCart");
	}

	@Override
	public void insertPurchase(String pid, String uid, int count) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertPurchase");
		
	}

}