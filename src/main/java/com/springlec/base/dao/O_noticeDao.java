package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_noticeDto;


public interface O_noticeDao {

	// 공지사항
	public List<O_noticeDto> getNoticeList(String queryName, String queryContent, int startNum, int itemPerPage) throws Exception;
	public int getNoticeCount(String queryName, String queryContent) throws Exception;
	public O_noticeDto getNoticeDetail(int nSeq) throws Exception;
	
	// --------------------- 관리자용 수정, 삭제, 작성 기능 -------------------------
	public void writeNotice(String adminid, String n_title, String n_content) throws Exception;
	public void updateNotice(int seq, String n_title, String n_content) throws Exception;
	public void deleteNotice(int seq) throws Exception;
}
