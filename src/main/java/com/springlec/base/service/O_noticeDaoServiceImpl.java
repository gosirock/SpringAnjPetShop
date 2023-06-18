package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.O_noticeDao;
import com.springlec.base.model.O_noticeDto;

@Service
public class O_noticeDaoServiceImpl implements O_noticeDaoService {

	@Autowired
	O_noticeDao dao;

	@Override
	public List<O_noticeDto> getNoticeList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getNoticeList(queryName, queryContent, startNum, itemPerPage);
	}

	@Override
	public int getNoticeCount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getNoticeCount(queryName, queryContent);
	}

	@Override
	public O_noticeDto getNoticeDetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getNoticeDetail(nSeq);
	}

}
