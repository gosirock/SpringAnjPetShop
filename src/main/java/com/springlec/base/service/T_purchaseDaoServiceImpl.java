package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.T_purchaseDao;
import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

@Service
public class T_purchaseDaoServiceImpl implements T_purchaseDaoService {

	@Autowired
	T_purchaseDao dao;
	

	@Override
	public List<T_userinfoDto> ulistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return dao.ulistDao(userid);
	}


	@Override
	public void orders(int count, String pname, int orderprice, String username, String userpostcode,
			String shipaddress, String usertel, String ordermessage, String userid, String pid, String payment, int usedmileage) {
		// TODO Auto-generated method stub
		dao.orders(count, pname, orderprice, username, userpostcode, shipaddress, usertel, userid, pid, ordermessage, payment, usedmileage);
	}
	
	@Override
	public void deleteCart(String userid, String pid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteCart(userid, pid);
	}

	@Override
	public void deletepurchase(String userid) throws Exception {
		// TODO Auto-generated method stub
		dao.deletepurchase(userid);
	}
	

	@Override
	public List<T_ordersDto> olistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return dao.olistDao(userid);
	}

	@Override
	public void updateMileage(String userid, int usedmileage, int enteredmileage) throws Exception {
		// TODO Auto-generated method stub
		dao.updateMileage(userid, usedmileage, enteredmileage);
	}


	


	

	// 주문해서 orders테이블로 넘기기
//	@Override
//	public void orders(String pidList, int countList, String pnameList, int orderpriceList, String username, String userpostcode, String shipaddress, String usertel, String ordermessage, String payment,
//			int usedmileage, int enteredmileage) throws Exception {
//		// TODO Auto-generated method stub
//		dao.orders(pidList, countList, pnameList, orderpriceList, username, userpostcode, shipaddress, usertel, ordermessage, payment, usedmileage, enteredmileage);
//	}

//	@Override
//	public void orders(List<String> pidList, List<Integer> countList, List<String> pnameList,
//			List<Integer> orderpriceList, String username, String userpostcode, String shipaddress, String usertel,
//			String ordermessage, String payment, int usedmileage, int enteredmileage) {
//		// TODO Auto-generated method stub
//		dao.orders(pidList, countList, pnameList, orderpriceList, username, userpostcode, shipaddress, usertel, ordermessage, payment, usedmileage, enteredmileage);
//	}

//	@Override
//	public void orders(List<Integer> countList, List<String> pnameList,
//			List<Integer> orderpriceList, String username, String userpostcode, String shipaddress, String usertel,
//			String ordermessage, List<String> pidList, String payment, int usedmileage) {
//		// TODO Auto-generated method stub
//		dao.orders(countList, pnameList, orderpriceList, username, userpostcode, shipaddress, usertel, ordermessage, pidList, payment, usedmileage);
//	}




	
	

}
