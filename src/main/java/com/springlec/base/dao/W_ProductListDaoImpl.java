package com.springlec.base.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.W_ProductList_Dto;

public class W_ProductListDaoImpl implements W_ProductListDao {

	
	SqlSession session;
	public static String nameSpace = "com.springlec.base.dao.W_Dao";
	
	@Override
	public List<W_ProductList_Dto> W_ProductList(int pagenum, int pageSize, String selectType, String selectText) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".W_ProductList");
	}
	
	@Override
	public void W_ProductInsert(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3) throws Exception {
		// TODO Auto-generated method stub
		session.insert(nameSpace + ".W_ProductInsert");
	}

	@Override
	public void W_ProductUpdate(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3) throws Exception {
		// TODO Auto-generated method stub
		session.update(nameSpace + ".W_ProductUpdate");
	}

	@Override
	public W_ProductList_Dto W_ProductUpdateView(String pid) throws Exception {
		// TODO Auto-generated method stub
		return (W_ProductList_Dto) session.selectList(nameSpace + ".W_ProductUpdateView");
	}
	
	
	
}
