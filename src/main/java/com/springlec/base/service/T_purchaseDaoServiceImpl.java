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
	public List<T_userinfoDto> ulistDao() throws Exception {
		// TODO Auto-generated method stub
		return dao.ulistDao();
	}

}
