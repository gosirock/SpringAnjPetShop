package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.T_cartDao;
import com.springlec.base.model.T_ordersDto;
@Service
public class T_cartDaoServiceImpl implements T_cartDaoService {

	@Autowired
	T_cartDao dao;
	
	@Override
	public List<T_ordersDto> plistDao() throws Exception {
		// TODO Auto-generated method stub
		return dao.plistDao();
	}

}
