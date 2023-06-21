package com.springlec.base.service;

import com.springlec.base.model.J_ordersDto;
import com.springlec.base.model.J_userDto;

public interface J_uPageDaoService {
	public J_userDto userInfo(String userid) throws Exception;
	public J_ordersDto orderMileage(String uid) throws Exception;
	public void updateInfo(String userid, String userpasswd, String usertel, String useremail, int userpostcode, String useraddress, String userdetailaddress) throws Exception;
	public void deleteInfo(String userid) throws Exception;

	


}
