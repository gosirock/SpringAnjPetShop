package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.A_MainDto;

public class A_MainDaoImpl implements A_MainDao {
	
	SqlSession sqlsession;
	public static String nameSpace = "com.springlec.base.dao.A_MainDao";


		//  메인페이지 상품 랜덤 노출
	@Override
	public List<A_MainDto> A_MainView3() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".A_MainView3");
	}


		// 메인페이지 상품 판매량 순 노출
	@Override
	public List<A_MainDto> A_MainView2() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + "A_MainView2");
	}

}
