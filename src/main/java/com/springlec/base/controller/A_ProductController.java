package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.A_ProductDto;
import com.springlec.base.service.A_ProductDaoService;

@Controller
public class A_ProductController {

	@Autowired
	A_ProductDaoService service;
	
	@RequestMapping("/Product")
	public String A_ProductView(Model model) throws Exception{
		List<A_ProductDto> listdao = service.A_ProductView();
		model.addAttribute("A_ProductView", listdao);
		return "A_ProductView";
	
}
	}
