<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>ANJ MY PAGE</title>
<link rel="stylesheet" href="J_userMyPage.css">
<!-- <link rel="stylesheet" href="A_heardCss.css"> -->
<script type="text/javascript">
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
</head>
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
								<li class="main-nav01"><a href="A_ProductView.do">SHOP</a></li>
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
			</header>

	<main class="main">

	<h1 style="text-align: center; color : #477A7B">MY PAGE</h1><br/><br/>
	<h2 style="text-align: center;">${userView.username } 님, 환영합니다!</h2><br/>
	
	<div class="userExpense"> 		<!-- 사용자 마일리지 및 총 구매 금액 보여주는 테이블 -->
		<table class="mileage">
			<tr>
				<td> 사용 가능하신 적립금 	<!-- 총 제품 구매 적립금 - 사용한 적립금 --> </td>
				<td><fmt:formatNumber value="${userView.mileage }" pattern="#,###" /> 원 
				<form action="J_mileageHistoryPage.jsp" style="display: inline;">
					<input type="submit" value="조회"> </form></td>		<!-- **버튼 누르면 조회페이지로 넘어가도록!!! -->
				<td> 총 제품구매 적립금	<!-- 모든 적립금 내역들의 합계 --> </td>
				<td><fmt:formatNumber value="${orderMileage.totalMileage}" pattern="#,###" /> 원 </td>
				
			</tr>
			<tr>
				<td> 사용하신 적립금 </td>
				<td> <fmt:formatNumber value="${orderMileage.totalUsedMileage }" pattern="#,###" /> 원 </td>
				<td> 총 주문 금액  </td>
				<td>
				<fmt:formatNumber value="${orderMileage.totalPrice}" pattern="#,###" /> 원
				(<fmt:formatNumber value="${orderMileage.ordercount}" pattern="#,###" />회)
				</td>
			</tr>
		</table>
	</div>
	<br/><br/>
	<div class="userOperations">
		<table class="operations">
			<tr>
				<td> 
				<a href="J_orderHistoryPage.jsp"><img src="J_userPageIcon/J_orderIcon.gif" style="width: 3px; height: auto; border: 1px solid black;"></a> 
				<h4><a href="J_orderHistoryPage.jsp">ORDER </a></h4> 
				<h5><a href="J_orderHistoryPage.jsp">주문내역 조회 </a></h5>
				<h6><a href="J_orderHistoryPage.jsp">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다. </a></h6>  
				</td>

				<td>
				<a href="J_userProfilePage.do"><img src="J_userPageIcon/J_profileIcon.gif" style="width: 3px; height: auto;"></a> 
				<h4><a href="J_userProfilePage.do"> PROFILE </a> </h4> 
				<h5><a href="J_userProfilePage.do"> 회원 정보 </a></h5>
				<h6><a href="J_userProfilePage.do"> 회원이신 고객님의 개인 정보를 관리하는 공간입니다. </a></h6>  
				</td>

				<td>	
				<a href="J_wishListPage.jsp"><img src="J_userPageIcon/J_wishlistIcon.gif" style="width: 3px; height: auto; /* border: 1px solid black; */"></a> 
				<h4><a href="J_wishListPage.jsp"> WISHLIST </a></h4> 
				<h5><a href="J_wishListPage.jsp"> 관심 상품 </a></h5>
				<h6><a href="J_wishListPage.jsp"> 관심상품으로 등록하신 상품의 목록을 보여드립니다. </a></h6>  
				</td>
			</tr>
			<tr>			
				<td> 
				<a href="J_mileageHistoryPage.jsp"><img src="J_userPageIcon/J_mileageIcon.gif" style="width: 3px; height: auto; /* border: 1px solid black; */"></a> 
				<h4><a href="J_mileageHistoryPage.jsp"> MILEAGE </a></h4> 
				<h5><a href="J_mileageHistoryPage.jsp"> 제품구매 적립금 </a></h5>
				<h6><a href="J_mileageHistoryPage.jsp"> 제품구매 적립금은 상품 구매 시 사용하실 수 있습니다. </a></h6>  
				</td>
				
				<td>
				<a href="J_bordPage.jsp"><img src="J_userPageIcon/J_boardIcon.gif" style="width: 3px; height: auto; /* border: 1px solid black; */"></a> 
				<h4><a href="J_bordPage.jsp"> BOARD </a></h4> 
				<h5><a href="J_bordPage.jsp"> 게시물 관리 </a></h5>
				<h6><a href="J_bordPage.jsp"> 고객님께서 작성하신 게시물을 관리하는 공간입니다. </a></h6>  
				</td> 
				
				<td>
				<img src="J_userPageIcon/J_customercenterIcon.gif" style="width: 3px; height: auto; /* border: 1px solid black; */"> 
				<h4> 고객센터 </h4> 
				<h5> 1577 - 5462 </h5>
				<h6> 매일 AM 09:00 ~ PM 17:00 <br/>
					 Lunch PM 12:00 ~ 13:00 <br/>
					 Sat, Sun, Holiday OFF </h6>  
				</td>
			</tr>
		</table>
	</div>
	
	
		
	</main>
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
		
	
	<!-- <footer>
		<p>
			<span>TEL. 1877-3228<br/>
			E-MAIL. arrr@dongwon.com<br/>
			ADDRESS. 10th floor, 68, Mabangro, Seocho-gu, Seoul,
			Republic of Korea, 06775<br/>
			BUSINESS NO. 703-88-01843 </span>
		</p>
	</footer> -->

</body>
</html>