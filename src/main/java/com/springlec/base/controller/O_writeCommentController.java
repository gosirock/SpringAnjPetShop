package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.O_calcCommentDto;
import com.springlec.base.service.O_writeCommentDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class O_writeCommentController {

	@Autowired
	O_writeCommentDaoService service;
	
	
	@RequestMapping("writeComment")
	public String writeComment(HttpServletRequest request) throws Exception{
		
		O_calcCommentDto dto = null; // 조건문 처리를 위해 dto 미리 선언
		
		// 부모글의 정보 가져오기
		int seq = Integer.parseInt(request.getParameter("seq")); // 원 게시글의 seq == rootseq
		int parentCseq = Integer.parseInt(request.getParameter("c_seq"));
		int parentRef = Integer.parseInt(request.getParameter("ref"));
		int parentStep = Integer.parseInt(request.getParameter("step"));
		
		String writer = request.getParameter("writer"); // 자식글의 작성자
		String comments = request.getParameter("comments"); // 자식글의 내용
		
		// 부모 답글의 바로 밑 자식 수 + 1
		service.updateParentAnswerNum(parentCseq);
		
		// maxRefOrder 와 maxAnswerNum 저장
		if(service.getMaxRefOrderAndMaxAnswerNum1(parentCseq) == null) {
			dto = service.getMaxRefOrderAndMaxAnswerNum2(parentCseq);
		}else {
			dto = service.getMaxRefOrderAndMaxAnswerNum1(parentCseq);
		}
		
		// dto에서 값 가져와 변수에 저장
		int maxRefOrder = dto.getMaxRefOrder();
		int maxAnswerNum = dto.getMaxAnswerNum();
		
		// 자식글의 insert 값들 저장
		int rootseq = seq;
		int ref = parentRef;
		int step = parentStep + 1;
		int reforder = maxRefOrder + maxAnswerNum + 1;
		int answernum = 0;
		int parentseq = parentCseq;
		
		// 자식글이 들어갈 공간 확보
		service.updateRefOrder(parentRef, maxRefOrder, maxAnswerNum);
		// 자식글 insert
		service.writeComment(rootseq, ref, step, reforder, answernum, writer, parentseq, comments);
		
		
		// 해당 리뷰 게시글 redirect
		if(writer.equals("관리자")) {
			return "redirect:O_adminRDetail?seq=" + seq; // 관리자 페이지로 넘어감
		}else {
			return "redirect:O_rDetail?seq=" + seq; // 유저 페이지로 넘어감
		}
	}
	
	
}
