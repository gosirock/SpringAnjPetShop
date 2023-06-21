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
<script src="JS/O_ScrollTop.js"></script>
</head>
<script type="text/javascript">
	function updateCheck(){
		const form = document.QnaDetail
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
		
		if(confirm("수정하시겠습니까?") == true){
		form.action = "O_updateQnAForAdmin";
		form.submit();
		}
	}
	
	function deleteCheck(){
		const form = document.QnaDetail
		const seq = form.seq.value
		const parentseq = form.parentseq.value
		let result = 0
		
		if (seq == parentseq){ // 질문글일때
			result = 1
		}else{ // 답변글일때
			result = 2
		}
		
		if(result == 1){
			if(confirm("정말 삭제하시겠습니까?") == true){
				form.action = "O_deleteQuestionForAdmin?seq=" + seq;
				form.submit();
			}
		}
		
		if(result == 2){
			if(confirm("정말 삭제하시겠습니까?") == true){
				form.action = "O_deleteAnswer?seq=" + seq;
				form.submit();
			}
		}
	}
	
	function writeAction(){
		const form = document.QnaDetail
		const seq = form.seq.value
		form.action = "O_writeAnswerView?seq=" + seq;
		form.submit();
		}
</script>
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
					      <li><a href="O_adminNotice">게시판 관리</a>
					      	
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
	<!-- ---------------------- -->
	<div class="page-title">
		<br><br><br>
		<h3>COMMUNITY</h3>
		<br><br>
			<a href="O_adminNotice">NOTICE</a>
			<a href="O_adminFAQ">FAQ</a> 
			<span class="selected"><a href="O_adminQnA">Q&A</a></span>
			<a href="O_adminReview">REVIEW</a>
		<br><br>
	</div>
	<div class="page-title">
		<h4>QnA 상세</h4>
	</div>

	<!-- board list area -->
	<div class="container">
		<form name="QnaDetail" method="post"> <!-- 유저용에서는 이 폼태그 빼고 제목을 input타입 빼고 그냥 적기, textarea readonly 속성 넣어주기 -->
			<input type="hidden" name="status" value="1">
			<input type="hidden" name="seq" value="${qDetail.seq }">
			<input type="hidden" name="parentseq" value="${qDetail.parentseq}">
			<table class="board-table">
				<thead>
					<tr>
						<th class="th-wnum">제목</th>
						<th scope="col" colspan="3">
							<c:choose>
								<c:when test="${qDetail.seq == qDetail.parentseq}">
									<input type="text" name="qna_title"
										value="${qDetail.qna_title}" readonly="readonly">
								</c:when>
								<c:otherwise>
									<input type="text" name="qna_title"
										value="${qDetail.qna_title}">
								</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="th-wnum">구분</td>
						<td scope="col" class="th-left">${qDetail.category }</td>
					</tr>
					<tr>
						<td scope="col" class="th-wnum">작성일</td>
						<td scope="col" class="th-left">${qDetail.writedate}</td>
					</tr>
					<tr>
						<td scope="col" class="th-wnum">작성자</td>
						<td scope="col" class="th-left">
							<c:choose>
								<c:when test="${qDetail.seq == qDetail.parentseq}">
									${qDetail.userid}
								</c:when>
								<c:otherwise>
									관리자
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<c:choose>
								<c:when test="${qDetail.seq == qDetail.parentseq}">
									<textarea rows="25" cols="109" wrap="hard" name="qna_content" readonly="readonly"><c:out value="${qDetail.qna_content}" /></textarea>
								</c:when>
								<c:otherwise>
									<textarea rows="25" cols="109" wrap="hard" name="qna_content"><c:out value="${qDetail.qna_content}" /></textarea>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="th-wnum"><span class="list-button"><a href="O_adminQnA">목록</a></span></td>
						<td class="th-right">
							<c:if test="${qDetail.seq != qDetail.parentseq}"> <!-- 관리자는 답변글만 수정할 수 있음 -->
            					<input type="button" class="list-button" value="수정" onclick="updateCheck()">
        					</c:if>
							
							<input type="button" class="list-button" value="삭제" onclick="deleteCheck()"> <!-- 삭제는 질문글 & 답변 글 모두 가능 -->
							<c:if test="${qDetail.seq == qDetail.parentseq}"> <!-- 질문글에만 답변을 달 수 있음 -->
            					<input type="button" class="list-button" value="답변달기" onclick="writeAction()">
        					</c:if>
						</td>
					</tr>
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