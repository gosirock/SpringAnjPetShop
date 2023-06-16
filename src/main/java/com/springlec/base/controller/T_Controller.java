package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.service.T_cartDaoService;

@Controller
public class T_Controller {
	
	@Autowired
	T_cartDaoService service;
	
	// 카트 띄우기
	@RequestMapping("/T_cart")
	public String plist(Model model) throws Exception{
		List<T_ordersDto> plistDao = service.plistDao();
		model.addAttribute("plist", plistDao);
		return "T_cart";
	}

}
