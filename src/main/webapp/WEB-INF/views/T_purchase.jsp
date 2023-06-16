<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- 쉼표제거할때 쓰는 fn 접두사 -->

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="T_cartCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문/결제</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
//드롭다운 
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
	// 숫자 단위정리
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
	// 페이지 로드 시 총 주문금액 초기화
	window.addEventListener("load", calculateTotalAmount);	
	

	function usermileage() {
		var mileageInput = document.getElementsByName("mileage")[0];
		mileageInput.value = serverData.mileage;
	}

	function submitForm() {
		  var form = document.createElement("form");
		  form.action = "order.do";
		  form.method = "post";

		  var pidInputs = document.getElementsByName("pid");
		  var countInputs = document.getElementsByName("count");
		  var pnameInputs = document.getElementsByName("pname");

		  // 추가 정보 가져오기
		  var usernameInput = document.getElementsByName("username")[0];
		  var userpostcodeInput = document.getElementsByName("userpostcode")[0];
		  var useraddressInput = document.getElementsByName("useraddress")[0];
		  var userdetailaddressInput = document.getElementsByName("userdetailaddress")[0];
		  var phone1Input = document.getElementsByName("phone1")[0];
		  var phone2Input = document.getElementsByName("phone2")[0];
		  var phone3Input = document.getElementsByName("phone3")[0];
		  var useremailInput = document.getElementsByName("useremail")[0];
		  var ordermessageInput = document.getElementsByName("ordermessage")[0];

		  // 추가 정보를 폼 데이터로 추가
		  var usernameHiddenInput = document.createElement("input");
		  usernameHiddenInput.type = "hidden";
		  usernameHiddenInput.name = "username";
		  usernameHiddenInput.value = usernameInput.value;
		  form.appendChild(usernameHiddenInput);

		  var userpostcodeHiddenInput = document.createElement("input");
		  userpostcodeHiddenInput.type = "hidden";
		  userpostcodeHiddenInput.name = "userpostcode";
		  userpostcodeHiddenInput.value = userpostcodeInput.value;
		  form.appendChild(userpostcodeHiddenInput);

		  var useraddressHiddenInput = document.createElement("input");
		  useraddressHiddenInput.type = "hidden";
		  useraddressHiddenInput.name = "useraddress";
		  useraddressHiddenInput.value = useraddressInput.value;
		  form.appendChild(useraddressHiddenInput);

		  var userdetailaddressHiddenInput = document.createElement("input");
		  userdetailaddressHiddenInput.type = "hidden";
		  userdetailaddressHiddenInput.name = "userdetailaddress";
		  userdetailaddressHiddenInput.value = userdetailaddressInput.value;
		  form.appendChild(userdetailaddressHiddenInput);

		  var phone1HiddenInput = document.createElement("input");
		  phone1HiddenInput.type = "hidden";
		  phone1HiddenInput.name = "phone1";
		  phone1HiddenInput.value = phone1Input.value;
		  form.appendChild(phone1HiddenInput);

		  var phone2HiddenInput = document.createElement("input");
		  phone2HiddenInput.type = "hidden";
		  phone2HiddenInput.name = "phone2";
		  phone2HiddenInput.value = phone2Input.value;
		  form.appendChild(phone2HiddenInput);

		  var phone3HiddenInput = document.createElement("input");
		  phone3HiddenInput.type = "hidden";
		  phone3HiddenInput.name = "phone3";
		  phone3HiddenInput.value = phone3Input.value;
		  form.appendChild(phone3HiddenInput);

		  var useremailHiddenInput = document.createElement("input");
		  useremailHiddenInput.type = "hidden";
		  useremailHiddenInput.name = "useremail";
		  useremailHiddenInput.value = useremailInput.value;
		  form.appendChild(useremailHiddenInput);

		  var ordermessageHiddenInput = document.createElement("input");
		  ordermessageHiddenInput.type = "hidden";
		  ordermessageHiddenInput.name = "ordermessage";
		  ordermessageHiddenInput.value = ordermessageInput.value;
		  form.appendChild(ordermessageHiddenInput);

		  var paymentInput = document.querySelector('input[name="payment"]:checked');
		  var paymentValue = paymentInput.value;

		  var paymentHiddenInput = document.createElement("input");
		  paymentHiddenInput.type = "hidden";
		  paymentHiddenInput.name = "payment";
		  paymentHiddenInput.value = paymentValue;
		  form.appendChild(paymentHiddenInput);
		  
		  var usedmileageInput = document.getElementById("mileageInput");
		  var usedmileageValue = usedmileageInput.value.replace(/,/g, ""); // 쉼표 제거

		  var usedmileageHiddenInput = document.createElement("input");
		  usedmileageHiddenInput.type = "hidden";
		  usedmileageHiddenInput.name = "usedmileage";
		  usedmileageHiddenInput.value = usedmileageValue;
		  form.appendChild(usedmileageHiddenInput);
		  
		  //formattedMileage

		  var enterdmileageInput = document.getElementById("formattedMileage");
			var enterdmileageValue = enterdmileageInput.textContent.replace(/,/g, ""); // 쉼표 제거
			
			var enterdmileageHiddenInput = document.createElement("input");
			enterdmileageHiddenInput.type = "hidden";
			enterdmileageHiddenInput.name = "enteredmileage"; // 수정: name을 "enteredmileage"로 변경
			enterdmileageHiddenInput.value = enterdmileageValue;
			form.appendChild(enterdmileageHiddenInput);

		  
		  // pid와 count를 폼 데이터로 추가
		  for (var i = 0; i < pidInputs.length; i++) {
		    var pidInput = document.createElement("input");
		    pidInput.type = "hidden";
		    pidInput.name = "pid";
		    pidInput.value = pidInputs[i].value;
		    form.appendChild(pidInput);

		    var countInput = document.createElement("input");
		    countInput.type = "hidden";
		    countInput.name = "count";
		    countInput.value = countInputs[i].value;
		    form.appendChild(countInput);
		    
		    var pnameInput = document.createElement("input");
		    pnameInput.type = "hidden";
		    pnameInput.name = "pname";
		    pnameInput.value = pnameInputs[i].value;
		    form.appendChild(pnameInput);
		  }

		  document.body.appendChild(form);
		  form.submit();
		}
	
	// 마일리지 넘기기
	/* function usermileage() {
		  var mileageInput = document.getElementById("mileageInput");
		  var mileageValue = mileageInput.value;

		  // mileageValue를 서버로 전송하고 사용할 수 있도록 폼 데이터로 추가합니다.
		  var mileageHiddenInput = document.createElement("input");
		  mileageHiddenInput.type = "hidden";
		  mileageHiddenInput.name = "usedmileage";
		  mileageHiddenInput.value = mileageValue;

		  var form = document.getElementById("orderForm");
		  form.appendChild(mileageHiddenInput);
		} */


	function confirmPurchase() {
		var confirmed = confirm("구매하시겠습니까?");
		if (confirmed) {
			alert("구매가 완료되었습니다.");
			submitForm(); // 구매를 확인한 경우에만 submitForm() 함수 호출
		}
	}

	// 주문 상품 목록의 가격 합계 계산
	var totalAmount = 0;
	var productElements = document.getElementsByClassName("pid");
	var priceElements = document.getElementsByClassName("pprice");
	var countElements = document.getElementsByName("count");

	for (var i = 0; i < productElements.length; i++) {
		var price = parseInt(priceElements[i].innerHTML.replace(/[^0-9]/g, ""));
		var count = parseInt(countElements[i].value);
		totalAmount += price * count;
	}
