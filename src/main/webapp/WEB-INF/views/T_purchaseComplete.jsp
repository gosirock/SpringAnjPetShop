<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="T_cartCss.css">
<meta charset="UTF-8">
<title>구매완료</title>


<script type="text/javascript">
	$(function() {
		var $firstmenu = $('nav > ul > li'), $header = $('header');
		$firstmenu.mouseenter(function() {
			$header.stop().animate({
				height : '300px'
			}, 200);
		}).mouseleave(function() {
			$header.stop().animate({
				height : '50px'
			}, 200);
		})
	});

	$(document).ready(function() {
		$(".dropdown").hover(function() {
			$(this).find(".dropdown-content").css("display", "block");
			$("header").addClass("fixed-header"); // 헤더에 fixed-header 클래스 추가
		}, function() {
			$(this).find(".dropdown-content").css("display", "none");
			$("header").removeClass("fixed-header"); // 헤더에서 fixed-header 클래스 제거
		});
	});
</script>


</head>
<body>

	<header>
		<div class="head-wrap">
			<div class="head-wrap-inner">
				<a href="A_MainView.do?id=${sessionScope.USERID}"><img
					class="head-logo" src="LOGO.png"></a>
			</div>
			<div class="head-wrap-sub">
				<nav class="head-menu-main-nav">
					<ul>
						<li class="main-nav02 dropdown"><a href="#">ANJLIFE</a>
							<div class="dropdown-content">
								<a href="A_introduction.jsp">introduction</a> <a href="#">BRAND</a>
								<a href="#">Part</a>
							</div></li>
						<li class="main-nav01"><a href="A_ProductView.do">SHOP</a></li>
						<li class="main-nav02 dropdown"><a href="#">COMMUNITY</a>
							<div class="dropdown-content">
								<a href="#">review</a> <a href="#">Q&A</a>
								<!-- <a href="#">Part</a> -->
							</div></li>

						<li class="main-nav04"><a href="#">NOTICE</a></li>
						<li class="main-nav04"><a href="#">CART</a></li>
						<li class="right-align" id="loginContainer">
						<li><button class="btn-login btn-dog"
								onclick="location.href='A_loginView.jsp'">Login</button></li>
						<li><button class="btn-login btn-dog"
								onclick="location.href='A_JoinView.jsp'">New</button></li>
						<li><button class="btn-login btn-dog"
								onclick="location.href='A_loginView.jsp'">Logout</button></li>
						<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	
		<h1 style="text-align: center;">고객님의 주문이 완료 되었습니다.</h1>
		<br> <br> <br>
	<main class="main">
		
	</main>
	<c:set var="ordernum" value="${content_View.ordernum}" />
	<table border="0">
		<tr>
			<td>주문번호 : ${ordernum}<br>
			</td>
		</tr>
		<tr>
			<td>주문날짜 : ${content_View.orderdate}<br>
			</td>
		</tr>
	</table>

	<br>
	<br>
	<br>

	<div style="display: flex; justify-content: center;">
		<hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>
	<table border="0">
		<tr>
			<td style="color: #477a7b;">주문 상품 정보<br></td>
		</tr>
	</table><br>

	<c:forEach var="product" items="${orderList}">
	<br>
		<table border="0" style="border-top: 1px solid #E8E8E8;">
			<tr>
				<td style="width: 150px; height: 50px; text-align: left;"><img
					alt="제품 이미지를 준비중 입니다."
					src="images/thumbnail/${product.pthumbnail}.png"></td>
				<td style="width: 750px; height: 50px; text-align: left;">&emsp;&emsp;<span
					class="pname" style="font-size: 33px;">${product.pname}</span><br> &emsp;&emsp;<span
					class="pid">${product.pid}</span><br>
				</td>
				<td style="width: 130px;">x${product.count}</td>
				<td><fmt:formatNumber value="${product.orderprice}"
						pattern="#,##0" />원</td>
			</tr>
		</table>
	</c:forEach>
	<br>

	<div style="display: flex; justify-content: center;">
		<hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>
	<table border="0">
		<tr>
			<td colspan="2" style="color: #477a7b; border-bottom: 1px solid #E8E8E8;">결제정보<br>
			<br>
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 30px; text-align: left;">전체주문금액</td>
			<td style="text-align: left;">${content_View.orderprice}원<br>
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 30px; text-align: left;">사용 마일리지</td>
			<td style="text-align: left;">${content_View.usedmileage}원<br>
			</td>
		</tr>
		<tr>
			<td style="width: 300px; height: 30px; text-align: left;">최종결제금액</td>
			<td style="text-align: left;"><c:set var="remainingAmount"
					value="${content_View.orderprice - content_View.usedmileage}" />
				${remainingAmount}원<br></td>
		</tr>
		<tr>
			<td style="width: 300px; height: 30px; text-align: left;">결제수단</td>
			<td style="text-align: left;">${content_View.payment}<br>
			</td>
		</tr>
	</table>
	<br>

	<%-- <c:forEach var="dto" items="${orderproduct}"> --%>


	<%-- </c:forEach> --%>

	<%-- ${dto.pid} 
${dto.pname} 
${dto.orderprice} 
${dto.count}  --%>

	<div style="display: flex; justify-content: center;">
		<hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>
	<form action="A_MainView.do">
		<table border="0">
			<tr>
				<td colspan="2" style="color: #477a7b; border-bottom: 1px solid #E8E8E8;">배송지정보<br>
				
				</td>
			</tr>
			<tr>
				<td style="width: 300px; height: 30px; text-align: left;">받으시는분</td>
				<td style="text-align: left;">${content_View.username}<br>
				</td>
			</tr>
			<tr>
				<td style="width: 300px; height: 30px; text-align: left;">우편번호</td>
				<td style="text-align: left;">${content_View.userpostcode}<br>
				</td>
			</tr>
			<tr>
				<td style="width: 300px; height: 30px; text-align: left;">주소</td>
				<td style="text-align: left;">${content_View.shipaddress}<br>
				</td>
			</tr>
			<tr>
				<td style="width: 300px; height: 30px; text-align: left;">휴대전화</td>
				<td style="text-align: left;">${content_View.usertel}<br>
				</td>
			</tr>
			<tr>
				<td style="width: 300px; height: 30px; text-align: left;">배송메시지</td>
				<td style="text-align: left;">${content_View.ordermessage}<br>
				</td>
			</tr>
			<tr>

				<td colspan="2" style="height: 80px;"><br><br><br><br><br><br><input type="submit" value="쇼핑계속하기"
					style=" text-align: center; width: 500px; height: 50px; background-color: #477A7B; border: none; color: white;">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
	<br><br>
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
				<strong>Corporation ANJ.industry</strong> <br> Gangnam-gu,
				Seoul (Yeoksam-dong The Joy Computer Academy) <br> CEO: Ahn
				Jae-won <br> Business registration number: 240-81-87676
				Business information confirmation <br> Mail-order business
				report: Gangnam 10238 Fax: 02-000-1234
			</p>
			<p>
				<strong>customer service center</strong> <br> Tel :
				Representative number 1234-5678 (Weekdays 09:00~18:00) <br>
				Dedicated to the future: 1522-5700 (365 days 09:00-18:00) <br>
				Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy) <br>
				Fax : 02-000-1234 | Mail : ajw0376@gmail.com <br>
			</p>
		</div>
	</footer>
</body>
</html>
