package com.springlec.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class A_LogoutController {

	
	@RequestMapping("/Logout")
		public String logout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate(); 
		return "redirect:Main";
	}
}
