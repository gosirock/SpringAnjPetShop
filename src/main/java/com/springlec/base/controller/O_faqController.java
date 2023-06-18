package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.O_noticeDto;
import com.springlec.base.service.O_faqDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class O_faqController {
	
	@Autowired
	O_faqDaoService service;

	@RequestMapping("/O_faq")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		
		List<O_noticeDto> dtos = service.getFAQList();
		
		model.addAttribute("FAQList", dtos);
		return "O_fBoard";
	}
	
}
