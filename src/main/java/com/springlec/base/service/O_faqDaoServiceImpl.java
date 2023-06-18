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

}
