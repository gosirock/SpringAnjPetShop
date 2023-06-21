package com.springlec.base.service;


import java.util.List;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_UserList_Dto;

public interface W_UserListDaoService {

	
	public List<W_UserList_Dto> W_UserList(int pagenum, int pageSize, String selectType, String selectText) throws Exception;
}
