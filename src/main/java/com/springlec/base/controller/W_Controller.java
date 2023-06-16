package com.springlec.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class W_Controller {

	
	@RequestMapping("/")
	public String insert() throws Exception{
		return "W_Home";
	}
}
