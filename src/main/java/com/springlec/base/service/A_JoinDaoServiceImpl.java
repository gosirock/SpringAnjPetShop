package com.springlec.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.A_JoinDao;

@Service
public class A_JoinDaoServiceImpl implements A_JoinDaoService {

	
	@Autowired
	A_JoinDao dao;
	
	@Override
	public String joinIdChack(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.joinIdChack(id);
	}

	@Override
	public void join(String id, String pw, String name, String tel, String email, int postcode, String address,
			String detailaddress) throws Exception {
		// TODO Auto-generated method stub
		
		dao.join(id, pw, name, tel, email, postcode, address, detailaddress);
	}

}
