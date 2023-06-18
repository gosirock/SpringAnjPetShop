package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.O_qnaDao;
import com.springlec.base.model.O_qnaDto;

@Service
public class O_qnaDaoServiceImpl implements O_qnaDaoService {

	@Autowired
	O_qnaDao dao;
	
	@Override
	public List<O_qnaDto> getQNAList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getQNAList(queryName, queryContent, startNum, itemPerPage);
	}

	@Override
	public int getQNACount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		queryContent = "%" + queryContent + "%";
		return dao.getQNACount(queryName, queryContent);
	}

	@Override
	public O_qnaDto getQNADetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getQNADetail(nSeq);
	}

	@Override
	public void writeQuestion(String category, String qna_title, String qna_content, String userid, String adminid) throws Exception {
		// TODO Auto-generated method stub
		dao.writeQuestion(category, qna_title, qna_content, userid, adminid);
		
	}

	@Override
	public void writeQuestionPlus(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		dao.writeQuestionPlus(nSeq);
	}

	@Override
	public int getQuestionSeq() throws Exception {
		// TODO Auto-generated method stub
		return dao.getQuestionSeq();
	}

}
