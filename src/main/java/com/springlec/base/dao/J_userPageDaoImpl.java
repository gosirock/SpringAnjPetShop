package com.springlec.base.dao;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.J_ordersDto;
import com.springlec.base.model.J_userDto;

public class J_userPageDaoImpl implements J_userPageDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.J_userPageDao";
	

	@Override
	public J_userDto userInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".userInfo");
	}


	@Override
	public J_ordersDto orderMileage(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".orderMileage");
	}

	// 회원 정보 수정 처리 
	@Override
	public void updateInfo(String userpasswd, String usertel, String useremail, int userpostcode,
			String useraddress, String userdetailaddress) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".updateInfo");
		
	}

	// 회원 탈퇴 처리
	@Override
	public void deleteInfo(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".deleteInfo");
		
	}


	



}
