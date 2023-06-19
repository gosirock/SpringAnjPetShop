<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="A_JoinCss.css">
<link rel="stylesheet" href="A_heardCss.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


function sample6_execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      var addr = ''; // 주소 변수

	      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	        addr = data.roadAddress;
	      } else { // 사용자가 지번 주소를 선택했을 경우(J)
	        addr = data.jibunAddress;
	      }

	      document.getElementById("address1").value = data.bname; // 동 정보
	      document.getElementById("postcode").value = data.zonecode; // 우편번호 정보
	      document.getElementById("address").value = addr; // 주소 정보
	    }
	  }).open();
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
								        
								<li class="main-nav04"><a href="#">CART</a></li>        
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

   	 			
   	 			
   	 			
   	 	
		   
				<div class="container">
				<h2>ANJ PET SHOP SIGN UP</h2><br/><br/><br/>
				<form action="A_JoinView.do" method="get" name="join">
					<div class="form-group">
						<label for="id">ID</label>
						<input type="text" name="id" id="id" class="back"  placeholder="아이디"><br/>
						<span id="idCheckConfirm" class = "check"></span>
					</div>
					<div class="form-group">
						<label for="passwd">password</label>
						<input type="password" name="passwd" id="pw1" class="back" placeholder="비밀번호"><br/>
						<span id="pwCheck" class = "check" ></span>
					</div>
					<div class="form-group">
						<label for="passwd2">password OK</label>
						<input type="password" name="passwd2" id="pw2" class="back" placeholder="비밀번호 확인">
					</div>
					<div class="form-group">
						<label for="name">name</label>
						<input type="text" name="name" id="name" class="back" placeholder="이름">
					</div>
					<div class="form-group">
						<label for="tel">tel number</label>
						<input type="text" name="tel" id="tel" class="back" placeholder="전화번호">
					</div>
					<div class="form-group">
						<label for="email">email</label>
						<input type="text" name="email" id="email"  class="back" placeholder="이메일">
					</div>
					<div class="form-group">
						<label for="address">address</label>
						<div style="display: flex; align-items: center;">
					  <input type="text" name="postcode" id="postcode" placeholder="우편번호" style="width: 100px; margin-right: 10px;">
					  <input type="text" name="address" id="address1" placeholder="동" style="flex-grow: 1; margin-right: 10px;">
					  <input type="text" name="detailaddress" id="address2" placeholder="상세주소" style="flex-grow: 1;">
					  <input type="button" class="btn-2" onclick="sample6_execDaumPostcode()" value="주소 찾기" style="border-radius: 0.5em; cursor: pointer;">
						</div>	
				 </div>
					<div class="form-group">
						<button onclick="checkjoin(event)">OK</button>
					</div>
				</form>
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
<script type="text/javascript" src="A_join.js" ></script> 
</html>