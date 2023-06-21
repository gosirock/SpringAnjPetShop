package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springlec.base.dao.O_reviewDao;
import com.springlec.base.model.O_commentsDto;
import com.springlec.base.model.O_reviewDto;

@Service
@Transactional(rollbackFor = Exception.class)
public class O_reviewDaoServiceImpl implements O_reviewDaoService {

	@Autowired
	O_reviewDao dao;
	
	@Override
	public List<O_reviewDto> getReviewList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getReviewList(queryName, queryContent, startNum, itemPerPage);
	}

	@Override
	public int getReviewCount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getReviewCount(queryName, queryContent);
	}

	@Override
	public O_reviewDto getReviewDetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReviewDetail(nSeq);
	}

	@Override
	public List<O_commentsDto> getCommentsList(int t_rootseq) throws Exception{
		// TODO Auto-generated method stub
		return dao.getCommentsList(t_rootseq);
	}

	@Override
	public int getMaxRef() throws Exception {
		// TODO Auto-generated method stub
		return dao.getMaxRef();
	}

	@Override
	public void writeParentComment(int rseq, String userid, int maxRef, String comment) throws Exception {
		// TODO Auto-generated method stub
		dao.writeParentComment(rseq, userid, maxRef, comment);
	}

}
