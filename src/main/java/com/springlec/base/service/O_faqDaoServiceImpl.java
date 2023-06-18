package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.O_faqDao;
import com.springlec.base.model.O_noticeDto;

@Service
public class O_faqDaoServiceImpl implements O_faqDaoService {

	@Autowired
	O_faqDao dao;
	
	@Override
	public List<O_noticeDto> getFAQList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getFAQList();
	}

	// ------------- 관리자용 CRUD -----------------------
	@Override
	public List<O_noticeDto> getDeletedFAQList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getDeletedFAQList();
	}
	
	@Override
	public void writeFAQ(String adminid, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		dao.writeFAQ(adminid, n_title, n_content);
	}

	@Override
	public void updateFAQ(int seq, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		dao.updateFAQ(seq, n_title, n_content);
	}

	@Override
	public void changeFAQStatus(int seq, int status) throws Exception {
		// TODO Auto-generated method stub
		dao.changeFAQStatus(seq, status);
	}


} // End
