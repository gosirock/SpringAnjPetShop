package com.springlec.base.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.W_ProductListDao;
import com.springlec.base.dao.W_TodayDao;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesToday_Dto;

@Service
public class W_ProductListDaoServiceImpl implements W_ProductListDaoService {

	@Autowired
	W_ProductListDao dao;

	@Override
	public List<W_ProductList_Dto> W_ProductList(int pagenum, int pageSize, String selectType, String selectText) throws Exception {
		// TODO Auto-generated method stub
		selectText = "%" + selectText + "%";
		pagenum = ((pagenum-1)*pageSize);
		if(selectType.equals("available") && selectText.equals("Y")){
			selectText = "1";
		}else if(selectType.equals("available") && selectText.equals("N")) {
			selectText = "0";
		}
			
		return dao.W_ProductList(pagenum, pageSize, selectType, selectText);
	}

	@Override
	public void W_ProductInsert(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3) throws Exception {
		// TODO Auto-generated method stub
		
		if(pthumbnail=="") {
			pthumbnail = "noimage.png";
		}
		if(pth2=="") {
			pth2 = "noimage.png";
		}
		if(pth3=="") {
			pth3 = "noimage.png";
		}
		 pthumbnail = pthumbnail.substring(0, pthumbnail.length()-4);
		 pth2 = pth2.substring(0, pth2.length()-4);
		 pth3 = pth3.substring(0, pth3.length()-4);
		
		 
		 dao.W_ProductInsert(pid, pname, pcategory, pprice, pstock, available, pthumbnail, pth2, pth3);
	}

	@Override
	public void W_ProductUpdate(String pid, String pname, String pcategory, int pprice, int pstock, int available,
			String pthumbnail, String pth2, String pth3) throws Exception {
		// TODO Auto-generated method stub
		pthumbnail = pthumbnail.substring(0, pthumbnail.length()-4);
		 pth2 = pth2.substring(0, pth2.length()-4);
		 pth3 = pth3.substring(0, pth3.length()-4);
		
		 
		 dao.W_ProductUpdate(pid, pname, pcategory, pprice, pstock, available, pthumbnail, pth2, pth3);
		
	}

	@Override
	public W_ProductList_Dto W_ProductUpdateView(String pid) throws Exception {
		// TODO Auto-generated method stub
		return dao.W_ProductUpdateView(pid);
	}
	
	
	

}
