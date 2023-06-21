package com.springlec.base.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.google.gson.Gson;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_UserList_Dto;
import com.springlec.base.service.W_UserListDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class W_UserListController {
	
	@Autowired
	W_UserListDaoService service;
	
	
	@RequestMapping("/W_UserList")
	public String User() throws Exception{
		return "W_UserList";
	}
	
	@RequestMapping("/W_UserListPaging")
	public void UserList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    
		List<W_UserList_Dto> dtos = service.W_UserList(Integer.parseInt(request.getParameter("pagenum")), Integer.parseInt(request.getParameter("pagesize")), request.getParameter("selectType"),
				request.getParameter("selectText"));
		
		
		 Gson gson = new Gson();
		 String json = gson.toJson(dtos);

		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");	
	    
	    try {
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
	
	
}
