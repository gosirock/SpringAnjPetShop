package com.springlec.base.dao;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
@Primary
@Repository
public interface T_purchaseDao {
	
	public List<T_userinfoDto> ulistDao() throws Exception;

}
