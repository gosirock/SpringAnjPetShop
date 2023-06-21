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
import com.springlec.base.model.W_SalesMonthlyChart_Dto;
import com.springlec.base.model.W_SalesMonthly_Dto;
import com.springlec.base.model.W_UserList_Dto;
import com.springlec.base.service.W_SalesDailyDaoService;
import com.springlec.base.service.W_SalesMonthlyDaoService;
import com.springlec.base.service.W_UserListDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class W_SalesMonthlyController {
	
	@Autowired
	W_SalesMonthlyDaoService service;
	
	
	@RequestMapping("/W_SalesMonthly")
	public String W_SalesMonthly() throws Exception{
		return "W_SalesMonthly";
	}
	
	@RequestMapping("/W_SalesMonthlyAction")
	public void W_SalesMonthlyAction(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    
		List<W_SalesMonthly_Dto> dtos = service.W_SalesMonthly(request.getParameter("day"));
		
		
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
	
	@RequestMapping("/W_SalesMonthlyChart")
	public void W_SalesMonthlyChart(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<W_SalesMonthlyChart_Dto> dtos = service.W_SalesMonthlyChart(request.getParameter("day"));
		
		
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
