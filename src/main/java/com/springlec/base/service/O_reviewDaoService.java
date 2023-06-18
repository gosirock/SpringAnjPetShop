package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.O_commentsDto;
import com.springlec.base.model.O_reviewDto;

public interface O_reviewDaoService {

	public List<O_reviewDto> getReviewList(String queryName, String queryContent, int startNum, int itemPerPage) throws Exception;
	public int getReviewCount(String queryName, String queryContent) throws Exception;
	public O_reviewDto getReviewDetail(int nSeq) throws Exception;
	public List<O_commentsDto> getCommentsList(int t_rootseq) throws Exception;
	public int getMaxRef() throws Exception;
	public void writeComment(int rseq, String userid, int maxRef, String comment) throws Exception;
}
