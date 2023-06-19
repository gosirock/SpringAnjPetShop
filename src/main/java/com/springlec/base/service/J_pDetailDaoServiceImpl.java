package com.springlec.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.J_pDetailDao;
import com.springlec.base.model.J_productDto;

@Service
public class J_pDetailDaoServiceImpl implements J_pDetailDaoService {
	
	@Autowired
	J_pDetailDao pDetailDao;

	@Override
	public J_productDto viewPDetail(String pid) throws Exception {
		// TODO Auto-generated method stub
		return pDetailDao.viewPDetail(pid);
	}

	@Override
	public void insertCart(String pid, String uid, int count) throws Exception {
		// TODO Auto-generated method stub
		pDetailDao.insertCart(pid, uid, count);
	}

	@Override
	public void insertPurchase(String pid, String uid, int count) throws Exception {
		// TODO Auto-generated method stub
		pDetailDao.insertPurchase(pid, uid, count);
		
	}

}
