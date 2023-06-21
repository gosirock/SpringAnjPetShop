<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>어제보다 더 나은, ANJ Shop</title>
<link rel="stylesheet" href="CSS/J_userProfilePage.css">

	<!-- 주소api -->
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="J_userProfile.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							//document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							//document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
		document.getElementById("sample6_detailAddress").placeholder = ""; // 상세주소 필드 초기화
		document.getElementById("sample6_detailAddress").focus(); // 상세주소 필드에 포커스를 준다
	}
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
										    <li><button class="btn-login btn-dog" onclick="location.href='j_userPage.do'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>







	<main class="main">
	
		<h1 id="pageTitle">${userView.username }님의 정보</h1><br/>
		
		<hr>
		<form name="form1">
		<table id="userInfo">
			<tr>
				<td id="userid" style="background-color: #FFFFF0;"> 아이디  &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text" name="userid" id="tfUserid" value="${userView.userid }" maxlength="15" readonly="readonly" disabled="disabled" >&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td id="username"> 성함  &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text" id="tfUserName" value="${userView.username }" maxlength="15" readonly="readonly" disabled="disabled">&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td id="useraddress"> 배송지 주소  &nbsp;&nbsp;</td>
				<td style="padding: 18px;">
					<input type="text" id="sample6_postcode" value="${userView.userpostcode }" readonly="readonly" name="userpostcode" style="padding: 10px">
					<input type="button" onclick="sample6_execDaumPostcode()" style="font-size: 20px" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" value="${userView.useraddress }" readonly="readonly" name="useraddress">
					 기본 주소<br> 
					<input type="text"	id="sample6_detailAddress" value="${userView.userdetailaddress }" readonly="readonly" name="userdetailaddress">
					 나머지 주소 <br>
				</td>
			</tr>
			<tr>
				<td id="usertel"> 휴대전화  &nbsp;&nbsp;</td>
				<td> &nbsp;&nbsp;
					<input type="text" size="20" name="usertel" id="tfUserTel" value="${userView.usertel }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td id="useremail"> 이메일  &nbsp;&nbsp;</td>
				<td> &nbsp;&nbsp;
					<input type="text" size="30" name="useremail" id="tfUserEmail" value="${userView.useremail }" readonly="readonly">
				</td>
			</tr>
		</table><br/><br/>
		
		<!-- <form action="modifyUser" id="updateForm">
			<input type="submit" id="btnUpdate" value="회원정보 수정">&nbsp;&nbsp;
		</form> 
		
		<form action="j_userUpdateCancel.do"> 		취소버튼 클릭시 메인페이지로 보내기
			<input type="submit" id="btnCancel" value="취소">  <br/>
		</form>
		
		<form id="deleteForm" action="deleteUser">
			<input type="submit" id="btnDelete" value="회원 탈퇴">
		</form> -->
		
			<div id="buttons">
				<input type="button" value="뒤로 가기" id="btnBack" style="display: inline-block;">&nbsp;&nbsp;
				<input type="button" value="회원 정보 수정" id="btnUpdate" style="display: inline-block;">&nbsp;&nbsp;
				<input type="button" value="홈화면" id="btnHome" style="display: inline-block;">
			</div>
		</form>
		
		<div id="checkPwModal" class="modal" style="display: none;">
			<div class="modal-content">
				<h3>고객님의 개인정보 보호를 위해 비밀번호를 입력해주세요.</h3><br>
				<input type="password" id="inputPw" size="35" style="height: 40px; " placeholder=" 비밀번호를 입력해 주세요"> <br><br>
				<span id="message"></span> <br><br>
				<button id="btnPwSubmit">확인</button> &nbsp;&nbsp;
				<button id="btnPwCancel">취소</button> <br>
			</div>
		</div>
		
		<script type="text/javascript" >
			var btnUpdate = document.getElementById("btnUpdate");
			var btnBack = document.getElementById("btnBack");
			var btnHome = document.getElementById("btnHome");
			var checkPwModal = document.getElementById("checkPwModal");
			var btnPwCancel = document.getElementById("btnPwCancel")/* [0] */;
			var btnPwSubmit = document.getElementById("btnPwSubmit");
			var message = document.getElementById("message");
			
			btnUpdate.onclick = function() {
				btnUpdate.style.display = "none";
				btnBack.style.display = "none";
				btnHome.style.display = "none";
				checkPwModal.style.display = "block";
				
				btnPwCancel.onclick = function() {
					checkPwModal.style.display = "none";
					btnUpdate.style.display = "inline-block";
					btnBack.style.display = "inline-block";
					btnHome.style.display = "inline-block";
					inputPw.value = "";
					message.textContent = "";
				}

				btnPwSubmit.onclick = function() {
					var inputPw = document.getElementById("inputPw").value;
					if (inputPw === "${userView.userpasswd}") {
						document.form1.action = "/sendToModifyPage"
						document.form1.submit();
					} else if (inputPw ==="") {
						message.textContent = "비밀번호를 입력해 주세요."
					} else {
						message.textContent = "비밀번호가 일치하지 않습니다."
					}
				}
			}
			
			btnBack.onclick = function() {
				document.form1.action = "/j_userPage"
				document.form1.submit();
			}
			
			btnHome.onclick = function() {
				document.form1.action = "/A_MainView"
				document.form1.submit();
			}
			
			btnPwCancel.onclick = function() {
				checkPwModal.style.display = "none";
				btnUpdate.style.display = "inline-block";
				btnBack.style.display = "inline-block";
				btnHome.style.display = "inline-block";
			}
			
		</script>
	
		
	
	
	
	</main>
	<footer>
            <ul>
                <li><a href="#">Brand Story</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
            
                <p>
                    <strong>Corporation ANJ.industry</strong>
                    <br>
                    Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy)
                    <br>
                    CEO: Ahn Jae-won
                    <br>   
					Business registration number: 240-81-87676 Business information confirmation
                    <br>
                    Mail-order business report: Gangnam 10238 Fax: 02-000-1234
                </p>
                <p>
                    <strong>customer service center</strong>
                    <br>
                    Tel : Representative number 1234-5678 (Weekdays 09:00~18:00)
                    <br>
                    Dedicated to the future: 1522-5700 (365 days 09:00-18:00)
                    <br>
                    Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy)
                    <br>
                    Fax : 02-000-1234 | Mail : ajw0376@gmail.com
                    <br>
                </p>   
            </div>
        </footer>
</body>
</html>