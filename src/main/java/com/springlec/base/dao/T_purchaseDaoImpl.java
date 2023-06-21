package com.springlec.base.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;

@Service
public class T_purchaseDaoImpl implements T_purchaseDao {
	
	SqlSession sqlSession;
	public static String nameSpace = "com.springlec.base.dao.T_purchaseDao";
	
	// 배송지입력창
	@Override
	public List<T_userinfoDto> ulistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".ulistDao");
	}

	// 주문해서 orders테이블로 넘기기
	@Override
	public void orders(int count, String pname, int orderprice, String username, String userpostcode,
			String shipaddress, String usertel, String ordermessage, String userid, String pid, String payment, int usedmileage) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".orders");
	}
	
	// 구매하면 구매된 cart 비우기
	@Override
	public void deleteCart(String userid, String pid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + ".deleteCart");
	}
	
	// 구매하면 purchase테이블 비우기
	@Override
	public void deletepurchase(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + ".deletepurchse");
	}
	
	// 구매결과화면
	@Override
	public List<T_ordersDto> olistDao(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".olistDao");	
	}
	
	// 마일리지 업데이트
	@Override
	public void updateMileage(String userid, int usedmileage, int enteredmileage) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".updateMileage");
	}

	

	
	
	
}
//	@Override
//	public void orders(String pidList, int countList, String pnameList, int orderpriceList, String username, String userpostcode, String shipaddress,
//			String usertel, String ordermessage, String payment,
//			int usedmileage, int enteredmileage) throws Exception {
//			 String userid = "do";
//	
//			sqlSession.insert(nameSpace + ".orders");
//	}
//		 try {
//		 
//		        // 트랜잭션 시작
//		        sqlSession.getConnection().setAutoCommit(false);
//
//		        // 주문번호 생성 쿼리 실행
//		        //String ordernum = sqlSession.selectOne("generateOrderNum");
//
//		        // 주문 정보 등록 쿼리 실행
//		        Map<String, Object> parameterMap = new HashMap<>();
//		      //  parameterMap.put("ordernum", ordernum);
//		        parameterMap.put("pid", pid);
//		        parameterMap.put("count", count);
//		        parameterMap.put("pname", pname);
//		        //parameterMap.put("orderprice", orderpriceList);
//		        parameterMap.put("username", username);
//		        parameterMap.put("userpostcode", userpostcode);
//		        parameterMap.put("shipaddress", useraddress + " " + userdetailaddress);
//		        parameterMap.put("usertel", phone1 + "-" + phone2 + "-" + phone3);
//		        parameterMap.put("ordermessage", ordermessage);
//		        parameterMap.put("payment", payment);
//		        parameterMap.put("usedmileage", usedmileage);
//		        parameterMap.put("enteredmileage", enteredmileage);
//		        sqlSession.insert("orders", parameterMap);
//
//		        // 제품 가격 조회 및 처리
////		        for (int i = 0; i < pidList.size(); i++) {
////		            String pid = pidList.get(i);
////		            Integer orderPrice = sqlSession.selectOne("getProductPrice", pid);
////		            // 가격 처리 로직 추가
////		        }
//
//		        // 카트 삭제 쿼리 실행
//		        sqlSession.delete("deleteCart", userid);
//
//		        // 마일리지 차감 쿼리 실행
//		        sqlSession.update("deductMileage", userid);
//
//		        // 마일리지 적립 쿼리 실행
//		        sqlSession.update("enterMileage", userid);
//
//		        // 트랜잭션 커밋
//		        sqlSession.getConnection().commit();
//
//		    } catch (Exception e) {
//		        // 트랜잭션 롤백
//		        sqlSession.getConnection().rollback();
//		        throw e; // 예외 처리 또는 로깅
//		    } finally {
//		        // 트랜잭션 종료 및 리소스 반환
//		        sqlSession.getConnection().setAutoCommit(true);
//		    }
//		}





//	@Override
//	public void orders(List<Integer> countList, List<String> pnameList, List<Integer> orderpriceList, String username,
//			String userpostcode, String shipaddress, String usertel, String ordermessage, List<String> pidList,
//			String payment, int usedmileage) {
//		// TODO Auto-generated method stub
//		String userid = "do";
//		
//		sqlSession.insert(nameSpace + ".orders");
//	}