</script>


	
	<!-- 주소api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
						document.getElementById("sample6_detailAddress").focus();
					}
				}).open();
	}
</script>

<script type="text/javascript">
//서버에서 전달된 JSON 값
// 체크박스 클릭 시 데이터 채우기
var serverData = {
	username : "${delivery_View.username}",
	userpostcode : "${delivery_View.userpostcode}",
	useraddress : "${delivery_View.useraddress}",
	userdetailaddress : "${delivery_View.userdetailaddress}",
	usertel : "${delivery_View.usertel}",
	useremail : "${delivery_View.useremail}",
	mileage : "${delivery_View.mileage}",
	usedmileage : "${delivery_View.usedmileage}"
};



/* fillUserInfo(document.getElementsByName("checkbox")[0]); */

function fillUserInfo(checkbox) {
	var usernameInput = document.getElementsByName("username")[0];
	var userpostcodeInput = document.getElementsByName("userpostcode")[0];
	var useraddressInput = document.getElementsByName("useraddress")[0];
	var userdetailaddressInput = document.getElementsByName("userdetailaddress")[0];
	var usertelInput1 = document.getElementsByName("phone1")[0];
	var usertelInput2 = document.getElementsByName("phone2")[0];
	var usertelInput3 = document.getElementsByName("phone3")[0];
	var useremailInput = document.getElementsByName("useremail")[0];

	if (checkbox.checked) {
		// 체크박스가 선택된 경우 데이터 채우기
		usernameInput.value = serverData.username;
		userpostcodeInput.value = serverData.userpostcode;
		useraddressInput.value = serverData.useraddress;
		userdetailaddressInput.value = serverData.userdetailaddress;
		usertelInput1.value = serverData.usertel.substring(0, 3);
		usertelInput2.value = serverData.usertel.substring(4, 8);
		usertelInput3.value = serverData.usertel.substring(9);
		useremailInput.value = serverData.useremail;
	} else {
		// 체크박스가 선택되지 않은 경우 데이터 비우기
		usernameInput.value = "";
		userpostcodeInput.value = "";
		useraddressInput.value = "";
		userdetailaddressInput.value = "";
		usertelInput1.value = "";
		usertelInput2.value = "";
		usertelInput3.value = "";
		useremailInput.value = "";
	}
}

