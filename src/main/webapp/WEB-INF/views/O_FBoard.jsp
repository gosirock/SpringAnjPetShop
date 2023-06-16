<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="CSS/O_FBoardStyle.css">
<link rel="stylesheet" href="CSS/O_NBoardStyle.css">
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="CSS/O_PageStyle.css">
<link rel="stylesheet" href="CSS/O_Common.css">
<script src="JS/O_ScrollTop.js"></script>

<script type="text/javascript">
	function writeCheck(){
		const form = document.writeFAQ
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
		form.action = "O_WriteFAQ.do";
		document.productinfo.submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".hidden_row").hide(); // 페이지 로드 시 숨겨진 행 숨기기
		$(".toggle-icon").text("+"); // 초기에 토글 아이콘 "+"로 표시
	});

	function showHiddenRow(row) {
		let $targetRow = $("#" + row);
		let $toggleIcon = $targetRow.prev("tr").find(".toggle-icon");

		if ($targetRow.is(":visible")) {
			$targetRow.hide();
			$toggleIcon.text("+");
		} else {
			$(".hidden_row").hide();
			$(".toggle-icon").text("+");
			$targetRow.show();
			$toggleIcon.text("-");
		}
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
<!-- <script type="text/javascript">
	function setTitleAndContent(SelectedSeq){
		var FAQList = ${FAQList};
		var seq = SelectedSeq;
		const selectedDto = FAQList.find(dto => dto.seq === seq);
		
		const n_title = selectedDto.n_title;
		const n_content = selectedDto.n_content;
		
		var n_titleInput = document.getElementById("n_title");
	    var n_contentTextarea = document.getElementById("n_content");
	    
	    n_titleInput.removeAttribute("readonly");
		n_titleInput.value = n_title;
		n_contentTextarea.removeAttribute("readonly");
		n_contentTextarea.value = n_content;
		
	}
</script> -->
</head>
<body>
<!------------------------- /header ---------------------------------->
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
<!------------------------- /header ---------------------------------->
<!------------------------- body ---------------------------------->

	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<a href="O_Notice.do">NOTICE</a> 
			<span class="selected"><a href="O_FAQ.do">FAQ</a></span>
			<a href="O_QNA.do">Q&A</a> 
			<a href="O_Review.do">REVIEW</a> 
		<br><br>
	</div>
	
	<div class="page-title">
		<h4>FAQ 목록</h4>
	</div>
	
	<!-- board list area -->
	<div class="container">
		<table class="board-table">
			<thead>
				<tr>
					<th scope="col" colspan="1">내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${FAQList}" var="dto">
					<!-- 제목 클릭 시 hidden_row 토글 -->
					<tr class="tr-background" onclick="showHiddenRow('row_${dto.seq}');">
						<td class="custom-padding th-left" data-padding="20">${dto.n_title}
							<span class="toggle-icon-wrapper">
								<span class="toggle-icon" style="float: right;"></span>
							</span>
						</td>
					</tr>
					<!-- id를 게시글의 seq로 부여 -->
					<tr id="row_${dto.seq}" class="hidden_row">
						<td class="custom-padding th-left" data-padding="60"><pre>${dto.n_content}</pre></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br><br>
	</div>
	
	<button class="top-button" onclick="scrollToTop()">top</button>
	<!------------------------- /body ---------------------------------->
	<!------------------------- footer ---------------------------------->
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
	<!------------------------- /footer ---------------------------------->
</body>
</html>