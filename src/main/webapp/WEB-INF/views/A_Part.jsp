<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_Part.css">
<link rel="stylesheet" href="A_MainCss.css">
<link rel="stylesheet" href="exampleCss.css">
</head>
<script type="text/javascript">
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
			</header><br/><br/><br/>><br/><br/>><br/>
						<br/>
					
						<div class="container">
								<h1>Part</h1>
							<div class="timeline-item" date-is='11-03-1989'>
								<h1>안재원 Ahn  Jae Won</h1>
								<p>
									메인페이지 Main Page<br/>
									상품리스트페이지 Product Page<br/>
									로그인 Login<br>
									회원가입 Sign Up<br/>
									인트러덕션 introduction
								</p>
							</div>
							 <div class="profile-pic">
   							 <img src="image_222.png" alt="Image">
							</div>
							<div class="timeline-item" date-is='19-11-1995'>
								<h1>오성민 Oh Sung Min</h1>
								<p>
								  묻고답하기 Q&A Board<br/>
								  자주묻는 질문 FAQ Board<br/>
								  공지사항 Notice Board<br/>
								  리뷰 Review Board<br/>
								</p>
							</div>
							
							<div class="timeline-item" date-is='20-07-1990'>
								<h1>이종욱 Lee Jong Wook</h1>
								<p>
								 관리자 Admin Page<br/>
								 DB(server) 관리
								</p>
							</div>
							<div class="timeline-item" date-is='20-07-1990'>
								<h1>정태영 Jung Tae Young</h1>
								<p>
								구매 Order Page <br/>
								장바구니 Cart Page
								</p>
							</div>
							<div class="timeline-item" date-is='17-11-1996'>
								<h1>이진영 Lee Jin Young</h1>
								<p>
								상품 상세페이지 Product Detail Page <br/>
								마이페이지 User Page
								</p>
							</div>
							
						</div>
					
					
					
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
						

</body>
</html>