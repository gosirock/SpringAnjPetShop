package com.springlec.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springlec.base.dao.O_writeCommentDao;
import com.springlec.base.model.O_calcCommentDto;

@Service
@Transactional(rollbackFor = Exception.class)
public class O_writeCommentDaoServiceImpl implements O_writeCommentDaoService {

	@Autowired
	O_writeCommentDao dao;

	
	@Override
	public void updateParentAnswerNum(int c_seq) throws Exception {
		// TODO Auto-generated method stub
		dao.updateParentAnswerNum(c_seq);
	}

	@Override
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum1(int parentCseq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMaxRefOrderAndMaxAnswerNum1(parentCseq);
	}

	@Override
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum2(int parentCseq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMaxRefOrderAndMaxAnswerNum2(parentCseq);
	}
	
	@Override
	public void updateRefOrder(int ref,  int MaxRefOrder, int MaxAnswerNum) throws Exception {
		// TODO Auto-generated method stub
		dao.updateRefOrder(ref, MaxRefOrder, MaxAnswerNum);
	}

	@Override
	public void writeComment(int rootseq, int ref, int step, int reforder, int answernum, String writer, int parentseq,
			String comments) throws Exception {
		// TODO Auto-generated method stub
		dao.writeComment(rootseq, ref, step, reforder, answernum, writer, parentseq, comments);
	}

}
