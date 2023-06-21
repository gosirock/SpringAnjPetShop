package com.springlec.base.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

public class T_cartDaoImpl implements T_cartDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.T_cartDao";
	
	// 장바구니 띄우기
	@Override
	public List<T_ordersDto> clistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".clistDao");
	}

	// 장바구니 수량 업데이트
	@Override
	public void updateCartDao(String pid, int count) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao에 전달된 pid = " + pid);
		System.out.println("dao에 전달된 count = " + count);
		sqlSession.update(nameSpace + ".updateCartDao");
	}

	// 장바구니 선택삭제
	@Override
	public void deleteCartDao(String pid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + ".deleteCartDao");
	}
	
	// 장바구니 전체 삭제
	@Override
	public void deleteAllcartDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + ".deleteAllcartDao");
	}

	// 선택 구매
	@Override
	public void insertPurchaseDao(String userid, String pid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertPurchaseDao");
	}
	
	// 전체 구매
	@Override
	public void insertAllpurchaseDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".insertAllpurchaseDao");
	}

	// 구매페이지 띄우기
	@Override
	public List<T_ordersDto> plistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".plistDao");
	}

	// 유저정보 띄우기
	@Override
	public List<T_userinfoDto> ulistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".ulistDao");
	}

//	@Override
//	public void insertAllpurchaseDao(List<T_ordersDto> plistDao) {
//		// TODO Auto-generated method stub
//		sqlSession.insert(nameSpace + ".insertAllpurchaseDao");
//	}

	

	

	
	
	

}
