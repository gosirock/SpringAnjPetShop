<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>어제보다 더 나은, ANJ Shop</title>
<link rel="stylesheet" href="J_userProfilePage.css">
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
	
	
	
	/* 이메일 입력받기 */
	function selectedEmail(){
		var emailDomain = document.getElementById("domainSelect");
		var customDomain = document.getElementById("customDomain");
		
		if(emailDomain.value === "custom") {
			customDomain.value = null ;
			customDomain.readOnly = false ;
		
		} else {
			customDomain.value = emailDomain.value;
			customDomain.readOnly = true ;
			
		} 
	}
	
	// 비밀번호 확인 칸에 입력할 때마다 일치 여부를 확인하는 함수
	function checkPasswordMatch() {
	  var password = document.getElementById("pfUserpw").value; // 비밀번호 입력 값
	  var confirmPassword = document.getElementById("pfUserpw1").value; // 비밀번호 확인 입력 값
	  var passwordMatchLabel = document.getElementById("passwordMatch"); // 일치 여부를 표시할 <span> 요소

	  if (password === confirmPassword) {
	    passwordMatchLabel.textContent = "일치합니다.";
	    passwordMatchLabel.style.color = "green";
	  } else if ((confirmPassword === "")) {
		  passwordMatchLabel.textContent = "";
	  }
	  	else {
	    passwordMatchLabel.textContent = "일치하지 않습니다.";
	    passwordMatchLabel.style.color = "red";
	  }
	}
/* 
	// 비밀번호 확인 칸의 입력 이벤트에 checkPasswordMatch 함수를 연결
	document.getElementById("pfUserpw1").addEventListener("input", checkPasswordMatch);

	function clearField('tfuserPhone2')) {
		  document.getElementById('tfuserPhone2')).value = '';
		}
	 */

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
	
		<h1 id="pageTitle">회원 정보 수정</h1><br/>
		<div id="requiredInfo">
			<p style="font-size: 20px; text-align: left;">기본 정보</p>
			<p style="font-size: 15px; text-align: right;">* 표시는 필수 입력 사항</p>
		</div>
		
		<form action="j_userUpdate.do" id="updateForm">
		<hr>
		<table id="userInfoUpdate">
			<tr>
				<td id="infoUpdate" style="background-color: #FFFFF0;"> 아이디 <sup>*</sup> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text" name="userid" id="tfUserid" value="${userView.userid }" maxlength="15" readonly="readonly" disabled="disabled" >&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td id="infoUpdate" style="background-color: #FFFFF0;"> 비밀번호 <sup>*</sup> &nbsp;&nbsp; </td>
				<td>&nbsp;&nbsp;<input type="password" name="userpasswd" id="pfUserpw" maxlength="30" onkeyup="checkPasswordMatch();">&nbsp;&nbsp; (영문, 숫자 포함 8 ~ 16 글자)</td>
			</tr>
			<tr>
				<td id="infoUpdate"> 비밀번호 확인 <sup>*</sup> &nbsp;&nbsp; </td>
				<td>&nbsp;&nbsp;<input type="password" id="pfUserpw1" maxlength="30" onkeyup="checkPasswordMatch();">&nbsp;&nbsp;<span id="passwordMatch"></span> </td>
			</tr>
			<tr>
				<td id="infoUpdate"> 이름 <sup>*</sup> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text" id="pfUserpw" value="${userView.username }" maxlength="15" readonly="readonly" disabled="disabled">&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td id="infoUpdate"> 배송지 주소  &nbsp;&nbsp;</td>
				<td style="padding: 18px;">
					<input type="text" id="sample6_postcode" value="${userView.userpostcode }" readonly="readonly" name="userpostcode">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" value="${userView.useraddress }" readonly="readonly" name="useraddress">
					 기본 주소<br> 
					<input type="text"	id="sample6_detailAddress" value="${userView.userdetailaddress }" name="userdetailaddress">
					 나머지 주소 (선택 입력 가능)<br>
					<p style="font-size: 12px; text-align: left;"> ※ 상세주소(아파트 동, 호수) 꼭 기재 부탁드립니다.</p> 
				</td>
			</tr>
			<tr>
				<td id="infoUpdate"> 휴대전화 <sup>*</sup> &nbsp;&nbsp;</td>
				<td> &nbsp;&nbsp;
					<select name="phone1" id="tfUserPhone1" >
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> - <input type="text" maxlength="4" size="4" name="phone2" id="tfUserPhone2" onfocus="clearField('tfuserPhone2')">
					- <input type="text" maxlength="4" size="4" name="phone3" id="tfUserPhone3" onfocus="clearField('tfuserPhone3')">
				</td>
			</tr>
			<tr>
				<td id="infoUpdate"> 이메일 <sup>*</sup> &nbsp;&nbsp;</td>
				<td>
					<input type="text" name="useremail" id="inputEmail" onfocus="clearField('inputEmail')">
					@<input type="text" name="userdomain" id="customDomain" onfocus="clearField('customDomain')" >
					<select id="domainSelect"  onchange="selectedEmail()">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="custom" selected="selected" >직접입력</option>
					</select>	
				</td>
			</tr>
		</table><br/>
		<input type="submit" id="btnUpdateInfo" value="회원정보 수정">&nbsp;&nbsp;
		</form>
		
		<form action="j_userUpdateCancel.do"> 		<!-- 취소버튼 클릭시 메인페이지로 보내기 -->
			<input type="submit" id="btnCancel" value="취소">  <br/>
		</form>
		
		<form id="deleteForm" action="j_userDelete.do">
			<input type="submit" id="btnDeleteInfo" value="회원 탈퇴">
		</form>
	
		
	
	
	
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
	
	
	
