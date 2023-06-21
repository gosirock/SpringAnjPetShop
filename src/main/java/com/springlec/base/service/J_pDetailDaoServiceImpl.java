package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.J_pDetailDao;
import com.springlec.base.model.J_productDto;
import com.springlec.base.model.J_purchaseDto;

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
	public void insertCart(String pid, String userid, int count) throws Exception {
		// TODO Auto-generated method stub
		pDetailDao.insertCart(pid, userid, count);
	}

	@Override
	public void insertPurchase(String pid, String userid, int count) throws Exception {
		// TODO Auto-generated method stub
		pDetailDao.insertPurchase(pid, userid, count);
		
	}

	@Override
	public List<J_purchaseDto> selectPurchase(String pid, String userid) throws Exception {
		// TODO Auto-generated method stub
		return pDetailDao.selectPurchase(pid, userid);
	}

}
