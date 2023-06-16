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
<!-- <script src="JS/O_ScrollTop.js"></script> -->

<script type="text/javascript">
	function writeCheck(){
		const form = document.writeNotice
		const n_title = form.n_title.value
		const n_content = form.n_content.value
		
		if(n_title == ""){
			alert("제목을 입력해 주세요.")
			return
		}
		if(n_content == ""){
			alert("내용을 입력해 주세요.")
			return
		}
		form.action = "O_writeNotice.do";
		document.productinfo.submit();
	}
</script>
</head>
<link rel="stylesheet" href="W_Header.css">
<body>
<header>
					  <nav>
					    <ul>
					      <li><a href="W_Home.do">HOME</a></li>
					      <li><a href="W_ProductList.jsp">상품 관리</a>
					      	<ul>
					      		<li><a href="W_ProductList.jsp">상품 목록</a></li>
					      		<li><a href="W_ProductInsert.jsp">상품 등록</a></li>
					      	</ul>
					      </li>
					      <li><a href="W_UserList.jsp">회원 관리</a></li>
					      <li><a href="O_adminNotice.do">게시판 관리</a>
					      	
					      	</li>
					      <li><a href="W_SalesDaily.jsp">매출현황</a>
					      <ul>
					      		<li><a href="W_SalesDaily.jsp">일별 매출</a></li>
					      		<li><a href="W_SalesMonthly.jsp">월별 매출</a></li>
					      	</ul>
					      </li>
					    </ul>
					  </nav>
</header>
	<!----------------------------------------------------------------------------------------------------->
	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<span class="selected"><a href="O_adminNotice.do">NOTICE</a></span>
			<a href="O_adminFAQ.do">FAQ</a> 
			<a href="O_adminQNA.do">Q&A</a> 
			<a href="O_adminReview.do">REVIEW</a> 
		<br><br>
	</div>

	<div class="page-title">
		<h4>공지사항 등록</h4>
	</div>
	<!-- board list area -->
	<div class="container">
		<form name="writeNotice" method="post">
			<input type="hidden" name="adminid" value="admin">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col" class="th-wnum">제목</th>
						<th scope="col" class="th-left"><input type="text" name="n_title" placeholder="제목을 입력하세요."></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="th-wnum">작성자</td>
						<td scope="col" class="th-left">admin</td> <!-- 나중에 로그인한 관리자의 세션으로 받아오기 -->
					</tr>
					<tr>
						<td class="th-wnum">내용</td>
						<td class="th-left"><textarea rows="25" cols="102" wrap="hard" name="n_content" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					<tr>
						<td class="th-wnum"><span class="list-button"><a href="O_adminNotice.do">목록</a></span></td>
						<td class="th-right"><input type="submit" class="list-button" value="등록" onclick="writeCheck()"></td>
					</tr>
				</tbody>
			</table>
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