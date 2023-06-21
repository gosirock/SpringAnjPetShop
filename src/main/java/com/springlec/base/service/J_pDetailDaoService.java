package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.J_productDto;
import com.springlec.base.model.J_purchaseDto;

public interface J_pDetailDaoService {
	public J_productDto viewPDetail(String pid) throws Exception;
	public void insertCart(String pid, String userid, int count) throws Exception;
	public void insertPurchase(String pid, String userid, int count) throws Exception;
	public List<J_purchaseDto> selectPurchase(String pid, String userid) throws Exception;


}
