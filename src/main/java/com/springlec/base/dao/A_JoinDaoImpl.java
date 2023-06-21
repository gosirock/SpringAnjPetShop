package com.springlec.base.dao;

import org.apache.ibatis.session.SqlSession;

public class A_JoinDaoImpl implements A_JoinDao {

	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.A_JoinDao";
	
	
	@Override
	public String joinIdChack(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".loginChack");
	}


	@Override
	public void join(String id, String pw, String name, String tel, String email, int postcode, String address,
			String detailaddress) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".join");
	}

}
