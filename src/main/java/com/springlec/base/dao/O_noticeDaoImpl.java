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

	@Override
	public O_noticeDto getNoticeDetail(int nSeq) throws Exception {
		// TODO Auto-generated method stub
		return (O_noticeDto)sqlSession.selectList(nameSpace + ".O_getNoticeDetail");
	}

	// --------------------- 관리자용 수정, 삭제, 작성 기능 -------------------------
	@Override
	public void writeNotice(String adminid, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".O_writeNotice");
		
	}

	@Override
	public void updateNotice(int seq, String n_title, String n_content) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".O_updateNotice");
		
	}

	@Override
	public void deleteNotice(int seq) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".O_deleteNotice");
	}

}
