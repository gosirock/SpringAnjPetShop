package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_commentsDto;
import com.springlec.base.model.O_reviewDto;

public interface O_reviewDao {

	public List<O_reviewDto> getReviewList(String queryName, String queryContent, int startNum, int itemPerPage) throws Exception;
	public int getReviewCount(String queryName, String queryContent) throws Exception;
	public O_reviewDto getReviewDetail(int nSeq) throws Exception;
	public List<O_commentsDto> getCommentsList(int t_rootseq) throws Exception;
	
	// 댓글 작성 메서드
	public int getMaxRef() throws Exception;
	public void writeParentComment(int rseq, String userid, int maxRef, String comment) throws Exception;
	
}
