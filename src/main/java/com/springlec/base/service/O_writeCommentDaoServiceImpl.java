package com.springlec.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.O_writeCommentDao;

@Service
public class O_writeCommentDaoServiceImpl implements O_writeCommentDaoService {

	@Autowired
	O_writeCommentDao dao;
}
