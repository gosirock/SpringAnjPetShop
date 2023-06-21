package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.W_SalesToday_Dto;
import com.springlec.base.service.W_TodayDaoService;

@Controller
public class W_TodayController {
	
	@Autowired
	W_TodayDaoService service;
	
	@RequestMapping("/W_Home")
	public String TodayReport(Model model) throws Exception{
		
		W_SalesToday_Dto TodayTable = service.W_TodayTable();
		int yesterday = service.W_Yesterday();
		int avg = service.W_avg();
		
		model.addAttribute("dto", TodayTable);
		model.addAttribute("yesterday", yesterday);
		model.addAttribute("avg", avg);

return "W_Home";
	}
	
	
	
	
}