<script type="text/javascript">
/* 이메일 초기값 띄우기 */
var email = '${userView.useremail}';

var parts = email.split('@');
var useremail = parts[0];
var userdomain = parts[1];

document.getElementById('inputEmail').value = useremail;
document.getElementById('customDomain').value = userdomain;

/* 전화번호 초기값 띄우기*/
var phoneNumber = "${userView.usertel}"; // 데이터베이스에서 불러온 전화번호

var parts = phoneNumber.split('-');
var phone1 = parts[0];
var phone2 = parts[1];
var phone3 = parts[2];

document.getElementById('tfUserPhone1').value = phone1;
document.getElementById('tfUserPhone2').value = phone2;
document.getElementById('tfUserPhone3').value = phone3;


</script>


</body>
<script type="text/javascript">


/* 회원정보 수정시 확인창 띄우기 */
document.getElementById('updateForm').addEventListener('submit', function(e) {
 e.preventDefault(); // 버튼의 기본 동작(폼 전송)을 막습니다.
 

 var confirmation = confirm('회원 정보를 수정하시겠습니까?');
 if (confirmation === true) {
   // 확인 버튼 클릭 시
   alert('회원 정보 수정이 정상적으로 처리되었습니다.');
	this.submit();
 } else {
   // 취소 버튼 클릭 시
   alert('회원 정보 수정이 취소되었습니다.');
   return false;
 }
});

/* 회원 탈퇴 클릭시 경고창 띄우기 */
document.getElementById('deleteForm').addEventListener('submit', function(e) {
 e.preventDefault(); // 버튼의 기본 동작(폼 전송)을 막습니다.
 

 var confirmation = confirm('정말로 회원을 탈퇴하시겠습니까?');
 if (confirmation === true) {
   // 확인 버튼 클릭 시
   alert('회원 탈퇴가 정상적으로 처리되었습니다.');
	this.submit();
 } else {
   // 취소 버튼 클릭 시
   alert('회원 탈퇴가 취소되었습니다.');
   return false;
 }
});


</script>
</html>