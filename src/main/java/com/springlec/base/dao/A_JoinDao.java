package com.springlec.base.dao;

public interface A_JoinDao {

	public String joinIdChack(String id) throws Exception;
	public void join(String id, String pw, String name, String tel, String email, 
			         int postcode, String address, String detailaddress) throws Exception;
}
