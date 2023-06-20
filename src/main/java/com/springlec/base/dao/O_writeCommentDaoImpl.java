package com.springlec.base.dao;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.O_calcCommentDto;

public class O_writeCommentDaoImpl implements O_writeCommentDao {

	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.O_writeCommentDao";
	
	
	@Override
	public void updateParentAnswerNum(int c_seq) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".addParentAnswerNum");
		
	}
	
	@Override
	public void updateRefOrder(int ref,  int MaxRefOrder, int MaxAnswerNum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".getEmptySpace");
		
	}
	@Override
	public void writeComment(int rootseq, int ref, int step, int reforder, int answernum, String writer, int parentseq,
			String comments) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".writeComment");
		
	}

	@Override
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum1(int parentCseq) throws Exception {
		// TODO Auto-generated method stub
		return (O_calcCommentDto) sqlSession.selectList(nameSpace + ".findMaxValues");
	}

	@Override
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum2(int parentCseq) throws Exception {
		// TODO Auto-generated method stub
		return (O_calcCommentDto) sqlSession.selectList(nameSpace + ".isNull");
	}
	
}
