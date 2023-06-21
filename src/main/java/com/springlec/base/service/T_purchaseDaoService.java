package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

public interface T_purchaseDaoService {
	
	// 배송지입력창
	public List<T_userinfoDto> ulistDao(String userid) throws Exception;
	
	// 구매하면 orders테이블로 넘기기
	public void orders(int count, String pname,
			int orderprice, String username, String userpostcode, String shipaddress, String usertel,
			String ordermessage, String userid, String pid, String payment, int usedmileage);
		
	// 구매하면 구매한 제품 cart에서 비우기
	public void deleteCart(String userid, String pid) throws Exception;
	
	// 구매하면 purchase비우기
	public void deletepurchase(String userid) throws Exception;

	// 마일리지 업데이트
	public void updateMileage(String userid, int usedmileage, int enteredmileage) throws Exception;
	
	// 구매결과화면
	public List<T_ordersDto> olistDao(String userid) throws Exception;
	
}
