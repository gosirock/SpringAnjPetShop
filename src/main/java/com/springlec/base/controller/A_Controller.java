package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.A_MainDto;
import com.springlec.base.service.A_MainDaoService;

@Controller
public class A_Controller {
	
	@Autowired
	A_MainDaoService service;
	
	
	@RequestMapping("/Main")
	public String A_MainView3(Model model) throws Exception{
		List<A_MainDto> listDao = service.A_MainView3();
		List<A_MainDto> listDao2 = service.A_MainView2();
		model.addAttribute("A_MainView2", listDao2);
		model.addAttribute("A_MainView3", listDao);
		return "A_MainView";
	}
	
	
	
}

