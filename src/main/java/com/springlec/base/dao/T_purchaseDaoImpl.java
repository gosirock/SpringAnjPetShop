package com.springlec.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

@Service
public class T_purchaseDaoImpl implements T_purchaseDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.T_purchaseDao";

	@Override
	public List<T_userinfoDto> ulistDao() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".ulistDao");
	}

}
