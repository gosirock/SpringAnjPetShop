package com.springlec.base.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.A_LoginDao;

@Service
public class A_LoginDaoServiceImpl implements A_LoginDaoService {

	@Autowired
	A_LoginDao dao;
	
	
	@Override
	public String loginChack(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginChack(id, pw);
	}




}
