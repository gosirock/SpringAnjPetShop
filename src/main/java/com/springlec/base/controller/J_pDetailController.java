package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springlec.base.model.J_productDto;
import com.springlec.base.model.J_purchaseDto;
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
	
	// 장바구니로 제품아이디, 수량 정보 넘겨주기 
	@RequestMapping("/insertCart")
	public String insertCart(HttpServletRequest request, Model model) throws Exception {
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("count"));
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("USERID");
//		String userid = "bono";
		service.insertCart(pid, userid, count);
		return "redirect:T_cart";
	}
	
	// 즉시 구매 페이지로  제품아이디, 수량 정보 넘겨주기 
	@RequestMapping("/insertPurchase")
	public String insertPurchase(HttpServletRequest request, Model model) throws Exception {
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("count"));
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("USERID");
//		String userid = "bono";
		
		System.out.println(pid);
		System.out.println(userid);
		System.out.println(count);
		
		service.insertPurchase(pid, userid, count);
		List<J_purchaseDto> selectPurchase = service.selectPurchase(pid, userid);
		model.addAttribute("plist", selectPurchase);
		return "T_purchase";
	}
	

}
