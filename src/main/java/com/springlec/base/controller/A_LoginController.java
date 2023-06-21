package com.springlec.base.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springlec.base.service.A_LoginDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class A_LoginController {

	@Autowired
	A_LoginDaoService service;

	// 로그인페이지로 이동
	@RequestMapping("/A_loginView")
	public String loginview() throws Exception {
		return "A_loginView";
	}

	// 로그인 기능 ( 유저 및 관리자 판단 후 해당 페이지로 이동 )
	@RequestMapping("/loginCheck")
	@ResponseBody
	public void loginCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String result = service.loginChack(id, pw);

		System.out.println(" 됨? ");

		// ajax를 사용할 경우 사용해야
		response.getWriter().write(result);

	}
}
