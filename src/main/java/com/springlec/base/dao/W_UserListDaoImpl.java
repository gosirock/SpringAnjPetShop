package com.springlec.base.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_UserList_Dto;

public class W_UserListDaoImpl implements W_UserListDao {

	
	SqlSession session;
	public static String nameSpace = "com.springlec.base.dao.W_Dao";
	@Override
	public List<W_UserList_Dto> W_UserList(int pagenum, int pageSize, String selectType, String selectText) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".W_UserList");
	}
	
	
	
}
