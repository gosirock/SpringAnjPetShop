<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script src="JS/O_ScrollTop.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
	
	$(document).ready(function() {
		$(".hidden_row").hide(); // 페이지 로드 시 숨겨진 행 숨기기
	});

	function showHiddenRow(row) {
		let $targetRow = $("#" + row);
		let $toggleIcon = $targetRow.prev("tr").find(".toggle-icon");

		if ($targetRow.is(":visible")) {
			$targetRow.hide();
		} else {
			$(".hidden_row").hide();
			$targetRow.show();
		}
	}

	function reply(c_seq){
		const form = document.forms["comment" + c_seq];
		var seq = form.seq.value;
		var c_seq = form.c_seq.value;
		var rootseq = form.rootseq.value;
		var ref = form.ref.value;
		var step = form.step.value;
		var reforder = form.reforder.value;
		var parentseq = form.parentseq.value;
		var writer = form.writer.value;
		var comments = form.comments.value;
		
		console.log("step: ", step)
		console.log("c_seq: ", c_seq)
		console.log("rootseq: ", rootseq)
		console.log("ref: ", ref)
		console.log("step: ", step)
		console.log("reforder: ", reforder)
		console.log("parentseq: ", parentseq)
		console.log("writer: ", writer)
		console.log("comments: ", comments)
		
		form.action = "writeComment?seq="+seq+"&c_seq="+c_seq+"&rootseq="+rootseq+"&comments="+comments+"&ref="+ref
									+"&step="+step+"&reforder="+reforder+"&parentseq="+parentseq+"&writer="+writer
									
		form.submit();
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
					</ul></li>
				<li><a href="W_UserList.jsp">회원 관리</a></li>
				<li><a href="O_adminNotice">게시판 관리</a></li>
				<li><a href="W_SalesDaily.jsp">매출현황</a>
					<ul>
						<li><a href="W_SalesDaily.jsp">일별 매출</a></li>
						<li><a href="W_SalesMonthly.jsp">월별 매출</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
	<!-- ---------------------- -->
	<div class="page-title">
		<br> <br> <br>
		<h3>COMMUNITY</h3>
		<br> <br> <a href="O_adminNotice">NOTICE</a> <a
			href="O_adminFAQ">FAQ</a> <a href="O_adminQnA">Q&A</a> <span
			class="selected"><a href="O_adminReview">REVIEW</a></span> <br>
		<br>
	</div>
	<div class="page-title">
		<h4>리뷰 상세페이지</h4>
	</div>

	<div class="container">
		<img src="images/review/${rDetail.filename }.png" alt="이미지 준비중"
			style="width: 25%; height: 25%;">
	</div>
	<!-- board list area -->
	<div class="container">
		<form name="RDetail" method="post">
			<!-- 유저용에서는 이 폼태그 빼고 제목을 input타입 빼고 그냥 적기, textarea readonly 속성 넣어주기 -->
			<input type="hidden" name="userid" value="${sessionScope.USERID}">
			<!-- 나중에는 로그인 아이디 세션 받아서 수정하기 -->
			<input type="hidden" name="seq" value="${seq }">
			<table class="board-table">
				<thead>
					<tr>
						<th class="th-wwnum">제목</th>
						<th scope="col"><input type="text" readonly="readonly"
							name="r_title" value="${rDetail.r_title}"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:set var="maskedUserId"
							value="${fn:substring(rDetail.userid, 0, 3)}***" />
						<td class="th-wnum">작성자</td>
						<td scope="col" class="th-left">${maskedUserId }</td>
					</tr>
					<tr>
						<td class="th-wnum">상품<br>설명
						</td>
						<td scope="col" class="th-left" align="left"><img
							src="images/thumbnail/${rDetail.pthumbnail}.png"
							style="width: 8%; float: left;" alt="Product Thumbnail"> <br>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${rDetail.pname }</td>
					</tr>
					<tr>
						<td scope="col" class="th-wnum">작성일</td>
						<td scope="col" class="th-left">${rDetail.writedate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea readonly="readonly" rows="20" cols="109"
								wrap="hard" name="n_content"><c:out
									value="${rDetail.r_content}" /></textarea></td>
					</tr>
					<tr>
						<td class="th-wnum"><span class="list-button"><a
								href="O_adminReview">목록</a></span></td>
						<td class="th-right"><input type="submit" class="list-button"
							value="수정" onclick="updateCheck()"> <input type="submit"
							class="list-button" value="삭제" onclick="deleteCheck()"></td>
					</tr>
				</tbody>
			</table>
		</form>
		<form action="O_adminWriteParentComment">
			<input type="hidden" name="userid" value="관리자"> <input
				type="hidden" name="seq" value="${seq }">
			<table class="board-table">
				<thead>
					<tr>
						<th class="th-id">관리자</th>
						<th scope="col" colspan="3"><span class="comment"><input
								type="text" name="comment" placeholder="댓글을 입력하세요."></span></th>
						<th><input class="comment-cancel-button" type="reset" value="취소"></th>
						<th><input class="comment-write-button" type="submit" value="댓글"></th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
	<!-- 댓글 -------------------------------------------------------------------------->
	<div class="container">
		<table>
			<tbody>
				<c:forEach items="${commentList}" var="dto">
					<!-- isdelete가 1이면 삭제된 댓글이라고 보여주기 위한 작업 -->
					<form name="comment${dto.c_seq }" method="post">
						<input type="hidden" name="c_seq" value="${dto.c_seq }">
						<input type="hidden" name="rootseq" value="${dto.rootseq }">
						<input type="hidden" name="ref" value="${dto.ref }">
						<input type="hidden" name="step" value="${dto.step }">
						<input type="hidden" name="reforder" value="${dto.reforder }">
						<input type="hidden" name="answernum" value="${dto.answernum }">
						<input type="hidden" name="parentseq" value="${dto.parentseq }">
						<input type="hidden" name="writer" value="관리자">
						<input type="hidden" name="seq" value="${seq }">
						<c:set var="indentationSize" value="12" />
						<!-- 들여쓰기 사이즈 -->
						<c:set var="indentation" value="&nbsp;" />
						<c:forEach begin="1" end="${dto.step * indentationSize}" var="i">
							<!-- step만큼 들여쓰기 반복 -->
							<c:set var="indentation" value="${indentation}&nbsp;" />
						</c:forEach>
						<c:set var="indentation1Size" value="10" />
						<c:set var="indentation1" value="&nbsp;" />
						<c:forEach begin="1" end="${dto.step * indentation1Size}" var="i">
							<c:set var="indentation1" value="${indentation1}&nbsp;" />
						</c:forEach>
					<tr>
						<td style="text-align: left; font-size: 14px;" colspan="3"><c:choose>
								<c:when test="${dto.writer eq '관리자'}">
									<input
										style="font-size: 14px; font-weight: bold; border-bottom: none;"
										type="text"
										value="${indentation}&nbsp;&nbsp;&nbsp;작성자:${dto.writer}&nbsp;&nbsp;&nbsp;작성일: ${dto.writedate }"
										readonly="readonly">
								</c:when>
								<c:otherwise>
									<input style="font-size: 14px; border-bottom: none;"
										type="text"
										value="${indentation}&nbsp;&nbsp;&nbsp;작성자:${dto.writer}&nbsp;&nbsp;&nbsp;작성일: ${dto.writedate }"
										readonly="readonly">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td style="text-align: left;" colspan="3">
							<c:choose>
								<c:when test="${dto.writer eq '관리자'}">
									<input
										style="font-size: 17px; font-weight: bold; border-top: none;"
										type="text" readonly="readonly"
										value=" ${indentation1}&nbsp;&nbsp;${dto.comments}&nbsp;&nbsp;&nbsp;&nbsp;">
								</c:when>
								<c:otherwise>
									<input style="font-size: 17px; border-top: none;" type="text"
										readonly="readonly"
										value=" ${indentation1}&nbsp;&nbsp;${dto.comments}&nbsp;&nbsp;&nbsp;&nbsp;">
								</c:otherwise>
							</c:choose>
							<input type="button" value="+" onclick="showHiddenRow('row_${dto.c_seq}');">
						</td>
					</tr>
					<tr id="row_${dto.c_seq}" class="hidden_row">
						<td scope="col"><input type="text" name="comments" placeholder="답글 추가..."></td>
						<td><input class="comment-cancel-button" type="reset" style="text-align: right;" value="취소"></td>
						<td><input class="comment-write-button" type="button" style="text-align: right;" value="답글" onclick="reply('${dto.c_seq}')"></td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
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