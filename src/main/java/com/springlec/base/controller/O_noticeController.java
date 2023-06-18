package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.O_noticeDto;
import com.springlec.base.service.O_noticeDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class O_noticeController {
	
	@Autowired
	O_noticeDaoService service;

	@RequestMapping("/O_notice")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		
		if(queryName == null){ // 화면이 처음 열릴 때
			queryName = "n_title";
			queryContent = "";
		}
		
		// ---------------------- Pagination Start ----------------------------------------
		int itemsPerPage = 4; // 한 페이지당 출력할 게시글 수
		// O_Notice.do에서 page값을 전달하지 않았을 때는 default로 1로 세팅해주기 위한 3항 연산자
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int totalCount = service.getNoticeCount(queryName, queryContent);// 검색된 게시물 수 검색
		 // 전체 페이지 계산. 전체 게시물 수 / itemPerPage의 나머지가 없을 때는 그대로, 있을 때는 올림.
		double totalPages = (Math.ceil(totalCount / (double)itemsPerPage));
		
		int pageSize = 5; // 한 번에 보여줄 페이지의 개수
		int startIndex = (currentPage - 1) * itemsPerPage;
		
		List<O_noticeDto> dtos = service.getNoticeList(queryName, queryContent, startIndex, itemsPerPage);
		model.addAttribute("noticeList", dtos);
		
		return "O_NBoard";
	}
}