//페이지 로드 시 자동으로 데이터 비우기
fillUserInfo(document.getElementById("checkboxId"));



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
												<a href="#">BRAND</a>
												<a href="#">Part</a>
											</div>
								</li>
								<li class="main-nav01"><a href="A_ProductView.do">SHOP</a></li>
									<li class="main-nav02 dropdown">
										<a href="#">COMMUNITY</a>
											<div class="dropdown-content">
												<a href="#">review</a>
												<a href="#">Q&A</a>
											<!-- <a href="#">Part</a> -->
											</div>
								</li>
								
								<li class="main-nav04"><a href="#">NOTICE</a></li>         
								<li class="main-nav04"><a href="#">CART</a></li>        
								<li class="right-align" id="loginContainer">
									<li><button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">Login</button></li>
									<li><button class="btn-login btn-dog" onclick="location.href='A_JoinView.jsp'">New</button></li>
									<li><button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">Logout</button></li>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header><br><br> <br> <br><br><br>

	<main class="main">

		<h1
			style="font-family: 'font-family: ' Nanum Pen Script ', cursive; position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); height: 100px; /* 원하는 높이 값으로 변경 */ color: #477a7b;">ORDER</h1>
		<!-- <br> <br> <br> <br> <br> -->
	</main>

	<form id="orderForm" action="order.do" method="post">
		<div style="display: flex; justify-content: center;">
		  <hr style="width: 80%; color: #477a7b; height: 2px;">
		</div>
		<table border="0">
			<tr>
				<td
					style="height: 10px; text-align: left; border-bottom: 1px solid #E8E8E8;; color: #477a7b; border: none;">주문상품<br>
					<br></td>
			</tr>
		</table>
		<c:set var="totalPrice" value="0" />
		<!-- 누적 변수 초기화 -->

		<c:forEach items="${list}" var="dto">
			<table border="0" style="border-top: 1px solid #E8E8E8;">
				<tr>
				<!-- 이미지 -->
					<td style="width: 150px; height: 50px; text-align: left;">
						<img alt="제품 이미지를 준비중 입니다." src="images/thumbnail/${dto.pthumbnail}.png">
					</td>
				<!-- 상품정보 -->	
					<td style="width: 750px; text-align: left;">&emsp;&emsp;
						<span class="pid" style="font-size: 33px;">${dto.pname}</span><br>&emsp;&emsp;
						<span class="pname">${dto.pid}</span><br>&emsp;&emsp;
						<fmt:formatNumber value="${dto.pprice}" pattern="#,##0" />원</td>
							
					<td style="width: 130px;">${dto.count}개</td>
					<td id="total_${dto.pid}" style="width: 100px;"><fmt:formatNumber
							value="${dto.pprice * dto.count}" pattern="#,##0" />원</td>
					<c:set var="totalPrice"
						value="${totalPrice + (dto.pprice * dto.count)}" />
					<!-- 누적 계산 -->
				</tr>
			</table>

			<input type="hidden" name="count" value="${dto.count}">
			<input type="hidden" name="pid" value="${dto.pid}">
			<input type="hidden" name="pname" value="${dto.pname}">
			<input type="hidden" name="userid" value="${sessionScope.USERID}">
		</c:forEach>

		<table border="0">
			<tr>
				<td style="text-align: left;">총 주문금액</td>
				<td style="text-align: right;"><fmt:formatNumber
						value="${totalPrice}" var="formattedPrice" pattern="#,##0" /> <c:out
						value="${formattedPrice}" />원</td>
			</tr>
		</table>
		<br>
	<!-- </form> -->
	<!-- 누적된 값을 출력 -->

	<br>
	<br> 
		<div style="display: flex; justify-content: center;">
	  <hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>

	<!-- 주문자 정보 -->
		<table border="0" id="userDeliveryTable">
			<tr>
				<td
					style="height: 10px; font-size: 15px; text-align: left; color: #477a7b;">배송정보<br>
					<br></td>
			</tr>
			<tr>
				<td style="height: 10px; font-size: 15px; text-align: left;">배송지
					선택 <input type="checkbox" name="checkbox"
					style="position: absolute; left: 350px; background-color: #DFE9E8;"
					onchange="fillUserInfo(this)"> <label for="checkbox"
					style="position: absolute; left: 370px;">회원 정보와 동일</label> <br>
				</td>
			</tr>
			<tr>
				<td
					style="font-size: 15px; order: bottom: 1px solid black; text-align: left;"><p>받으시는
						분</p></td>
				<td>
					<div style="text-align: left;">
						<input type="text" name="username" size="18" dir="ltr"
							style="font-size: 15px; height: 30px; background-color: #DFE9E8; border: none; border-color: white;">
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;"><p>배송지
						주소</p></td>
				<td>
					<div style="text-align: left;">
						<input type="text" id="sample6_postcode" placeholder="우편번호"
							name="userpostcode" readonly 
							style="height: 30px; background-color: #DFE9E8; border-color: white; border-color: white;">
						<input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기"
							style="height: 30px; background-color: #477a7b; border: none; color: white;"><br>
						<input type="text" id="sample6_address" placeholder="주소"
							name="useraddress" readonly
							style="height: 30px; background-color: #DFE9E8; border-color: white;"
							size="50"><br> <input type="text"
							id="sample6_detailAddress" placeholder="상세주소"
							name="userdetailaddress"
							style="height: 30px; background-color: #DFE9E8; border-color: white;"
							size="50"><br>
						<p style="font-size: 7px; text-align: left;">※상세주소(아파트 동, 호수)꼭
							기재 부탁드립니다.</p>
					</div>
				</td>
			</tr>
			<tr>
				<td
					style="font-size: 15px; order: bottom: 1px solid black; text-align: left;"><p>휴대전화</p></td>
				<td>
					<div style="text-align: left;">
						<select name="phone1"
							style="height: 30px; background-color: #DFE9E8; border-color: white;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> - <input type="text" maxlength="4" size="4" name="phone2"
							style="height: 30px; background-color: #DFE9E8; border: none;">
						- <input type="text" maxlength="4" size="4" name="phone3"
							style="height: 30px; background-color: #DFE9E8; border: none;">
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;"><p>이메일</p></td>
				<td>
					<div style="text-align: left;">
						<input type="text" name="useremail" size="50"
							style="height: 30px; font-size: 15px; background-color: #DFE9E8; border: none;"><br>
						<p style="font-size: 7px; text-align: left;">
							※이메일을 통해 주문처리과정을 보내드립니다.<br>
						</p>
						<p style="font-size: 7px; text-align: left;">※이메일 주소란에는 반드시
							수신가능한 이메일주소를 입력해 주세요</p>
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;"><p>배송
						메세지</p></td>
				<td>
					<div style="text-align: left;">
						<textarea rows="5" cols="50" name="ordermessage"
							style="font-size: 15px; background-color: #DFE9E8; border: none;"></textarea>
					</div>
				</td>
			</tr>
		</table>
		<br>


	<div style="display: flex; justify-content: center;">
	  <hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>
	<!-- <form action="order.do" method="get"> -->
		<table border="0">
			<tr>
				<td colspan="2"
					style="height: 10px; font-size: 15px; text-align: left; color: #477a7b;">결제예정금액<br>
				<br></td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;">주문
					금액</td>
				<td style="text-align: right;">
				<%-- <fmt:formatNumber value="${totalPrice}" var="formattedPrice" pattern="#,##0" /> --%>
				<c:out value="${formattedPrice}" />원
				<br><br>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;">마일리지</td>
				
				<td style="text-align: right;">
						적립 예정 마일리지 <span id="formattedMileage"></span>원


    <br>보유 <fmt:formatNumber value="${delivery_View.mileage}" pattern="#,##0" />원<br>
    <input type="text" name="mileage" id="mileageInput" size="20" dir="ltr" style="font-size: 15px; height: 30px; background-color: #DFE9E8; border-color: white; text-align: right;" 
           inputmode="numeric" oninput="formatNumberInput(this)" onblur="checkEnteredmileages()" value="0">원&nbsp;

