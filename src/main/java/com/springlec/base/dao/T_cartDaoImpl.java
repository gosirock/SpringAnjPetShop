package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.T_ordersDto;

public class T_cartDaoImpl implements T_cartDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.T_cartDao";
	
	// 장바구니 띄우기
	@Override
	public List<T_ordersDto> plistDao() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".plistDao");
	}

}
