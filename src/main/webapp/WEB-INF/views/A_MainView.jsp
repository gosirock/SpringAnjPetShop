<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
	String userid = request.getParameter("id");
	session.setAttribute("USERID", userid);   
 %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainView</title>
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_MainCss.css">
<link rel="stylesheet" href="exampleCss.css">
<style>
</style>
</head>
<script src="js/O_ScrollTop.js"></script>
<script type="text/javascript">

		
//(1) 검색 및 가격정렬-------------------------------------------

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

function removeSortOrderParameter(url) {
	var urlParts = url.split('?');
	if (urlParts.length > 1) {
		var queryParams = urlParts[1].split('&');
		var updatedQueryParams = queryParams.filter(function(param) {
			return !param.startsWith('sortOrder=');
		});
		return urlParts[0] + '?' + updatedQueryParams.join('&');
	}
	return url;
}


// 드롭다운 
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
						<a href="A_MainView.do?id=${sessionScope.USERID}"><img class="head-logo" src="LOGO.png"></a>  
					</div>
					<div class="head-wrap-sub">
						<nav class="head-menu-main-nav">
							<ul> 
								<li class="main-nav02 dropdown">
									<a href="#">ANJLIFE</a>
											<div class="dropdown-content">
												<a href="A_introduction.jsp">introduction</a>
												<a href="A_Part.jsp">Part</a>
											</div>
								</li>
								<li class="main-nav01"><a href="Product">SHOP</a></li>
									<li class="main-nav02 dropdown">
										<a href="#">COMMUNITY</a>
											<div class="dropdown-content">
												<a href="O_Review.do">review</a>
												<a href="O_QNA.do">Q&A</a>
											</div>
								  </li>
								<li class="main-nav02 dropdown">
										<a href="#">NOTICE</a>
								      <div class="dropdown-content">
								      <a href="O_FAQ.do">FAQ</a>
									  <a href="O_Notice.do">Notice</a>
									 </div>
								        
								<li class="main-nav04"><a href="cart.do">CART</a></li>        
								<li class="right-align" id="loginContainer">
									<c:choose>
										  <c:when test="${empty sessionScope.USERID}">
										    <!-- 세션 값이 비어있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">Login</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='A_JoinView.jsp'">New</button></li>
										  </c:when>
										  <c:otherwise>
										    <!-- 세션 값이 있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='A_logout.do'">Logout</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header><br><br> <br> <br><br><br>
     				
     				
     				<!-- 검  -->
     				
     				 <form action="Product" class="search-form">  <!-- 검색 -->
              	 		 <select name="query">
		                    <option value="pname" selected="selected">Product</option>
		                    <option value="pprice">Price</option>
		                </select>
			                <input type="text" name="content" size="500">
			                <input type="submit" value="Search">
			         </form><br><br>
				<!-- 아래부터 본문---------------------------------------------------------------->
		
		 				
				<!-- (0)  메인화면 이미지 ( 추후 상품상세페이지와 연결할거야 ) ----------------------->
	
						<ul class="slides">
						    <input type="radio" name="radio-btn" id="img-1" checked />
						    <li class="slide-container">
						    <div class="slide">
						      <img src="image_10.png" />
						        </div>
						    <div class="nav">
						      <label for="img-6" class="prev">&#x2039;</label>
						      <label for="img-2" class="next">&#x203a;</label>
						    </div>
						    </li>
						
						    <input type="radio" name="radio-btn" id="img-2" />
						    <li class="slide-container">
						        <div class="slide">
						          <img src="image_11.png" />
						        </div>
						    <div class="nav">
						      <label for="img-1" class="prev">&#x2039;</label>
						      <label for="img-3" class="next">&#x203a;</label>
						    </div>
						    </li>
						   
						    <input type="radio" name="radio-btn" id="img-3" />
						    <li class="slide-container">
						        <div class="slide">
						          <img src="image_12.png" />
						        </div>
						    <div class="nav">
						      <label for="img-1" class="prev">&#x2039;</label>
						      <label for="img-2" class="next">&#x203a;</label>
						      <label for="img-3" class="next">&#x203a;</label>
						    </div>
						    </li>

						    <li class="nav-dots">
						      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
						      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
						      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
						    </li>
						</ul>
							<br/><br/><br/>

					
				<!--(2) 판매량 순으로 데이터 베이스 가져오기 -------------------------------------------->

						<div style="text-align: center;">
  						<input type="button" value="BEST PRODUCT" style="font-size: 20px; 	
  						color: white; background-color: #2196F3; border: none; width: 20%; height: 50px; 
  						border-radius: 25px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);">
						</div><br/><br/><hr>
						
						
				
						<div class="product-grid" id="ranking-product-grid">
						  <c:forEach items="${A_MainView2}" var="dto">
						    <div class="product-item">	
						      <img src="images/thumbnail/${dto.pthumbnail}.png" alt="Product Thumbnail">
						      <h3>${dto.pname}</h3>
						      <p>Price: ${dto.pprice}원</p>
						    </div>
						  </c:forEach>
						</div>
						
						<style> /*랭킹 애니메이션 효과 */
						
						#ranking-product-grid {
						  overflow: hidden;
						}
						
						#ranking-product-grid .product-item {
						  display: inline-block;
						  animation: scrollLeft 10s linear infinite;
						}
						
						@keyframes scrollLeft {
						  0% { transform: translateX(0); }
						  100% { transform: translateX(-100%); }
						}
						</style><hr><br>
			
  				<!-- (1) 전체상품 목록 데이터 베이스 가져오기  ------------------------------------------>

					<div style="text-align: left;">
   				 <img src="image_16.png" alt="My Image" style="width: 90%; height: 100%;">
					</div><br><br>	
				
				<h3>Your dog is your family. Find a new family for an abandoned dog</h3>
				<h3>Dogs live their whole lives looking only at their owners.</h3>
				<h3>Please don't abandon your children</h3>
				
				<br>		
					
				<div style="display: flex; justify-content: center;">
    				<button class="button-style">Abandoned dog</button>
				</div>
					<br><br>

				<!-- (3) 랜덤으로 데이터 베이스 가져오기 ------------------------------------------------>
				
				<br/>
				
				<img src="image_13.png" alt="My Image" style="width: 90%; height: auto;"><bR>
				
						<h3>Recommended product of the day Discover new products every day</h3><br><br>
				<div style="text-align: center;">
    				<input type="button" value="RANDOM PRODUCT" class="button-style">
				</div> <br><br>
				
				
					<div class="product-grid">
						  <c:forEach items="${A_MainView3}" var="dto">
						    <div class="product-item">
						     <img src="images/thumbnail/${dto.pthumbnail}.png" alt="Product Thumbnail">	
						     <h3>${dto.pname}</h3>
						      <p>Price: ${dto.pprice}</p>
						    </div>
						  </c:forEach>
						</div>
					
					<!-- 탑 -->
					
					<button class="top-button" onclick="scrollToTop()">top</button>
				

				 <footer>
            <ul>
                <li><a href="#">Brand Story</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
            
                <p>
                    <strong>Corporation ANJ.industry</strong>
                    <br>
                    Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy)
                    <br>
                    CEO: Ahn Jae-won
                    <br>   
					Business registration number: 240-81-87676 Business information confirmation
                    <br>
                    Mail-order business report: Gangnam 10238 Fax: 02-000-1234
                </p>
                <p>
                    <strong>customer service center</strong>
                    <br>
                    Tel : Representative number 1234-5678 (Weekdays 09:00~18:00)
                    <br>
                    Dedicated to the future: 1522-5700 (365 days 09:00-18:00)
                    <br>
                    Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy)
                    <br>
                    Fax : 02-000-1234 | Mail : ajw0376@gmail.com
                    <br>
                </p>   
            </div>
        </footer>
        
</body>
</html>