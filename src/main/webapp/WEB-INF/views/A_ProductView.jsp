<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="com.springlec.base.model.A_dto"%>
<%@ page import="com.javalec.dao.A_dao"%> --%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_pageCss.css">
</head>
<script type="text/javascript">

	// 가격정렬 및 검색
	
	function removeSortOrderParameter(url) {
	    var regex = /[?&]sortOrder=[^&]+(&|$)/i;
	    return url.replace(regex, '$1');
	}

	function handleSortOrderChange() {
	    var selectElement = document.getElementById("sortOrder");
	    var selectedValue = selectElement.value;

	    // 현재 페이지 URL에서 정렬 파라미터 제거
	    var url = removeSortOrderParameter(window.location.href);

	    // 선택된 정렬 파라미터 추가
	    if (selectedValue !== '') {
	        url += url.indexOf('?') === -1 ? '?sortOrder=' + selectedValue
	            : '&sortOrder=' + selectedValue;
	    }

	    // 페이지 리로드
	    window.location.href = url;
	}
	
	
	// 드롭다운 ----
	$(function(){
		   var $firstmenu = $('nav > ul > li'),
		       $header = $('header');
		    $firstmenu.mouseenter(function(){
		       $header.stop().animate({height:'300px'},200);
		    })
		    .mouseleave(function(){
		        $header.stop().animate({height:'50px'},200);
		    }) 
			});
			
	
	$(document).ready(function() {
		$(".dropdown").hover(
			function() {
				$(this).find(".dropdown-content").css("display", "block");
				$("header").addClass("fixed-header"); // 헤더에 fixed-header 클래스 추가
			},
			function() {
				$(this).find(".dropdown-content").css("display", "none");
				$("header").removeClass("fixed-header"); // 헤더에서 fixed-header 클래스 제거
			}
		);
	});
	
	
	
