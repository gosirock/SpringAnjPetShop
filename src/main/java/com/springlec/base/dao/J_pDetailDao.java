package com.springlec.base.dao;

import com.springlec.base.model.J_productDto;

public interface J_pDetailDao {
	public J_productDto viewPDetail(String pid) throws Exception;
	public void insertCart(String pid, String userid, int count) throws Exception;
	public void insertPurchase(String pid, String userid, int count) throws Exception;

}
