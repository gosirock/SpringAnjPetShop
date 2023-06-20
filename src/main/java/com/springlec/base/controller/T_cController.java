package com.springlec.base.controller;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
import com.springlec.base.service.T_cartDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class T_cController {
	
	@Autowired
	T_cartDaoService service;
	
	// 카트 띄우기
	@RequestMapping("/T_cart")
	public String clist(Model model) throws Exception{
		List<T_ordersDto> clistDao = service.clistDao();
		model.addAttribute("clist", clistDao);
		return "T_cart";
	}
	
	// 카트 업데이트
	@RequestMapping("/updateCart")
	public String updateCart(HttpServletRequest request, Model model) throws Exception{
		service.updateCartDao(request.getParameter("pid"), Integer.parseInt(request.getParameter("count")));
		return "redirect:T_cart";
	}
	
	// 카트 선택삭제
	@RequestMapping("/deleteCart")
	public String deleteCart(@RequestParam("pid") String[] pidArray, HttpServletRequest request, Model model) throws Exception {
	    for (String pid : pidArray) {
	        service.deleteCartDao(pid);
	        System.out.println("controller pid = " + pid);
	    }
	    return "redirect:T_cart";
	}
	
	// 카트 전체삭제
	@RequestMapping("/deleteAllcart")
	public String deleteAllcart(/* @RequestParam("userid") String userid, */HttpServletRequest request, Model model) throws Exception{
		String userid = "do";
		service.deleteAllcartDao(userid);
		return "redirect:T_cart";
	}
	
	// 선택 구매	
	@RequestMapping("/purchase")
	public String purchase(@RequestParam("pid") String[] pidArray, 
	        /* @RequestParam("userid") String userid, */HttpServletRequest request, Model model) throws Exception {
	    String userid = "do";
	    
	    for (String pid : pidArray) {	        
	        service.insertPurchaseDao(userid, pid);
	    }
	    
	  //public String plist(Model model) throws Exception{
	  		List<T_ordersDto> plistDao = service.plistDao();
	  		model.addAttribute("plist", plistDao);
	  		
	  		List<T_userinfoDto> ulistDao = service.ulistDao();
		    
		    if (!ulistDao.isEmpty()) {
		        T_userinfoDto userinfo = ulistDao.get(0); // 첫 번째 객체 가져오기
		        
		        //model.addAllAttributes(ulistDao)
		        // 서버에서 가져온 데이터를 serverData 객체에 할당
		        model.addAttribute("username", userinfo.getUsername());
		        model.addAttribute("userpostcode", userinfo.getUserpostcode());
		        model.addAttribute("useraddress", userinfo.getUseraddress());
		        model.addAttribute("userdetailaddress", userinfo.getUserdetailaddress());
		        model.addAttribute("usertel", userinfo.getUsertel());
		        model.addAttribute("useremail", userinfo.getUseremail());
		        model.addAttribute("mileage", userinfo.getMileage());
		        model.addAttribute("usedmileage", userinfo.getUsedmileage());

		    }
	  		
	  		return "T_purchase";
	  	}
	    
	// 전체 구매  
	@RequestMapping("/allPurchase")
	public String allPurchase(@RequestParam("userid") String userid, HttpServletRequest request, Model model) throws Exception {
	    userid = "do";

	        service.insertAllpurchaseDao(userid);
	    
	    List<T_ordersDto> plistDao = service.plistDao();
	    model.addAttribute("plist", plistDao);
	    
	    List<T_userinfoDto> ulistDao = service.ulistDao();
	    
	    if (!ulistDao.isEmpty()) {
	        T_userinfoDto userinfo = ulistDao.get(0); // 첫 번째 객체 가져오기
	        
	        //model.addAllAttributes(ulistDao)
	        // 서버에서 가져온 데이터를 serverData 객체에 할당
	        model.addAttribute("username", userinfo.getUsername());
	        model.addAttribute("userpostcode", userinfo.getUserpostcode());
	        model.addAttribute("useraddress", userinfo.getUseraddress());
	        model.addAttribute("userdetailaddress", userinfo.getUserdetailaddress());
	        model.addAttribute("usertel", userinfo.getUsertel());
	        model.addAttribute("useremail", userinfo.getUseremail());
	        model.addAttribute("mileage", userinfo.getMileage());
	        model.addAttribute("usedmileage", userinfo.getUsedmileage());

	    }

	    return "T_purchase";
	}
		
	    
	

	
	
}
