package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.O_qnaDto;

public interface O_qnaDao {

	public List<O_qnaDto> getQNAList(String queryName, String queryContent, int startNum, int itemPerPage) throws Exception;
	public int getQNACount(String queryName, String queryContent) throws Exception;
	public O_qnaDto getQNADetail(int nSeq) throws Exception;
	public void writeQuestion(String category, String qna_title, String qna_content, String userid, String adminid) throws Exception;
	// writeQuestion으로 insert된 data의 seq를 가져오는 메서드
	public int getQuestionSeq() throws Exception;
	// insert된 data의 parentseq를 seq와 동일하게 update해주는 메서드
	public void writeQuestionPlus(int nSeq) throws Exception;
	public void updateQnA(int seq, String qna_title, String qna_content) throws Exception; // 유저 & 관리자 공용 수정 메서드
	// 관리자용 메서드
	public void deleteQuestion(int seq) throws Exception;
	public void deleteAnswer(int seq) throws Exception;
	public void writeAnswer(int seq, String category, String qna_title, String qna_content, String userid, String adminid) throws Exception;
	
}
