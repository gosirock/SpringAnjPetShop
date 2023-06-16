<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰 게시판</title>

<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="CSS/O_NBoardStyle.css">
<link rel="stylesheet" href="CSS/O_PageStyle.css">
<link rel="stylesheet" href="CSS/O_Common.css">
<link rel="stylesheet" href="CSS/O_RBoardStyle.css">
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
	<div class="page-title">
		<br> <br> <br>
		<h3>COMMUNITY</h3>
		<br> <br> <a href="O_adminNotice.do">NOTICE</a>
		<a href="O_adminFAQ.do">FAQ</a>
		<a href="O_adminQNA.do">Q&A</a>
		<span class="selected"><a href="O_adminReview.do">REVIEW</a></span>
		<br> <br>
	</div>

	<div class="page-title">
		<h4>리뷰 게시판</h4>
	</div>
	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="O_adminReview.do" method="post">
					<div class="search-wrap">
						<select name="query">
							<option value="r_title">제목</option>
							<option value="userid">작성자</option>
						</select> <input id="search" type="search" name="content" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<br><br><br>
	<!-- board list area -->
	<div class="container">
		<div class="review-grid">
			<c:forEach items="${reviewList}" var="dto">
				<div class="product-item">
					<a href="O_adminRDetail.do?seq=${dto.seq }"><img src="images/review/${dto.filename }.png" alt="이미지 준비 중"></a>
					<!-- 제목 길이가 13자 이상이면 ...으로 표시 -->
					<c:set var="trimedTitle" value="${dto.r_title}" />
					<c:if test="${fn:length(trimedTitle) > 13}">
						<c:set var="trimedTitle" value="${fn:substring(trimedTitle, 0, 13)}..." />
					</c:if>
					<h5>
						<a href="O_RDetail.do?seq=${dto.seq }">${trimedTitle}</a>
					</h5>
					<c:set var="maskedUserId" value="${fn:substring(dto.userid, 0, 3)}***" />
					<p>작성자 : ${maskedUserId}</p>
					<p>작성일 : ${dto.writedate}</p>
				</div>
			</c:forEach>
		</div>
	</div>

	<br><br><br>
	<div class="container pagination" style="text-align: center;">
		<script>
    let pageSize = ${p.pageSize}; // 한 페이지당 보여줄 최대 페이지 개수
    let itemsPerPage = ${p.itemsPerPage}; // 한 페이지당 보여줄 게시물의 수
    let totalCount = ${p.totalCount}; // 전체 게시물의 수
    let currentPage = ${p.currentPage}; // 현재 페이지
    let totalPages = ${p.totalPages}; // 전체 페이지의 수
    let calcPage = Math.floor((currentPage - 1) / pageSize) * pageSize + 1; // 현재 페이지에서 보여질 페이지의 시작값 계산

    // query가 null일 때 query를 n_content로 설정
    let query = "${query}";
    if (!query) {
      query = "r_title";
    }

    // 이전 버튼
    if (currentPage > 1) {
      document.write('<span><a href="O_adminReview.do?page=' + 1 + '&query=' + query + '&content=${content}"><<</a></span>');
      document.write('<span><a href="O_adminReview.do?page=' + (currentPage - 1) + '&query=' + query + '&content=${content}"><</a></span>');
    } else {
      document.write('<span class="empty"><a><<</a></span>');
      document.write('<span class="empty"><a><</a></span>');
    }

    // 페이지 번호
    if (totalPages != 1) {
      let numPagesToShow = Math.min(pageSize, totalPages); // 보여줄 페이지 번호 개수 (pageSize와 totalPages 중 작은 값 선택)
      let startPage = calcPage; // 시작 페이지

      // 시작 페이지 조정
      if (startPage + numPagesToShow - 1 > totalPages) {
        startPage = Math.max(totalPages - numPagesToShow + 1, 1);
      }

      for (let i = startPage; i <= startPage + numPagesToShow - 1; i++) {
        if (i === currentPage) {
          document.write('<span class="current"><a href="O_adminReview.do?page=' + i + '&query=' + query + '&content=${content}">' + i + '</a></span>');
        } else {
          document.write('<span><a href="O_adminReview.do?page=' + i + '&query=' + query + '&content=${content}">' + i + '</a></span>');
        }
      }
    }

    // 다음 버튼
    if (currentPage != totalPages && totalPages != 1) {
      document.write('<span><a href="O_adminReview.do?page=' + (currentPage + 1) + '&query=' + query + '&content=${content}">></a><span>');
      document.write('<span><a href="O_adminReview.do?page=' + totalPages + '&query=' + query + '&content=${content}">>></a><span>');
    } else {
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