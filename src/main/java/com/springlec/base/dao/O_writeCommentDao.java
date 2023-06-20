package com.springlec.base.dao;

import com.springlec.base.model.O_calcCommentDto;

public interface O_writeCommentDao {

	// 부모답글의 answernum 을 1 증가
	public void updateParentAnswerNum(int c_seq) throws Exception;
	
	// reforder 계산을 위한 MaxRef 와 MaxAnswerNum 계산
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum1(int parentCseq) throws Exception;
	public O_calcCommentDto getMaxRefOrderAndMaxAnswerNum2(int parentCseq) throws Exception;
	// 새 댓글이 들어갈 자리 마련 (새 글의 reforder 보다 같거나 큰 order들을 + 1 해줌)
	public void updateRefOrder(int parentRef, int MaxRefOrder, int MaxAnswerNum) throws Exception;
	// 답글 입력
	public void writeComment(int rootseq, int ref, int step, int reforder, int answernum, String writer, int parentseq, String comments) throws Exception;
	
	
}
