package com.springlec.base.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.O_commentsDto;
import com.springlec.base.model.O_paginationDto;
import com.springlec.base.model.O_reviewDto;
import com.springlec.base.service.O_pagination;
import com.springlec.base.service.O_reviewDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class O_adminReviewController {

	@Autowired
	O_reviewDaoService service;
	@Autowired
	O_pagination pagination;
	
	@RequestMapping("/O_adminReview")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		if(queryName == null){ // 화면이 처음 열릴 때
			queryName = "r_title";
			queryContent = "";
		}
		
		// ---------------------- Pagination Start ----------------------------------------
		int itemsPerPage = 4; // 한 페이지당 출력할 게시글 수
		// O_Notice.do에서 page값을 전달하지 않았을 때는 default로 1로 세팅해주기 위한 3항 연산자
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int totalCount = service.getReviewCount(queryName, queryContent);// 검색된 게시물 수 검색
		 // 전체 페이지 계산. 전체 게시물 수 / itemPerPage의 나머지가 없을 때는 그대로, 있을 때는 올림.
		double totalPages = (Math.ceil(totalCount / (double)itemsPerPage));
		
		int pageSize = 5; // 한 번에 보여줄 페이지의 개수
		int startIndex = (currentPage - 1) * itemsPerPage;
		
		
		
		List<O_reviewDto> dtos = service.getReviewList(queryName, queryContent, startIndex, itemsPerPage);
		
		// arrayList의 모든 writeDate를 포맷터로 변경
		for (O_reviewDto dto : dtos) {
			String writeDate = dto.getWritedate();
			Timestamp t_writeDate = Timestamp.valueOf(writeDate);
			writeDate = format.format(t_writeDate);
			dto.setWritedate(writeDate);
			}
		
		O_paginationDto dto = pagination.pagination(itemsPerPage, totalCount, currentPage, (int)totalPages, pageSize);
		model.addAttribute("reviewList", dtos);
		model.addAttribute("p", dto);
		return "O_adminRBoard";
	}
	
	@RequestMapping("/O_adminRDetail")
	public String getNoticeDetail(HttpServletRequest request, Model model) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat c_format = new SimpleDateFormat("yy-MM-dd HH:mm");
		int seq = Integer.parseInt(request.getParameter("seq"));
		O_reviewDto dto = service.getReviewDetail(seq);
		String writeDate = dto.getWritedate();
		Timestamp t_writeDate = Timestamp.valueOf(writeDate);
		
		writeDate =  format.format(t_writeDate);
		dto.setWritedate(writeDate);
		
		List<O_commentsDto> comments = service.getCommentsList(seq);
		
		for (O_commentsDto c_dto : comments) {
			String c_writeDate = c_dto.getWritedate();
			Timestamp t_c_writeDate = Timestamp.valueOf(c_writeDate);
			c_writeDate = c_format.format(t_c_writeDate);
			c_dto.setWritedate(c_writeDate);
			if(c_dto.getIsdelete() == 1) {
				c_dto.setComments("삭제된 댓글입니다.");
			}
		}
		
		model.addAttribute("rDetail",dto);
		model.addAttribute("seq", seq);
		model.addAttribute("commentList" ,comments);
		return("O_adminRDetail");
	}
	
	@RequestMapping("/O_adminWriteParentComment")
	public String writeComment(HttpServletRequest request) throws Exception{
		int seq = Integer.parseInt(request.getParameter("seq"));
		String userid = request.getParameter("userid");
		String comment = request.getParameter("comment");
		int maxRef = service.getMaxRef();
		
		service.writeParentComment(seq, userid, maxRef, comment);
		
		return "redirect:O_adminRDetail?seq=" + seq;
	}
}
