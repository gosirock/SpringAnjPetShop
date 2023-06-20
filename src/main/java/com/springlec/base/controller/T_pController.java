package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
import com.springlec.base.service.T_purchaseDaoService;

@Controller
public class T_pController {

	@Autowired
	T_purchaseDaoService service;
	
	public String ulist(Model model) throws Exception {
	    List<T_userinfoDto> ulistDao = service.ulistDao();
	    
	    if (!ulistDao.isEmpty()) {
	        T_userinfoDto userinfo = ulistDao.get(0); // 첫 번째 객체 가져오기
	        
	        // 서버에서 가져온 데이터를 serverData 객체에 할당
	        model.addAttribute("username", userinfo.getUsername());
	        model.addAttribute("userpostcode", userinfo.getUserpostcode());
	        model.addAttribute("useraddress", userinfo.getUseraddress());
	        model.addAttribute("userdetailaddress", userinfo.getUserdetailaddress());
	        model.addAttribute("usertel", userinfo.getUsertel());
	        model.addAttribute("useremail", userinfo.getUseremail());
	        model.addAttribute("mileage", userinfo.getMileage());
	        model.addAttribute("usedmileage", userinfo.getUsedmileage());
	        
	        System.out.println("usernme" + "유져네임");
	    }
	    
	    return "T_purchase";
	}
}
