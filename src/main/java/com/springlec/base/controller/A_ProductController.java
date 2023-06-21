package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.A_ProductDto;
import com.springlec.base.service.A_ProductDaoService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class A_ProductController {

	@Autowired
	A_ProductDaoService service;

	@RequestMapping("/Product")
	public String A_ProductView(HttpServletRequest request, Model model) throws Exception {
		String query = request.getParameter("query");
		String content = request.getParameter("content");
		String pcategory = request.getParameter("pcategory");
		String sortOrder = request.getParameter("sortOrder");
		
		
		if (query == null) {
			query = "pname";
			content = "";
		}

		List<A_ProductDto> listdao = service.A_ProductView(pcategory, query, content, sortOrder);
		model.addAttribute("A_ProductView", listdao);

		return "A_ProductView";
	}


}
