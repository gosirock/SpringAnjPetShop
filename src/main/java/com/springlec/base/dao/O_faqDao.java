package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_noticeDto;

public interface O_faqDao {

	public List<O_noticeDto> getFAQList() throws Exception;
	
	// ------------- 관리자용 CRUD -----------------------
	public List<O_noticeDto> getDeletedFAQList() throws Exception;
	public void writeFAQ(String adminid, String n_title, String n_content) throws Exception;
	public void updateFAQ(int seq, String n_title, String n_content) throws Exception;
	public void changeFAQStatus(int seq, int status) throws Exception;
}
