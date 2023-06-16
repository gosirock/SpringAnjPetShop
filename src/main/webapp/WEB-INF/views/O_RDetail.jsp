<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="index" value="0" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰 내용</title>

<link rel="stylesheet" href="CSS/O_NBoardStyle.css">
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_MainCss.css">
<link rel="stylesheet" href="CSS/O_Common.css">
<link rel="stylesheet" href="CSS/O_RBoardStyle.css">
<link rel="stylesheet" href="CSS/O_CommentStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="JS/O_ScrollTop.js"></script>

<script type="text/javascript">
	function updateCheck(){
		const form = document.RDetail
		const r_title = form.r_title.value
		const r_content = form.r_content.value
		
		if(r_title == ""){
			alert("제목을 입력해 주세요.")
			return
		}
		if(r_content == ""){
			alert("내용을 입력해 주세요.")
			return
		}
		if(confirm("수정하시겠습니까?") == true){
		form.action = "";
		form.submit();
		}
	}
	
	function deleteCheck(){
		const form = document.RDetail
		
		if(confirm("정말 삭제하시겠습니까?") == true){
			const form = document.RDetail
			form.action = "";
			form.submit();
			}
	}
	
	function writeAction(){
		const form = document.writeComment
		if(form.userid.value == ""){
			alert("로그인이 필요한 페이지입니다.");
			return
		}else{
			form.action = "O_writeComment.do";
			form.submit
		}
		
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
									<a href="cart.do">ANJLIFE</a>
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
	<!-- ---------------------- -->
	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<a href="O_Notice.do">NOTICE</a> 
			<a href="O_FAQ.do">FAQ</a> 
			<a href="O_QNA.do">Q&A</a> 
			<span class="selected"><a href="O_Review.do">REVIEW</a></span>
		<br><br>
	</div>
	<div class="page-title">
		<h4>리뷰 상세페이지</h4>
	</div>

	<div class="container">
		<img src="images/review/${RDetail.filename }.png" alt="이미지 준비중" style="width: 25%; height: 25%;">
	</div>
	<!-- board list area -->
	<div class="container">
		<form name="RDetail" method="post"> <!-- 유저용에서는 이 폼태그 빼고 제목을 input타입 빼고 그냥 적기, textarea readonly 속성 넣어주기 -->
			<input type="hidden" name="userid" value="${sessionScope.USERID}"> <!-- 나중에는 로그인 아이디 세션 받아서 수정하기 -->
			<input type="hidden" name="seq" value="${seq }">
			<table class="board-table">
				<thead>
					<tr>
						<th class="th-wwnum">제목</th>
						<th scope="col"><input type="text" readonly="readonly" name="r_title" value="${RDetail.r_title}"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:set var="maskedUserId" value="${fn:substring(RDetail.userid, 0, 3)}***" />
						<td class="th-wnum">작성자</td>
						<td scope="col" class="th-left">${maskedUserId }</td>
					</tr>
					<tr>
						<td class="th-wnum">상품<br>설명</td>
						<td scope="col" class="th-left" align="left">
							<img src="images/thumbnail/${RDetail.pthumbnail}.png" style="width: 8%; float: left;" alt="Product Thumbnail">
							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${RDetail.pname }
						</td>
					</tr>
					<tr>
						<td scope="col" class="th-wnum">작성일</td>
						<td scope="col" class="th-left">${RDetail.writedate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea readonly="readonly" rows="20" cols="109" wrap="hard" name="n_content"><c:out value="${RDetail.r_content}" /></textarea>
						</td>
					</tr>
					<tr>
						<td class="th-wnum"><span class="list-button"><a href="O_Review.do">목록</a></span></td>
						<td class="th-right">
							<input type="submit" class="list-button" value="수정" onclick="updateCheck()">
							<input type="submit" class="list-button" value="삭제" onclick="deleteCheck()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<form name="writeComment">
		<input type="hidden" name="userid" value="${sessionScope.USERID}">
		<input type="hidden" name="seq" value="${seq }">
			<table class="board-table">
				<thead>
					<tr>
						<th class="th-id">${sessionScope.USERID}</th>
						<th scope="col" colspan="3">
							<span class="comment"><input type="text" name="comment" placeholder="댓글을 입력하세요."></span>
						</th>
						<th><input class="comment-button" type="reset" value="취소"></th>
						<th><input class="cancel-button" type="button" value="댓글" onclick="writeAction()"></th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
<!-- 댓글 -->
	<div class="container">
		<form action="">
			<table class="comment-table">
				<tbody>
					<c:forEach items="${CommentList}" var="dto">
						<c:set var="indentationSize" value="12" />
						<c:set var="indentation" value="&nbsp;" />
						<c:forEach begin="1" end="${dto.step * indentationSize}" var="i">
							<c:set var="indentation" value="${indentation}&nbsp;" />
						</c:forEach>
						<c:set var="indentation1Size" value="10" />
						<c:set var="indentation1" value="&nbsp;" />
						<c:forEach begin="1" end="${dto.step * indentation1Size}" var="i">
							<c:set var="indentation1" value="${indentation1}&nbsp;" />
						</c:forEach>
						<tr>
							<td style="text-align: left; font-size: 14px;"><input style="font-size: 14px; border-bottom: none;" type="text" value="${indentation}&nbsp;&nbsp;&nbsp;작성자: ${dto.writer }&nbsp;&nbsp;&nbsp;작성일: ${dto.writedate }" readonly="readonly"></td>
						</tr>
						<tr>
							<td style="text-align: left;"><input style="font-size: 17px; border-top: none;" type="text" readonly="readonly" value=" ${indentation1}&nbsp;&nbsp;${dto.comments}&nbsp;&nbsp;&nbsp;&nbsp;"> <input type="button" class="comment-button" value="댓글"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>


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