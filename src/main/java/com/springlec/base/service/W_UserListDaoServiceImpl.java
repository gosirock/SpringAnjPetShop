package com.springlec.base.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.W_ProductListDao;
import com.springlec.base.dao.W_TodayDao;
import com.springlec.base.dao.W_UserListDao;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesToday_Dto;
import com.springlec.base.model.W_UserList_Dto;

@Service
public class W_UserListDaoServiceImpl implements W_UserListDaoService {

	@Autowired
	W_UserListDao dao;

	@Override
	public List<W_UserList_Dto> W_UserList(int pagenum, int pageSize, String selectType, String selectText) throws Exception {
		// TODO Auto-generated method stub
		selectText = "%" + selectText + "%";
		pagenum = ((pagenum-1)*pageSize);
		if(selectType.equals("available") && selectText.equals("Y")){
			selectText = "1";
		}else if(selectType.equals("available") && selectText.equals("N")) {
			selectText = "0";
		}
			
		return dao.W_UserList(pagenum, pageSize, selectType, selectText);
	}

	
	

}
