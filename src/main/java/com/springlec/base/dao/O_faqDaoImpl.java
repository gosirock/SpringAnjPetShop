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

}
