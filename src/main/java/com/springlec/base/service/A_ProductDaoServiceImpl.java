package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.A_ProductDao;
import com.springlec.base.model.A_ProductDto;

@Service
public class A_ProductDaoServiceImpl implements A_ProductDaoService {
	
	@Autowired
	A_ProductDao dao;

	@Override
	public List<A_ProductDto> A_ProductView() throws Exception {
		// TODO Auto-generated method stub
		return dao.A_ProductView();
	}

}