<button type="button" id="clearButton" style="display: none; height: 30px; background-color: #477a7b; border: none; color: white;" onclick="clearmileageInput()">X</button>

					<button type="button"
						style="height: 30px; background-color: #477a7b; border: none; color: white;"
						onclick="useAllmileages()">전액사용</button>
					<br> 남은 적립금 <span id="remainingmileages"></span>원<br>
					
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; vertical-align: top; text-align: left;">총 결제 금액<br>
				<br>
				</td>
				<td style="text-align: right;"><input type="hidden"
					id="originalTotalPrice" value="${totalPrice}">
					<span id="remainingTotalPrice" ></span>원<br></td>
			</tr>
		</table>




	<div style="display: flex; justify-content: center;">
	  <hr style="width: 80%; color: #477a7b; height: 2px;">
	</div>
	<table border="0">
		<tr>
			<td colspan="2"
				style="height: 10px; font-size: 15px; text-align: left; color: #477a7b;">결제수단<br>
			<br></td>
		</tr>
		<tr>
			<td style="text-align: left;">
			<input type="radio" name="payment" value="카드결제" checked="checked">카드 결제&nbsp;
			<input type="radio" name="payment" value="에스크로(가상계좌)">에스크로(가상계좌)&nbsp;
			<input	type="radio" name="payment" value="에스크로(실시간계좌이체)">에스크로(실시간계좌이체)&nbsp;
			<input type="radio" name="payment" value="카카오페이(간편결제)">카카오페이(간편결제)<br>
			<br></td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<button type="button" class="submit-button"
					style="width: 300px; height: 40px; background-color: #477A7B; border: none; color: white;"
					onclick="confirmPurchase()">결제하기</button>
					<!-- <input type="submit" value="결제하기"> -->
			</td>
		</tr>

	</table>
	</form>
	<br>
	<br>
	<br>
	<br>

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

