package com.springlec.base.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.google.gson.Gson;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.model.W_SalesDaily_Dto;
import com.springlec.base.model.W_UserList_Dto;
import com.springlec.base.service.W_SalesDailyDaoService;
import com.springlec.base.service.W_UserListDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class W_SalesDaliyController {
	
	@Autowired
	W_SalesDailyDaoService service;
	
	
	@RequestMapping("/W_SalesDaily")
	public String W_SalesDaily() throws Exception{
		return "W_SalesDaily";
	}
	
	@RequestMapping("/W_SalesDailyAction")
	public void W_SalesDailyAction(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    
		List<W_SalesDaily_Dto> dtos = service.W_SalesDaily(request.getParameter("day"));
		
		
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
