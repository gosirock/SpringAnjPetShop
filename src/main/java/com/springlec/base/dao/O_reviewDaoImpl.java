package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.O_commentsDto;
import com.springlec.base.model.O_reviewDto;

public class O_reviewDaoImpl implements O_reviewDao {

	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.O_reviewDao";
	
	@Override
	public List<O_reviewDto> getReviewList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".getReviewList");
	}

	@Override
	public int getReviewCount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".getReviewCount");
	}

	@Override
	public O_reviewDto getReviewDetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return (O_reviewDto) sqlSession.selectList(nameSpace + ".getReviewDetail");
	}

	@Override
	public List<O_commentsDto> getCommentsList(int t_rootseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".getCommentsList");
	}

	@Override
	public int getMaxRef() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".getMaxRef");
	}

	@Override
	public void writeParentComment(int rseq, String userid, int maxRef, String comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".writeComment");
		
	}

}
