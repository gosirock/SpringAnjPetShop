package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

public interface T_cartDao {
	// 카트 띄우기
	public List<T_ordersDto> clistDao() throws Exception;
	
	// 장바구니 수량 업데이트
	public void updateCartDao(String pid, int count) throws Exception;
	
	// 장바구니 선택 삭제
	public void deleteCartDao(String pid) throws Exception;
	
	// 장바구니 전체 삭제
	public void deleteAllcartDao(String userid) throws Exception;
	
	// 선택 구매
	public void insertPurchaseDao(String userid, String pid) throws Exception;
	
	// 전체 구매
	public void insertAllpurchaseDao(String userid) throws Exception;
	
	// 구매페이지 띄우기
	public List<T_ordersDto> plistDao() throws Exception;
	
	// 유저정보 띄우기
	public List<T_userinfoDto> ulistDao() throws Exception;

	//public void insertAllpurchaseDao(List<T_ordersDto> plistDao);
	
	
}
