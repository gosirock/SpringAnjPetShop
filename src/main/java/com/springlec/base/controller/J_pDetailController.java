package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springlec.base.model.J_productDto;
import com.springlec.base.service.J_pDetailDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
public class J_pDetailController {
	
	@Autowired
	J_pDetailDaoService service;
	
	// 사용자가 선택한 제품 상세 정보 띄워주기 
	@RequestMapping("/j_pClicked")
	public String viewPDetail (HttpServletRequest request, Model model) throws Exception {
		J_productDto viewPDetail = service.viewPDetail(request.getParameter("pid"));
		model.addAttribute("productDetail", viewPDetail);
		return "J_productDetail";
	}
	
	// 장바구니 또는 구매 테이블로 제품아이디, 수량 정보 넘겨주기 
	@RequestMapping("/insert")
	public String insertPurchase(HttpServletRequest request, Model model) throws Exception {
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("count"));
		String button = request.getParameter("button");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("USERID");
//		String userid = "bono";
		
		if (button.equals("btnCart")) {
			service.insertCart(pid, userid, count);
			return "T_cart";
		} else if (button.equals("btnPurchase")) {
			service.insertPurchase(pid, userid, count);
			return "T_purchase";
		}
		
		return null;
		
	}
	

	

}
