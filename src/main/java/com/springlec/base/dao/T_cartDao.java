package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.T_ordersDto;

public interface T_cartDao {
	// 카트 띄우기
	public List<T_ordersDto> plistDao() throws Exception;

}
