package com.springlec.base.model;

public class O_paginationDto {

	// Field
	int itemsPerPage; // 한 페이지 당 게시물 개수
	int totalCount; // 전체 게시물의 개수
	int currentPage; // 현재 페이지
	int totalPages; // 전체 페이지
	int pageSize; // 한 페이지당 보여줄 페이지의 개수
	
	// Constructor
	public O_paginationDto() {
		// TODO Auto-generated constructor stub
	}

	public O_paginationDto(int itemsPerPage, int totalCount, int currentPage, int totalPages, int pageSize) {
		super();
		this.itemsPerPage = itemsPerPage;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
	}

	// Getter And Setter
	public int getItemsPerPage() {
		return itemsPerPage;
	}

	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	
}
