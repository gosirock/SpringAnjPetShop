package com.springlec.base.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.springlec.base.model.W_ProductList_Dto;
import com.springlec.base.service.W_ProductListDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class W_ProductListController {
	
	@Autowired
	W_ProductListDaoService service;
	
	// 제품관리_상품리스트 페이지
	@RequestMapping("/W_ProductList")
	public String Product() throws Exception{
		return "W_ProductList";
	}
	
	
	@RequestMapping("/W_ProductListPaging")
	public void Product(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    
		List<W_ProductList_Dto> dtos = service.W_ProductList(Integer.parseInt(request.getParameter("pagenum")), Integer.parseInt(request.getParameter("pagesize")), request.getParameter("selectType"),
				request.getParameter("selectText"));
		
		
		 Gson gson = new Gson();
		 String json = gson.toJson(dtos);

		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");	
	    
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	}
	
	
	// 제품관리_상품입 페이지
		@RequestMapping("/W_ProductInsert")
		public String ProductInsert() throws Exception{
			return "W_ProductInsert";
		}
		
	@RequestMapping("/W_ProductInsertAction")
	public String W_ProductInsertAction(MultipartHttpServletRequest multipartRequest) throws Exception{
		
		String directory = System.getProperty("user.dir") + "/src/main/resources/static/images/thumbnail";
		
		
		String pid = multipartRequest.getParameter("pid");
		String pname = multipartRequest.getParameter("pname");
		String pcategory = multipartRequest.getParameter("pcategory");
		int pprice = Integer.parseInt(multipartRequest.getParameter("pprice"));
		int pstock = Integer.parseInt(multipartRequest.getParameter("pstock"));
		int available =  Integer.parseInt(multipartRequest.getParameter("available"));
		MultipartFile pthumbnailFile = multipartRequest.getFile("pthumbnail");
		String pthumbnail = pthumbnailFile.getOriginalFilename();
		MultipartFile pth2File = multipartRequest.getFile("pth2");
		String pth2 =pth2File.getOriginalFilename();
		MultipartFile pth3File = multipartRequest.getFile("pth3");
		String pth3 = pth3File.getOriginalFilename();
		
		File file = new File(directory, pthumbnail);
		pthumbnailFile.transferTo(file);
		File file2 = new File(directory, pth2);
		pth2File.transferTo(file2);
		File file3 = new File(directory, pth3);
		pth3File.transferTo(file3);
		
		System.out.println(pthumbnail+ pth2+ pth3);
		service.W_ProductInsert(pid, pname, pcategory, pprice, pstock, available, pthumbnail, pth2, pth3);
		
		return "redirect:W_ProductList";
	}
	
	@RequestMapping("/W_ProductUpdate")
	public String ProductUpdate(HttpServletRequest request, Model model) throws Exception{
		W_ProductList_Dto dto = service.W_ProductUpdateView(request.getParameter("pid"));
		model.addAttribute("dto",dto);
		
		return "W_ProductUpdate";
	}
	
	
	@RequestMapping("/W_ProductUpdataAction")
	public String W_ProductUpdataAction(MultipartHttpServletRequest multipartRequest) throws Exception{
		
		String directory = System.getProperty("user.dir") + "/src/main/resources/static/images/thumbnail";
		
		
		String pid = multipartRequest.getParameter("pid");
		String pname = multipartRequest.getParameter("pname");
		String pcategory = multipartRequest.getParameter("pcategory");
		int pprice = Integer.parseInt(multipartRequest.getParameter("pprice"));
		int pstock = Integer.parseInt(multipartRequest.getParameter("pstock"));
		int available =  Integer.parseInt(multipartRequest.getParameter("available"));
		MultipartFile pthumbnailFile = multipartRequest.getFile("pthumbnail");
		String pthumbnail = pthumbnailFile.getOriginalFilename();
		MultipartFile pth2File = multipartRequest.getFile("pth2");
		String pth2 =pth2File.getOriginalFilename();
		MultipartFile pth3File = multipartRequest.getFile("pth3");
		String pth3 = pth3File.getOriginalFilename();
		
		File file = new File(directory, pthumbnail);
		pthumbnailFile.transferTo(file);
		File file2 = new File(directory, pth2);
		pth2File.transferTo(file2);
		File file3 = new File(directory, pth3);
		pth3File.transferTo(file3);
		
		System.out.println(pthumbnail+ pth2+ pth3);
		service.W_ProductInsert(pid, pname, pcategory, pprice, pstock, available, pthumbnail, pth2, pth3);
		
		return "redirect:W_ProductList";
	}
	
}
