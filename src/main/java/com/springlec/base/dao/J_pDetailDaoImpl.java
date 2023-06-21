package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.J_productDto;
import com.springlec.base.model.J_purchaseDto;

public class J_pDetailDaoImpl implements J_pDetailDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.J_pDetailDao";
	
	@Override
	public J_productDto viewPDetail(String pid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".viewPDetail");
	}

	@Override
	public void insertCart(String pid, String userid, int count) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertCart");
	}

	@Override
	public void insertPurchase(String pid, String userid, int count) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertPurchase");
		
	}

	@Override
	public List<J_purchaseDto> selectPurchase(String pid, String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".selectPurchase");
		
	}

}
