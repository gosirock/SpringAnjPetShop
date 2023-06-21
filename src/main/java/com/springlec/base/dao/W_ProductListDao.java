package com.springlec.base.dao;


import java.util.List;

import com.springlec.base.model.W_ProductList_Dto;

public interface W_ProductListDao {

	
	public List<W_ProductList_Dto> W_ProductList(int pagenum, int pageSize, String selectType, String selectText) throws Exception;
	public void W_ProductInsert(String pid, String pname, String pcategory, int pprice, int pstock, int available, String pthumbnail, String pth2, String pth3) throws Exception;
	public W_ProductList_Dto W_ProductUpdateView(String pid) throws Exception;
	public void W_ProductUpdate(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3) throws Exception;
}
