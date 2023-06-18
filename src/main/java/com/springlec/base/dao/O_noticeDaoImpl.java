package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springlec.base.model.O_noticeDto;

public class O_noticeDaoImpl implements O_noticeDao {

	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.O_noticeDao";

	@Override
	public List<O_noticeDto> getNoticeList(String queryName, String queryContent, int startNum, int itemPerPage)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".O_getNoticeList");
	}

	@Override
	public int getNoticeCount(String queryName, String queryContent) throws Exception {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne(nameSpace + ".O_getNoticeCount");
	}

}
