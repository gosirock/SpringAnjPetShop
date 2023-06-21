package com.springlec.base.dao;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
@Primary
@Repository
public interface T_purchaseDao {
	
	
	public List<T_userinfoDto> ulistDao(String userid) throws Exception;
	
	// 주문해서 orders테이블로 넘기기	
	public void orders(int count, String pname,
			int orderprice, String username, String userpostcode, String shipaddress, String usertel,
			String ordermessage, String userid, String pid, String payment, int usedmileage);

	public void deleteCart(String userid, String pid) throws Exception;
	
	public void deletepurchase(String userid) throws Exception;
	
	public void updateMileage(String userid, int usedmileage, int enteredmileage) throws Exception;
	
	public List<T_ordersDto> olistDao(String userid) throws Exception;
	
}
