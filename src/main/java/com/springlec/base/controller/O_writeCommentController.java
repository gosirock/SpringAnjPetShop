package com.springlec.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.springlec.base.service.O_writeCommentDaoService;

@Controller
public class O_writeCommentController {

	@Autowired
	O_writeCommentDaoService service;
	
	
}
