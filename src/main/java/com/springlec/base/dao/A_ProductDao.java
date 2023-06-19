package com.springlec.base.dao;

import java.util.List;

import com.springlec.base.model.A_ProductDto;

public interface A_ProductDao {

	public List<A_ProductDto> A_ProductView(String pcategory, String query, String content, String sortOrder) throws Exception;

}
	


