package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.O_qnaDto;

public class O_qnaDaoImpl implements O_qnaDao {

	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.O_qnaDao";
	
	@Override
	public List<O_qnaDto> getQNAList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".getQNAList");
	}

	@Override
	public int getQNACount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".getQNACount");
	}

	@Override
	public O_qnaDto getQNADetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".getQNADetail");
	}

	@Override
	public void writeQuestion(String category, String qna_title, String qna_content, String userid, String adminid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".writeQuestion");
		
	}

	@Override
	public void writeQuestionPlus(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".writeQuestionPlus");
	}

	@Override
	public int getQuestionSeq() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".getQuestionSeq");
	}

}
