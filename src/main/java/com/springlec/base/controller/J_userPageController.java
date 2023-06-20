package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.J_ordersDto;
import com.springlec.base.model.J_userDto;
import com.springlec.base.service.J_uPageDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class J_userPageController {
	
	@Autowired
	J_uPageDaoService service;
	
	// 유저 메인 페이지 보여주기 - 유저 테이블에서 해당 유저의 모든 데이터 불러오기 + 주문 테이블에서 해당 유저의 적립금 관련 데이터
	@RequestMapping("/j_userPage")
	public String userInfo (HttpServletRequest request, Model model) throws Exception {
		J_userDto userInfo = service.userInfo(request.getParameter("userid"));
		J_ordersDto orderMileage = service.orderMileage(request.getParameter("userid"));
		model.addAttribute("userView", userInfo); 				// 해당 유저의 모든 정보 들어있음 
		model.addAttribute("orderMileage", orderMileage);		// 해당 유저의 마일리지 관련 데이터 들어있음. 
		return "J_userMainPage";
	}
	
	// 회원 정보 보여주기 (프로필 페이지)
	@RequestMapping("/j_uProfilePage")
	public String userProfile(HttpServletRequest request, Model model) throws Exception {
		J_userDto userInfo = service.userInfo(request.getParameter("userid"));
		model.addAttribute("userView", userInfo);
		return "J_userProfilePage";
	}

	// 회원 정보 수정 페이지로 보내주기
	@RequestMapping("/sendToModifyPage")
	public String sendToModifyPage() throws Exception {
		return "redirect:j_uModifyPage";
	}
	
	// 회원 정보 수정페이지에 정보 띄워주기 
	@RequestMapping("/j_uModifyPage")
	public String userInfoView(HttpServletRequest request, Model model) throws Exception {
		J_userDto userInfo = service.userInfo(request.getParameter("userid"));
		model.addAttribute("userView", userInfo);
		return "J_userModifyPage";
	}
	
	@RequestMapping("/updateInfo")
	public String updateInfo (HttpServletRequest request, Model model) throws Exception {
		String userpasswd = request.getParameter("userpasswd");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String usertel = phone1 + "-" + phone2 + "-" + phone3;
		
		String inputmail = request.getParameter("useremail");
		String userdomain = request.getParameter("userdomain");
		String useremail = inputmail + "@" + userdomain;
		
		int userpostcode = Integer.parseInt(request.getParameter("userpostcode"));
		String useraddress = request.getParameter("useraddress");
		String userdetailaddress = request.getParameter("userdetailaddress");
		//System.out.println("userid : " + userid);
		System.out.println("userpasswd : " + userpasswd);
		System.out.println("usertel : " + usertel);
		System.out.println("useremail : " + useremail);
		System.out.println("userpostcode : " + userpostcode);
		System.out.println("useraddress : " + useraddress);
		System.out.println("userdetailaddress : " + userdetailaddress);
		
		service.updateInfo(userpasswd, usertel, useremail, userpostcode, useraddress, userdetailaddress);
		
		return "redirect:j_uProfilePage";
		
		//model.addAttribute("userView", updateInfo);
	}
	
	@RequestMapping("/deleteInfo")
	public String deleteInfo (HttpServletRequest request, Model model) throws Exception {
		service.deleteInfo(request.getParameter("userid"));
			
		return "A_MainView";
		//model.addAttribute("userView", deleteInfo);
	}
	
	@RequestMapping("/A_MainView")
	public String sendToHome() throws Exception {
		return "A_MainView";
	}
	
	
	
	
	
}
