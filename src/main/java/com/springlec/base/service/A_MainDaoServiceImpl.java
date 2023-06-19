package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.A_MainDao;
import com.springlec.base.model.A_MainDto;


@Service
public class A_MainDaoServiceImpl implements A_MainDaoService {

	@Autowired
	A_MainDao dao;

	
	@Override
	public List<A_MainDto> A_MainView3() throws Exception {
		// TODO Auto-generated method stub
		return dao.A_MainView3();
	}


	@Override
	public List<A_MainDto> A_MainView2() throws Exception {
		// TODO Auto-generated method stub
		return dao.A_MainView2();
	}

}
