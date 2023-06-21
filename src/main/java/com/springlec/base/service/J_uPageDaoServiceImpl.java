package com.springlec.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.J_userPageDao;
import com.springlec.base.model.J_ordersDto;
import com.springlec.base.model.J_userDto;

@Service
public class J_uPageDaoServiceImpl implements J_uPageDaoService {
	
	@Autowired
	J_userPageDao userDao;

	@Override
	public J_userDto userInfo(String userid) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userInfo(userid);
	}

	@Override
	public J_ordersDto orderMileage(String uid) throws Exception {
		// TODO Auto-generated method stub
		return userDao.orderMileage(uid);
	}
	
	// 회원 정보 수정 처리 
	@Override
	public void updateInfo(String userid, String userpasswd, String usertel, String useremail, int userpostcode,
			String useraddress, String userdetailaddress) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateInfo(userid, userpasswd, usertel, useremail, userpostcode, useraddress, userdetailaddress);
	}

	// 회원 탈퇴 처리 
	@Override
	public void deleteInfo(String userid) throws Exception {
		// TODO Auto-generated method stub
		userDao.deleteInfo(userid);
	}


}
