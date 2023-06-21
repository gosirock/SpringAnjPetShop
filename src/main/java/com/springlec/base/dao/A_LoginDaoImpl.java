package com.springlec.base.dao;


import org.apache.ibatis.session.SqlSession;


public class A_LoginDaoImpl implements A_LoginDao {
	
	SqlSession sqlsession;
	public static String nameSpace = "com.springlec.base.dao.A_LoginDao";

	@Override
	public String loginChack(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace + ".loginChack");
	}

}
