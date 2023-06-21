package com.springlec.base.service;

public interface A_JoinDaoService {

	public String joinIdChack(String id) throws Exception;
	public void join(String id, String pw, String name, String tel, String email, 
	         int postcode, String address, String detailaddress) throws Exception;
}
