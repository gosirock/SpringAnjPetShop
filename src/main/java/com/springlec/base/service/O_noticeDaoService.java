package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.O_noticeDto;

public interface O_noticeDaoService {
	
	public List<O_noticeDto> getNoticeList(String queryName, String queryContent,
			int startNum, int itemPerPage) throws Exception;

	public int getNoticeCount(String queryName, String queryContent) throws Exception;

}
