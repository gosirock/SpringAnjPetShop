package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.O_noticeDto;

public class O_faqDaoImpl implements O_faqDao {

	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.O_faqDao";
	
	@Override
	public List<O_noticeDto> getFAQList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".getFAQList");
	}
	
	// ------------- 관리자용 CRUD -----------------------
	@Override
	public List<O_noticeDto> getDeletedFAQList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".getDeletedFAQList");
	}
	
	@Override
	public void writeFAQ(String adminid, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".writeFAQ");
	}

	@Override
	public void updateFAQ(int seq, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".updateFAQ");
	}

	@Override
	public void changeFAQStatus(int seq, int status) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".changeFAQStatus");
		
	}


} // end
