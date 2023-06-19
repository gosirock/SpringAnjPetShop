package com.springlec.base.service;

import com.springlec.base.model.J_productDto;

public interface J_pDetailDaoService {
	public J_productDto viewPDetail(String pid) throws Exception;
	public void insertCart(String pid, String uid, int count) throws Exception;
	public void insertPurchase(String pid, String uid, int count) throws Exception;

}
