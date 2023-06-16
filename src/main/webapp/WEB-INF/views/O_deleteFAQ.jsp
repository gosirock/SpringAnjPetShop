<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ 삭제</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
<!------------------------- /header ---------------------------------->
<!------------------------- /header ---------------------------------->
<!------------------------- body ---------------------------------->

	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<a href="O_adminNotice.do">NOTICE</a> 
			<span class="selected"><a href="O_adminFAQ.do">FAQ</a></span>
			<a href="O_adminQNA.do">Q&A</a> 
			<a href="O_adminReview.do">REVIEW</a> 
		<br><br>
	</div>
	<div class="page-title">
			<a href="O_adminFAQ.do">목록</a> 
			<a href="O_writeViewFAQ.do">등록</a> 
			<a href="O_updateViewFAQ.do">수정</a>
			<a href="O_deleteViewFAQ.do">삭제</a>
	</div>
	
	<!-- board list area -->
	<div class="page-title">
		<h4>FAQ 삭제</h4>
	</div>

	<div class="container">
		<form action="O_changeFAQStatus.do" method="post">
			<input type="hidden" name="status" value="1">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col">
							<div class="qna longSelect">
								<select name="seq">
									<c:forEach items="${FAQList}" var="dto">
										<option value="${dto.seq}">${dto.n_title}</option>
									</c:forEach>
								</select>
							</div>
						</th>
					</tr>
				</thead>
			</table>
			<div class="container" style="text-align: right;">
				<br>
				<input type="submit" class="list-button th-right" value="삭제">
			</div>
		</form>
	</div>
	
	<div class="page-title">
		<h4>삭제된 FAQ 복구</h4>
	</div>

	<div class="container">
		<form action="O_changeFAQStatus.do" method="post">
		<input type="hidden" name="status" value="0">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col">
							<div class="qna longSelect">
								<select name="seq">
									<c:forEach items="${DeletedFAQList}" var="dto">
										<option value="${dto.seq}">${dto.n_title}</option>
									</c:forEach>
								</select>
							</div>
						</th>
					</tr>
				</thead>
			</table>
			<div class="container" style="text-align: right;">
				<br>
				<input type="submit" class="list-button th-right" value="복구">
			</div>
		</form>
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