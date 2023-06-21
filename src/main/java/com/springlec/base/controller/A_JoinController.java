package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springlec.base.service.A_JoinDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class A_JoinController {

	@Autowired
	A_JoinDaoService service;

	// 회원가입 페이지로 이동
	@RequestMapping("/A_JoinView")
	public String A_JoinView() throws Exception {
		return "A_JoinView";
	}

	@RequestMapping("/idCheck")
	@ResponseBody
	public void joinIdChack(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String checkID = service.joinIdChack(id);
		System.out.println("checkId" + checkID);

		response.getWriter().write(checkID);

	}
	@RequestMapping("/Join")

	public String join (HttpServletRequest request) throws Exception{
		service.join(request.getParameter("id"), request.getParameter("passwd"),request.getParameter("name"), request.getParameter("tel"),
				request.getParameter("email"),Integer.parseInt(request.getParameter("postcode")), request.getParameter("address"), 
				request.getParameter("detailaddress"));
		
		System.out.println("Test");
		return "redirect:A_loginView";
			
		
	}
	
	
	
}
		
		
		
//		id, pw, name, tel, email, postcode, address, detailaddress
		    



