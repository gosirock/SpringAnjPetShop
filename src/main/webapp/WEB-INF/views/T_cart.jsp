<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="T_cartCss.css">

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
</head>

<script>
	/* // 발자국 찍기
	src="footprint.js" */
	
	// 숫자 단위정리
	function numberWithCommas(x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 변경된 총 주문금액 재계산
	function calculateTotalPrice(selectElement, rowId) {
	  var selectedCount = selectElement.value;
	  var originalCount = selectElement.getAttribute("data-original-count");
	  if (selectedCount !== originalCount) {
	    var priceText = selectElement.getAttribute("data-price");
	    var price = parseInt(priceText);
	    var newTotalPrice = selectedCount * price;
	    document.getElementById(rowId).value = newTotalPrice;
	  }
	}

	// 합계구하기
	function submitForm(pid, selectedCount) {
	  var form = document.getElementById("form_" + pid);
	  form.elements["count_" + pid].value = selectedCount;
	  form.submit();
	}

	// 체크박스 체크 여부에 따라 총 주문금액 계산
	function calculateTotalAmount() {
	  var totalAmount = 0;
	  var totalPriceElements = document.querySelectorAll("[id^='totalPrice_']");
	  var checkboxes = document.getElementsByName('check'); // 체크박스 요소 가져오기

	  totalPriceElements.forEach(function(element, index) {
	    var priceText = element.textContent.replace(/[^0-9]/g, "");
	    var price = parseInt(priceText);
	    var checkbox = checkboxes[index]; // 해당 인덱스의 체크박스 가져오기

	    if (checkbox.checked) { // 체크박스가 체크된 경우에만 계산
	      if (!isNaN(price)) {
	        totalAmount += price;
	      }
	    }
	  });

	  var totalAmountElement = document.getElementById("totalAmount");
	  totalAmountElement.textContent = numberWithCommas(totalAmount);

	  // ${totalAmount}와 0을 더한 값을 계산하고 출력(최종 주문 합계)
	  var totalAmountCalc = totalAmount + 0;
	  document.getElementById("totalAmountFormatted").textContent = numberWithCommas(totalAmountCalc);
	}

	// 페이지 로드 시 총 주문금액 초기화
	window.addEventListener("load", calculateTotalAmount);

	// 변경 여부 확인 후 폼 제출
	function confirmSubmitForm(pid, selectedCount) {
	  var confirmation = confirm("변경하시겠습니까?");
	  if (confirmation) {
	    calculateTotalAmount(); // 확인 버튼을 누를 때 총 주문 금액 계산
	    submitForm(pid, selectedCount);
	  }
	}

	function deleteSelectedItems() {
		  var checkboxes = document.getElementsByName('check');
		  var selectedItems = [];

		  // 선택된 체크박스의 값을 배열에 추가
		  for (var i = 0; i < checkboxes.length; i++) {
		    if (checkboxes[i].checked) {
		      var formId = checkboxes[i].parentNode.parentNode.parentNode.parentNode.id;
		      var pid = formId.substring(formId.indexOf('_') + 1);
		      selectedItems.push(pid);
		    }
		  }

		  // 선택된 항목이 있을 경우 서버로 삭제 요청 전송
		  if (selectedItems.length > 0) {
		    var confirmation = confirm('선택한 항목을 삭제하시겠습니까?');
		    if (confirmation) {
		      for (var j = 0; j < selectedItems.length; j++) {
		        deleteItem(selectedItems[j]);
		      }
		    }
		  }
		}

		function deleteItem(pid) {
		  var form = document.createElement('form');
		  form.method = 'POST';
		  form.action = 'delete.do';

		  var input = document.createElement('input');
		  input.type = 'hidden';
		  input.name = 'pid';
		  input.value = pid;

		  form.appendChild(input);

		  document.body.appendChild(form);
		  form.submit();
		}


	// 주문하기 버튼 클릭 시 선택된 상품들의 폼을 제출
	function submitSelectedItems() {
	  var checkboxes = document.getElementsByName('check');
	  var selectedItems = [];

	  /* // 선택된 체크박스의 값을 배열에 추가
	  for (var i = 0; i < checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	      var formId = checkboxes[i].parentNode.parentNode.parentNode.parentNode.id;
	      var pid = formId.substring(formId.indexOf('_') + 1);
	      selectedItems.push(pid);
	    }
	  } */

	  // 선택된 항목이 있을 경우 폼 제출
	  if (selectedItems.length > 0) {
	    var form = document.createElement('form');
	    form.method = 'POST';
	    form.action = 'purchase.do';

	    // 선택된 상품들의 pid 값을 폼에 추가
	    for (var j = 0; j < selectedItems.length; j++) {
	      var input = document.createElement('input');
	      input.type = 'hidden';
	      input.name = 'pid';
	      input.value = selectedItems[j];
	      form.appendChild(input);
	    }

	    document.body.appendChild(form);
	    form.submit();
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
								<li class="main-nav04"><a href="cart.do">CART</a></li>        
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
		
		<h1 style="text-align: center;">CART</h1>
		
	

	</main>
	<c:forEach items="${list}" var="dto">
		<form id="form_${dto.pid}" action="T_cart.do?pid=${dto.pid}"
			method="post">
			<table style="border-top: 2px solid #E8E8E8;">
				<tr>
					<td colspan="2" style="width: 20px;"><input type="checkbox" name="check" checked="checked" onchange="calculateTotalAmount()"></td>
					<!-- 이미지 -->
					<!-- <td style="width: 200px; height: 100px; text-align: left;">image</td> -->
					<td style="width: 150px; height: 50px; text-align: left;">
						<img alt="제품 이미지를 준비중 입니다." src="images/thumbnail/${dto.pthumbnail}.png">
					</td>
					<!-- 상품정보 -->
					<td style="width: 750px; height: 100px; text-align: left;">&emsp;&emsp;<span
						class="pid" style="font-size: 25px;">${dto.pid}</span><br>&emsp;&emsp;<span
						class="pname" style="font-size: 25px;">${dto.pname}</span>&emsp;&emsp;<br>
						&emsp;&emsp;<fmt:formatNumber value="${dto.pprice}" pattern="#,##0" />원<br>
					</td>
					<!-- 수량 -->
					 <td style="width: 130px; text-align: center;">
				      <select name="count_${dto.pid}" data-original-count="${dto.count}" data-price="${dto.pprice}" onchange="calculateTotalPrice(this, '${dto.pid}')">
				        <c:forEach begin="1" end="10" var="i">
				          <option value="${i}" ${i eq dto.count ? 'selected' : ''}>${i}</option>
				        </c:forEach>
				      </select>
				    </td>
					<!-- 주문금액 -->
					<td id="total_${dto.pid}" style="width: 100px;">
			            <span id="totalPrice_${dto.pid}" data-total-price="${dto.pprice * dto.count}">
			              <fmt:formatNumber value="${dto.pprice * dto.count}" pattern="#,##0"/>
			            </span>원
			          </td>
					<!-- 변경 버튼 -->
					<td style="width: 100px; text-align: center;"><a href="#"
						onclick="confirmSubmitForm('${dto.pid}', document.getElementsByName('count_${dto.pid}')[0].value)">변경</a>
						<input type="hidden" name="pid" value="${dto.pid}" /></td>
				</tr>
			</table>
						<input type="hidden" name="userid" value="${sessionScope.USERID}">
		</form>
	</c:forEach>


	<!--  -->
	<form action="purchase.do" method="post">
		<table>
			<tr>
				<td colspan="2"
					style="text-align: right; border-top: 2px solid #E8E8E8;"><br>
				<input type="button" value="삭제"
       style="width: 80px; height: 30px; color: #477A7B; border-color: #477A7B;"
       onclick="deleteSelectedItems()">
				<input type="submit" value="주문하기"
					style="width: 80px; height: 30px; background-color: #477A7B; color: white; border-color: #477A7B;"
					class="submit-button"><br>
				<br>
				<br></td>
			</tr>
			<tr>
				<td
					style="width: 900px; text-align: left; border-bottom: 2px solid #E8E8E8;">주문금액
					<br>배송비
				</td>
				<td style="width: 150px; text-align: right; border-bottom: 2px solid #E8E8E8;">
					<span id="totalAmount"> <fmt:formatNumber
							value="${totalAmount}" pattern="#,##0" />
				</span>원<br>0원
				</td>
			</tr>
			<tr>
				<td style="width: 600px; text-align: left;">합계</td>
				<td style="width: 150px; text-align: right;">
  <span id="totalAmountFormatted">
    <fmt:formatNumber value="${totalAmount}" pattern="#,##0" />
  </span>원
</td>
				</td>
			</tr>
		</table>
	</form> 
			  





	 <footer>
            <ul>
                <li><a href="#">Brand Story</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
                <p><img src="LOGO.png" alt="푸터로고"></p>
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