</script>
<body>

						<header>
				<div class="head-wrap">
					<div class="head-wrap-inner">
						<a href="Main?id=${sessionScope.USERID}"><img class="head-logo" src="LOGO.png"></a>  
					</div>
					<div class="head-wrap-sub">
						<nav class="head-menu-main-nav">
							<ul> 
								<li class="main-nav02 dropdown">
									<a href="#">🐕 ANJLIFE</a>
											<div class="dropdown-content">
												<a href="A_introduction">introduction</a>
												<a href="A_Part">Part</a>
											</div>
								</li>
								<li class="main-nav01"><a href="Product">🦴 SHOP</a></li>
									<li class="main-nav02 dropdown">
										<a href="O_review">💬 COMMUNITY</a>
											<div class="dropdown-content">
												<a href="O_review">review</a>
												<a href="O_qna">Q&A</a>
											</div>
								  </li>
								<li class="main-nav02 dropdown">
										<a href="O_notice">📜 NOTICE</a>
								      <div class="dropdown-content">
								      <a href="O_faq">FAQ</a>
									  <a href="O_notice">Notice</a>
									 </div>
								        
								<li class="main-nav04"><a href="T_cart">👜 CART</a></li>        
								<li class="right-align" id="loginContainer">
									<c:choose>
										  <c:when test="${empty sessionScope.USERID}">
										    <!-- 세션 값이 비어있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='A_loginView'">Login</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='A_JoinView'">New</button></li>
										  </c:when>
										  <c:otherwise>
										    <!-- 세션 값이 있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='Logout'">Logout</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='j_userPage'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>

							<img src="image_05.png" alt="My Image">
							<br />
							<br />


						<!-- 검색 및 상품정렬 -->
						<div style="text-align: right;">
						  <form action="Product" class="search-form">
              	  		<select name="query">
		                    <option value="pname" selected="selected">Product</option>
		                    <option value="pprice">Price</option>
		                </select>
			                <input type="text" name="content" size="150">
			                <input type="submit" value="Search">
			             <select id="sortOrder" name="sortOrder" onchange="handleSortOrderChange()">
		                    <option value="">Price Sort</option>
		                    <option value="highprice">Highest Price</option>
		                    <option value="lowprice">Lowest Price</option>
              		 	</select> 
				            </form>
				        </div>
						<br/>
						

							 <li class="center-align">
						        <a href="Product?pcategory=food" class="btn-login btn-dog">Food</a> 
						        <a href="Product?pcategory=clean" class="btn-login btn-dog">Clean</a> 
						        <a href="Product?pcategory=living" class="btn-login btn-dog">Living</a> 
                             </li><br><br>
				
						<!-- 전체 상품목록 -->
							<h1 style="text-align: center; color: #477A7B;">ANJ's Pick</h1><br>
						
							<div class="product-grid">
							  <c:forEach items="${A_ProductView}" var="dto">
							    <div class="product-item">
							      <a href="j_productClicked.do?pid=${dto.pid}">
							        <img class="thumbnail" src="images/thumbnail/${dto.pthumbnail}.png" alt="Product Thumbnail">
							      </a>
							      <h3>${dto.pname}</h3>
							      <p>PRICE: ￥  <span class="price">${dto.pprice}</span></p>
							    </div>
							  </c:forEach>
							</div>
							<br/><br/><br/>
				
				
			  
			  			
						<div class="pagination">
  							<button onclick="goToPreviousPage()">Back</button>
  						<div id="pageNumbers">
						     <span id="currentPage" class="page-number"></span>
						  </div>
						  <button onclick="goToNextPage()">Next</button>
						</div>
			
			
			
			
						<script>
						
						  // 상품 가격을 ,로 구분하여 표시
						  var priceElements = document.querySelectorAll('.price');
						  priceElements.forEach(function (element) {
						    element.textContent = parseInt(element.textContent).toLocaleString();
						  });
						  
						  
					  // 한 페이지에 보여줄 상품의 개수
					  var itemsPerPage = 8;
					
					  // 상품 목록 컨테이너 요소
					  var productGrid = document.querySelector('.product-grid');
					
					  // 상품 아이템 요소들
					  var productItems = productGrid.querySelectorAll('.product-item');
					
					  // 상품 아이템 개수
					  var itemCount = productItems.length;
					
					  // 현재 페이지 번호
					  var currentPage = 1;
					
					  // 전체 페이지 개수
					  var totalPages = Math.ceil(itemCount / itemsPerPage);
					
					  // 페이지를 업데이트하는 함수
					  function updatePage() {
					    // 모든 상품 아이템을 숨김
					    productItems.forEach(function (item) {
					      item.style.display = 'none';
					    });
					
					    // 현재 페이지에 해당하는 상품 아이템만 보여줌
					    var startIndex = (currentPage - 1) * itemsPerPage;
					    var endIndex = startIndex + itemsPerPage;
					    for (var i = startIndex; i < endIndex && i < itemCount; i++) {
					      productItems[i].style.display = 'block';
					    }
					
					    // 현재 페이지 번호를 표시하는 요소 업데이트
					    var currentPageElement = document.getElementById('currentPage');
					    currentPageElement.textContent = currentPage;
					  }
					
					  // 페이지 번호를 생성하고 표시하는 함수
					  function generatePagination() {
					    var paginationElement = document.getElementById('pagination');
					    paginationElement.innerHTML = '';
					
					    // 이전 페이지로 이동하는 버튼 생성
					    var previousButton = document.createElement('button');
					    previousButton.textContent = '이전';
					    previousButton.addEventListener('click', goToPreviousPage);
					    paginationElement.appendChild(previousButton);
					
					    // 페이지 번호 생성
					    for (var i = 1; i <= totalPages; i++) {
					      var pageButton = document.createElement('button');
					      pageButton.textContent = i;
					      pageButton.addEventListener('click', function () {
					        goToPage(parseInt(this.textContent));
					      });
					      paginationElement.appendChild(pageButton);
					    }
					
					    // 다음 페이지로 이동하는 버튼 생성
					    var nextButton = document.createElement('button');
					    nextButton.textContent = '다음';
					    nextButton.addEventListener('click', goToNextPage);
					    paginationElement.appendChild(nextButton);
					  }
					
					  // 초기 페이지 업데이트
					  updatePage();
					  // 페이지 번호 생성 및 표시
					  generatePagination();
					
					  // 페이지 번호를 클릭했을 때 해당 페이지로 이동
					  function goToPage(page) {
					    if (page < 1 || page > totalPages) {
					      return;
					    }
					    currentPage = page;
					    updatePage();
					  }
					
					  // 이전 페이지로 이동하는 함수
					  function goToPreviousPage() {
					    if (currentPage > 1) {
					      currentPage--;
					      updatePage();
					    }
					  }
					
					  // 다음 페이지로 이동하는 함수
					  function goToNextPage() {
					    if (currentPage < totalPages) {
					      currentPage++;
					      updatePage();
					    }
					  }
					</script>
					
					<!-- <script> // 1/3 형식으로 보여주는 것
						// 한 페이지에 보여줄 상품의 개수
						var itemsPerPage = 8;

						// 상품 목록 컨테이너 요소
						var productGrid = document.querySelector('.product-grid');

						// 상품 아이템 요소들
						var productItems = productGrid.querySelectorAll('.product-item');

						// 상품 아이템 개수
						var itemCount = productItems.length;

						// 현재 페이지 번호
						var currentPage = 1;

						// 전체 페이지 개수
						var totalPages = Math.ceil(itemCount / itemsPerPage);

						// 페이지를 업데이트하는 함수
						function updatePage() {
						  // 모든 상품 아이템을 숨김
						  productItems.forEach(function (item) {
						    item.style.display = 'none';
						  });

						  // 현재 페이지에 해당하는 상품 아이템만 보여줌
						  var startIndex = (currentPage - 1) * itemsPerPage;
						  var endIndex = startIndex + itemsPerPage;
						  for (var i = startIndex; i < endIndex && i < itemCount; i++) {
						    productItems[i].style.display = 'block';
						  }

						  // 현재 페이지 번호를 표시하는 요소 업데이트
						  var currentPageElement = document.getElementById('currentPage');
						  currentPageElement.textContent = currentPage;
						}

						// 전체 페이지 개수를 표시하는 요소 생성
						var totalPagesElement = document.createElement('span');
						totalPagesElement.id = 'totalPages';
						totalPagesElement.textContent = totalPages;
						
						// 

						// 현재 페이지 번호와 전체 페이지 개수를 표시하는 요소 찾기
						var currentPageElement = document.getElementById('currentPage');
						var paginationElement = currentPageElement.parentNode;

						// 전체 페이지 개수를 표시하는 요소를 현재 페이지 번호 다음에 삽입
						paginationElement.insertBefore(totalPagesElement, currentPageElement.nextSibling);

						// 초기 페이지 업데이트
						updatePage();

						// 페이지 번호를 클릭했을 때 해당 페이지로 이동
						function goToPage(page) {
						  if (page < 1 || page > totalPages) {
						    return;
						  }
						  currentPage = page;
						  updatePage();
						}

						// 이전 페이지로 이동하는 함수
						function goToPreviousPage() {
						  if (currentPage > 1) {
						    currentPage--;
						    updatePage();
						  }
						}

						  // 다음 페이지로 이동하는 함수
						  function goToNextPage() {
						    if (currentPage < totalPages) {
						      currentPage++;
						      updatePage();
						    }
						  } -->
											  
											  
											  
						  
					
						<footer>
							<ul>
								<li><a href="#">Brand Story</a></li>
								<li><a href="#">서비스이용약관</a></li>
								<li><a href="#">개인정보처리방침</a></li>
								<li><a href="#">전자금융거래약관</a></li>
							</ul>
							<div>
								<p>
									<strong>Corporation ANJ.industry</strong> <br> Gangnam-gu,
									Seoul (Yeoksam-dong The Joy Computer Academy) <br> CEO: Ahn
									Jae-won <br> Business registration number: 240-81-87676
									Business information confirmation <br> Mail-order business
									report: Gangnam 10238 Fax: 02-000-1234
								</p>
								<p>
									<strong>customer service center</strong> <br> Tel:
									Representative number 1234-5678 (Weekdays 09:00~18:00) <br>
									Dedicated to the future: 1522-5700 (365 days 09:00-18:00) <br>
									Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy) <br>
									Fax: 02-000-1234 | Mail: ajw0376@gmail.com <br>
								</p>
							</div>
						</footer>
</html>