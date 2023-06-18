package com.springlec.base.service;

import com.springlec.base.model.O_paginationDto;

public interface O_pagination {

	public O_paginationDto pagination(int itemsPerPage, int totalCount, int currentPage, int totalPages, int pageSize) throws Exception;
}
