package com.springlec.base.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.O_paginationDto;
import com.springlec.base.model.O_qnaDto;
import com.springlec.base.service.O_pagination;
import com.springlec.base.service.O_qnaDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class O_qnaController {

	@Autowired
	O_qnaDaoService service;
	@Autowired
	O_pagination pagination;
	
	@RequestMapping("/O_qna")
	public String getQNAList(HttpServletRequest request, Model model) throws Exception {
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		
		if(queryName == null){ // 화면이 처음 열릴 때
			queryName = "userid";
			queryContent = "";
		}
		
		// ---------------------- Pagination Start ----------------------------------------
		int itemsPerPage = 10; // 한 페이지당 출력할 게시글 수
		// O_Notice.do에서 page값을 전달하지 않았을 때는 default로 1로 세팅해주기 위한 3항 연산자
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int totalCount = service.getQNACount(queryName, queryContent);// 검색된 게시물 수 검색
		 // 전체 페이지 계산. 전체 게시물 수 / itemPerPage의 나머지가 없을 때는 그대로, 있을 때는 올림.
		double totalPages = (Math.ceil(totalCount / (double)itemsPerPage));
		
		int pageSize = 5; // 한 번에 보여줄 페이지의 개수
		int startIndex = (currentPage - 1) * itemsPerPage;
		
		List<O_qnaDto> dtos = service.getQNAList(queryName, queryContent, startIndex, itemsPerPage);
		
		O_paginationDto dto = pagination.pagination(itemsPerPage, totalCount, currentPage, (int)totalPages, pageSize);
		model.addAttribute("QNAList", dtos);
		model.addAttribute("p", dto);
		return "O_qBoard";
	}
	
	@RequestMapping("/O_qnaDetail")
	public String getQNADetail(HttpServletRequest request, Model model) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int seq = Integer.parseInt(request.getParameter("seq"));
		O_qnaDto dto = service.getQNADetail(seq);
		String writeDate = dto.getWritedate();
		Timestamp t_writeDate = Timestamp.valueOf(writeDate);
		
		writeDate =  format.format(t_writeDate);
		dto.setWritedate(writeDate);
		
		model.addAttribute("qDetail",dto);
		model.addAttribute("seq", seq);
		return("O_qDetail");
	}
	
	@RequestMapping("/O_writeQuestionView")
	public String writeQuestionView() throws Exception{
		return "O_writeQuestionView";
	}
	
	@RequestMapping("/O_writeQuestion")
	public String writeQuestion(HttpServletRequest request) throws Exception{
		
		String category = request.getParameter("qCategory");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		String userid = request.getParameter("userid");
		String adminid = "dummy";
		
		service.writeQuestion(category, qna_title, qna_content, userid, adminid);
		int seq = service.getQuestionSeq();
		service.writeQuestionPlus(seq);
		
		return "redirect:O_qna";
	}
}