<!-- 마일리지  -->
<script type="text/javascript">


		// 적립예정 마일리지 정리
		var formattedPrice = "${fn:replace(formattedPrice, ',', '') * 0.01}";
	    var mileageElement = document.getElementById("formattedMileage");
	    
	    var formatter = new Intl.NumberFormat("ko-KR");
	    var formattedValue = formatter.format(Math.floor(formattedPrice));
	    
    	mileageElement.textContent = formattedValue;
    		
    	
		var totalPrice = parseInt("${totalPrice}");
		var deliverymileage = parseInt("${delivery_View.mileage}");

		function useAllmileages() {
			  var mileageInput = document.getElementById("mileageInput");
			  var enteredmileages = deliverymileage; // "${delivery_View.mileage}" 값을 사용

			  if (enteredmileages > deliverymileage) {
			    alert("입력한 값이 보유 적립금보다 큽니다.");
			    return;
			  }

			  if (enteredmileages > totalPrice) {
			    enteredmileages = totalPrice;
			  }

			  mileageInput.value = numberWithCommas(enteredmileages);
			  calculateRemainingTotalPrice();

			  // x버튼 보이기
			  var clearButton = document.getElementById("clearButton");
			  clearButton.style.display = "inline";
			}

		function checkEnteredmileages() {
			var mileageInput = document.getElementById("mileageInput");
			var enteredmileages = parseInt(mileageInput.value
					.replace(/[^0-9]/g, "")); // 입력된 값을 정수로 변환

			if (enteredmileages > deliverymileage || enteredmileages > totalPrice) {
				if (!mileageInput.getAttribute("data-shown-warning")) {
					alert("입력한 값이 보유 적립금보다 크거나 주문 금액을 초과합니다.");
					mileageInput.setAttribute("data-shown-warning", "true");
					mileageInput.value = "0"; // 입력 값을 0으로 변경
					mileageInput.focus(); // 입력 요소에 다시 포커스를 설정하여 수정 가능하도록 함
				}
			} else {
				mileageInput.removeAttribute("data-shown-warning");
				mileageInput.value = numberWithCommas(enteredmileages); // 포맷이 적용된 값으로 변경
				calculateRemainingTotalPrice(); // 값이 유효한 경우에만 남은 총 가격 계산
			}
		}

		function calculateRemainingTotalPrice() {
			var mileageInput = parseInt(document.getElementById("mileageInput").value
					.replace(/[^0-9]/g, ""));
			var remainingTotalPrice = totalPrice - mileageInput;

			if (remainingTotalPrice < 0) {
				remainingTotalPrice = 0;
			}

			document.getElementById("remainingTotalPrice").textContent = numberWithCommas(remainingTotalPrice);
		}

		function numberWithCommas(value) {
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function calculateRemainingTotalPrice() {
			var mileageInput = parseInt(document.getElementById("mileageInput").value
					.replace(/[^0-9]/g, ""));
			var remainingmileages = deliverymileage - mileageInput;
			var remainingTotalPrice = totalPrice - mileageInput;

			document.getElementById("remainingTotalPrice").textContent = numberWithCommas(remainingTotalPrice);
			document.getElementById("remainingmileages").textContent = numberWithCommas(remainingmileages);
		}
		
		// x버튼
		function showClearButton() {
			  var mileageInput = document.getElementById("mileageInput");
			  var clearButton = document.getElementById("clearButton");

			  if (mileageInput.value !== "0") {
			    clearButton.style.display = "inline";
			  } else {
			    clearButton.style.display = "none";
			  }
			}

			function clearmileageInput() {
			  var mileageInput = document.getElementById("mileageInput");
			  mileageInput.value = "0";
			  showClearButton();
			  calculateRemainingTotalPrice();
			}

			// input 필드에 값이 입력되는 이벤트를 감지하여 showClearButton 함수 호출
			document.getElementById("mileageInput").addEventListener("input", showClearButton);

			// 초기화 버튼 클릭 이벤트 처리
			document.getElementById("clearButton").addEventListener("click", clearmileageInput);


		// 초기화
		calculateRemainingTotalPrice();

		// input 필드에 값이 입력되는 이벤트를 감지하여 checkEnteredmileages 함수 호출
		document.getElementById("mileageInput").addEventListener("input",
				checkEnteredmileages);
		
	
	</script>

</html>