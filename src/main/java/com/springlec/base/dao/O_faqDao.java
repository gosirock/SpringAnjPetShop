package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_noticeDto;

public interface O_faqDao {

	public List<O_noticeDto> getFAQList() throws Exception;
}
