package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.A_ProductDto;


public class A_ProductDaoImpl implements A_ProductDao {
	
	SqlSession sqlsession;
	public static String nameSpace = "com.springlec.base.dao.A_ProductDao";

	@Override
	public List<A_ProductDto> A_ProductView() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".A_ProductView");
	}

}
