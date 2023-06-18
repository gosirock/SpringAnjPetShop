<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>

<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="CSS/O_NBoardStyle.css">
<link rel="stylesheet" href="CSS/O_PageStyle.css">
<link rel="stylesheet" href="CSS/O_Common.css">
<script src="JS/O_ScrollTop.js"></script>
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
		<h4>QnA 게시판</h4>
	</div>
	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="O_adminQnA" method="post">
					<div class="search-wrap">
						<select name="query">
							<option value="qna_title">제목</option>
							<option value="qna_content">내용</option>
							<option value="userid">작성자</option>
						</select>
						<input id="search" type="search" name="content" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
	<div class="container">
		<table class="board-table">
			<thead>
				<tr>
					<th scope="col" class="th-num">번호</th>
					<th scope="col" class="th-title">제목</th>
					<th scope="col" class="th-date">작성자</th>
					<th scope="col" class="th-date">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="count" value="${QNAList.size() + 1}" />
				<c:forEach items="${QNAList}" var="dto">
					<c:set var="count" value="${count -1 }" />
					<tr>
						<td>${count}</td>
						<td style="text-align: left;">
							<c:choose>
								<c:when test="${dto.seq == dto.parentseq }">
									<a href="O_adminQDetail?seq=${dto.seq }">[${dto.category}] ${dto.qna_title}</a>
								</c:when>
								<c:otherwise>
									<span class="re-button">re</span> <a href="O_adminQDetail?seq=${dto.seq }" style="font-weight: bold;">${dto.qna_title}</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${dto.seq == dto.parentseq}">
									<c:set var="maskedUserId" value="${fn:substring(dto.userid, 0, 3)}****" />
									${maskedUserId}
								</c:when>
								<c:otherwise><strong>관리자</strong></c:otherwise>
							</c:choose>
						</td>
						<td>${dto.writedate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
	</div>

	<div class="container pagination" style="text-align: center;">
		<script>
    let pageSize = ${p.pageSize}; // 한 페이지당 보여줄 최대 페이지 개수
    let itemsPerPage = ${p.itemsPerPage}; // 한 페이지당 보여줄 게시물의 수
    let totalCount = ${p.totalCount}; // 전체 게시물의 수
    let currentPage = ${p.currentPage}; // 현재 페이지
    let totalPages = ${p.totalPages}; // 전체 페이지의 수
    let calcPage = Math.floor((currentPage - 1) / pageSize) * pageSize + 1; // 현재 페이지에서 보여질 페이지의 시작값 계산
    let nextAndPrev = 1 // 초기화
    
    if((currentPage % pageSize) != 0){ // pageSize 가 5일 때 (1~5페이지에서 다음 버튼 눌렀을 때 6으로 가기위해 계산해주는 페이지 수)
    	nextAndPrev = ((Math.floor(currentPage/pageSize)+1)*pageSize + 1)
    }else{ // 현재 페이지가 pageSize의 배수일 때는 Math.floor 값이 + 1 되므로 예외처리를 해준다.
    	nextAndPrev = currentPage + 1 
    }
    
    // query가 null일 때 query를 n_content로 설정
    let query = "${query}";
    if (!query) {
      query = "userid";
    }

    // 이전 버튼
    if (currentPage > pageSize) {
      document.write('<span><a href="O_adminQnA?page=' + 1 + '&query=' + query + '&content=${content}"><<</a></span>');
      document.write('<span><a href="O_adminQnA?page=' + ((Math.floor(currentPage/pageSize)+1)*pageSize + 1 - (pageSize * 2)) + '&query=' + query + '&content=${content}"><</a></span>');
    } else {
      document.write('<span class="empty"><a><<</a></span>');
      document.write('<span class="empty"><a><</a></span>');
    }

    if (totalPages != 1) { // 페이지 번호
	    for (let i = calcPage; i <= calcPage + pageSize - 1 && i <= totalPages; i++) {
	      if (i === currentPage) {
	    	document.write('<span class="current"><a href="O_adminQnA?page=' + i + '">' + i + '</a></span>');
	      } else {
	        document.write('<span><a href="O_adminQnA?page=' + i + '">' + i + '</a><span>');
	      }
	    }
	  }

    // 다음 버튼
    if ((currentPage != totalPages) && (totalPages != 1) && currentPage <= Math.floor(totalPages/pageSize)*pageSize && nextAndPrev <= totalPages) {
      document.write('<span><a href="O_adminQnA?page=' + nextAndPrev + '&query=' + query + '&content=${content}">></a><span>');
      document.write('<span><a href="O_adminQnA?page=' + totalPages + '&query=' + query + '&content=${content}">>></a><span>');
    }else{
      document.write('<span class="empty"><a>></a><span>');
      document.write('<span class="empty"><a>>></a><span>');
    }
  </script>
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