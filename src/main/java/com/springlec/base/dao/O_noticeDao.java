package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_noticeDto;


public interface O_noticeDao {

	public List<O_noticeDto> getNoticeList(String queryName, String queryContent, int startNum, int itemPerPage) throws Exception;
	public int getNoticeCount(String queryName, String queryContent) throws Exception;
	public O_noticeDto getNoticeDetail(int nSeq) throws Exception;
}
