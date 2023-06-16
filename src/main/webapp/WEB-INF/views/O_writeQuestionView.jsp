<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="index" value="0" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>

<link rel="stylesheet" href="CSS/O_NBoardStyle.css">
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_MainCss.css">
<link rel="stylesheet" href="CSS/O_Common.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="JS/O_ScrollTop.js"></script>

<script type="text/javascript">
	function writeCheck(){
		const form = document.writeQnA
		const qna_title = form.qna_title.value
		const qna_content = form.qna_content.value
		
		if(qna_title == ""){
			alert("제목을 입력해 주세요.")
			return
		}
		if(qna_content == ""){
			alert("내용을 입력해 주세요.")
			return
		}
		form.action = "O_writeQuestion.do";
		document.productinfo.submit();
	}

  function setQnaTitle() { // select의 옵션 선택하자마자 제목에 값을 넣어주는 함수.
    var qCategory = document.getElementsByName('qCategory')[0];
    var qnaTitle = document.getElementById('qna_title');

    var selectedCategory = qCategory.options[qCategory.selectedIndex].value;
    qnaTitle.value = selectedCategory + " 문의 드립니다.";
  }
</script>
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
										<a href="cart.do">COMMUNITY</a>
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
										    <li><button class="btn-login btn-dog" onclick="location.href='j_userpage.do'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
	<!----------------------------------------------------------------------------------------------------->
	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<a href="O_Notice.do">NOTICE</a> 
			<a href="O_FAQ.do">FAQ</a> 
			<span class="selected"><a href="O_QNA.do">Q&A</a></span>
			<a href="O_Review.do">REVIEW</a> 
		<br><br>
	</div>

	<div class="page-title">
		<h4>QnA 등록</h4>
	</div>
	<!-- board list area -->
	<div class="container">
		<form name="writeQnA"  method="post">
		  <input type="hidden" name="userid" value="${sessionScope.USERID}"> <!-- 로그인 구현 시 session값으로 바꿔주기 -->
		  <table class="board-table">
		    <thead>
		      <tr>
		        <th scope="col">
		          <div class="qna">
		            <select name="qCategory" onchange="setQnaTitle()">
		              <option value="상품 관련">상품</option>
		              <option value="배송 관련">배송</option>
		              <option value="입금 관련">입금확인</option>
		              <option value="주문 취소">주문취소</option>
		              <option value="환불">환불</option>
		              <option value="기타">기타</option>
		            </select>
		          </div>
		        </th>
		        <th scope="col">
		          <span class="qna"><input type="text" name="qna_title" id="qna_title" value="상품 관련 문의 드립니다."></span>
		        </th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>내용</td>
		        <td><textarea rows="5" cols="100" wrap="hard" name="qna_content" placeholder="내용을 입력하세요."></textarea></td>
		      </tr>
		    </tbody>
		  </table>
		  <div class="container" style="text-align: right;">
		    <br>
		    <input type="submit" class="list-button th-right" value="등록" onclick="writeCheck()">
		  </div>
</form>
	</div>
	<button class="top-button" onclick="scrollToTop()">top</button>
	<!----------------------------------------------------------------------------------------------------->
	<footer>
		<ul>
			<li><a href="#">Brand Story</a></li>
			<li><a href="#">서비스이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">전자금융거래약관</a></li>
		</ul>
		<div>
			<p>
				<img src="LOGO.png" alt="푸터로고">
			</p>
			<p>
				<strong>Corporation ANJ.industry</strong> <br> Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy) <br> CEO: Ahn Jae-won <br> Business registration number: 240-81-87676 Business information confirmation <br> Mail-order business report: Gangnam 10238 Fax: 02-000-1234
			</p>
			<p>
				<strong>customer service center</strong> <br> Tel : Representative number 1234-5678 (Weekdays 09:00~18:00) <br> Dedicated to the future: 1522-5700 (365 days 09:00-18:00) <br> Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy) <br> Fax : 02-000-1234 | Mail : ajw0376@gmail.com <br>
			</p>
		</div>
	</footer>
</body>
</html>