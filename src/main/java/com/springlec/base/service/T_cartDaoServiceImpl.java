package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.T_cartDao;
import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
@Service
public class T_cartDaoServiceImpl implements T_cartDaoService {

	@Autowired
	T_cartDao dao;
	
	// 장바구니 띄우기
	@Override
	public List<T_ordersDto> clistDao() throws Exception {
		// TODO Auto-generated method stub
		return dao.clistDao();
	}

	// 장바구니 수량 업데이트
	@Override
	public void updateCartDao(String pid, int count) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("dao에 전달된 pid = " + pid);
//		System.out.println("dao에 전달된 count = " + count);
		dao.updateCartDao(pid, count);
	}
	
	// 장바구니 선택 삭제
	@Override
	public void deleteCartDao(String pid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteCartDao(pid);
	}
	
	@Override
	public void deleteAllcartDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAllcartDao(userid);
	}

	// 선택 구매
	@Override
	public void insertPurchaseDao(String userid, String pid) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("service pid = " + pid);
//		System.out.println("service userid = " + userid);
//		System.out.println("service count = " + count);
		dao.insertPurchaseDao(userid, pid);
	}
	
	// 전체 구매
	@Override
	public void insertAllpurchaseDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("service userid = " + userid);
		
		dao.insertAllpurchaseDao(userid);
	}

	// 구매페이지 띄우기
	@Override
	public List<T_ordersDto> plistDao() throws Exception {
		// TODO Auto-generated method stub
		return dao.plistDao();
	}

	@Override
	public List<T_userinfoDto> ulistDao() throws Exception {
		// TODO Auto-generated method stub
		return dao.ulistDao();
	}

//	@Override
//	public void insertAllpurchaseDao(List<T_ordersDto> plistDao) {
//		// TODO Auto-generated method stub
//		dao.insertAllpurchaseDao(plistDao);
//	}

	

	

}
