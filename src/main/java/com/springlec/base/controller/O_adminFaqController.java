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
public class O_adminFaqController {

	@Autowired
	O_faqDaoService service;

	@RequestMapping("/O_adminFAQ")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		
		List<O_noticeDto> dtos = service.getFAQList();
		
		model.addAttribute("FAQList", dtos);
		
		return "O_adminFBoard";
	}
	
	@RequestMapping("/O_writeFAQView")
	public String writeFAQView() throws Exception{
		return "O_writeFAQView";
	}
	@RequestMapping("/O_writeFAQ")
	public String writeFAQ(HttpServletRequest request) throws Exception{
		String adminid = request.getParameter("adminid");
		String qCategory = request.getParameter("qCategory");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		
		service.writeFAQ(adminid, qCategory + " " + n_title, n_content);
		
		return "redirect:O_adminFAQ";
	}
	
	@RequestMapping("/O_updateFAQView")
	public String updateFAQView(Model model) throws Exception{
		List<O_noticeDto> dtos = service.getFAQList();
		
		model.addAttribute("FAQList", dtos);
		
		return "O_updateFAQView";
	}
	
	@RequestMapping("/O_updateFAQ")
	public String updateFAQ(HttpServletRequest request) throws Exception{
		int seq = Integer.parseInt(request.getParameter("seq"));
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		
		service.updateFAQ(seq, n_title, n_content);
		
		return "redirect:O_adminFAQ";
	}
	
	@RequestMapping("/O_deleteFAQView")
	public String changeFAQView(Model model) throws Exception{
		List<O_noticeDto> dtos1 = service.getFAQList();
		List<O_noticeDto> dtos2 = service.getDeletedFAQList();
		
		model.addAttribute("FAQList", dtos1);
		model.addAttribute("DeletedFAQList", dtos2);
		
		return "O_deleteFAQView";
	}
	
	@RequestMapping("/O_changeFAQStatus")
	public String changeFAQStatus(HttpServletRequest request) throws Exception{
		int seq = Integer.parseInt(request.getParameter("seq"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		service.changeFAQStatus(seq, status);
		
		return "redirect:O_adminFAQ";
	}
	
	
}
