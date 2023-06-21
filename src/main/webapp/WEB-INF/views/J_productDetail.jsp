<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>${productDetail.pname }</title> 					<!--  상품 페이지에서 선택한 제품의 상세 페이지입니다. -->
<!-- <link rel="stylesheet" href="A_heardCss.css"> -->
<link rel="stylesheet" href="CSS/J_productDetail.css">

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
</head>
<body>
			<header>
				<div class="head-wrap">
					<div class="head-wrap-inner">
						<a href="Main?id=${sessionScope.USERID}"><img class="head-logo" src="LOGO.png"></a>  
					</div>
					<div class="head-wrap-sub">
						<nav class="head-menu-main-nav">
							<ul> 
								<li class="main-nav02 dropdown">
									<a href="#">🐕 ANJLIFE</a>
											<div class="dropdown-content">
												<a href="A_introduction">introduction</a>
												<a href="A_Part">Part</a>
											</div>
								</li>
								<li class="main-nav01"><a href="Product">🦴 SHOP</a></li>
									<li class="main-nav02 dropdown">
										<a href="O_review">💬 COMMUNITY</a>
											<div class="dropdown-content">
												<a href="O_review">review</a>
												<a href="O_qna">Q&A</a>
											</div>
								  </li>
								<li class="main-nav02 dropdown">
										<a href="O_notice">📜 NOTICE</a>
								      <div class="dropdown-content">
								      <a href="O_faq">FAQ</a>
									  <a href="O_notice">Notice</a>
									 </div>
								        
								<li class="main-nav04"><a href="T_cart">👜 CART</a></li>        
								<li class="right-align" id="loginContainer">
									<c:choose>
										  <c:when test="${empty sessionScope.USERID}">
										    <!-- 세션 값이 비어있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='A_loginView'">Login</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='A_JoinView'">New</button></li>
										  </c:when>
										  <c:otherwise>
										    <!-- 세션 값이 있을 때 -->
										    <li><button class="btn-login btn-dog" onclick="location.href='Logout'">Logout</button></li>
										    <li><button class="btn-login btn-dog" onclick="location.href='j_userPage'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header><br><br> <br> 
			
	<main class="main">
		<div class="top-section">
			<div class="top-left"> 			<!-- 이미지 뜨는 섹션 --> 	<!-- 1. 슬라이드 효과 2. 몇 번째 사진이 넘어가는지 밑에 바(-)로 알려주기 -->
				<!-- <div class="slide"> -->
					<img alt="제품 이미지를 준비중 입니다." src="images/thumbnail/${productDetail.pthumbnail }.png">
					
				<!-- </div> -->
				<%-- <div class="slide">
					<img alt="" src="images/thumbnail/${productDetail.pth2 }.png">
				</div>
				<div class="slide">
					<img alt="" src="images/thumbnail/${productDetail.pth3 }.png">
				</div> --%>
			</div>
			<div class="top-right">			<!-- 상품 상세 정보 뜨는 섹션 -->
				<h1 style="text-align: center"> ${productDetail.pname }</h1> 
				<h2 style="text-align: center"><fmt:formatNumber value="${productDetail.pprice }" pattern="#,###" /> 원</h2><br/>
				<h5 style="text-align: center">최소 주문 수량 1개 이상 <br/>
				배송비 무료 </h5> <hr>
				
				수량을 선택해 주세요. <br/><br/>
				<form name="form1" method="get" style="display: inline; width: 50%;">
					<input type="hidden" name="pid" value="${productDetail.pid }">
					<input type="button" onclick="clickMinus()" value=" - " style="font-size: 23px; color: #477A7B; background-color: #DFE9E8; border: none; ">
					<input type="text" name="count" size="2" id="quantity" value="1" min="0" max="${productDetail.pstock }" onchange="updateQuantity(this.value)" oninput="calcPrice(this.value)" style="text-align: center; font-size: 20px;border: none;">
					<input type="button" onclick="clickPlus()" value=" + " style="font-size: 23px; color: #477A7B; background-color: #DFE9E8; border: none; ">
					<input type="button" onclick="resetSelection()" value="♺" style="font-size: 19px; color: #477A7B; background-color: #DFE9E8; border: none; ">
					<h3 style="text-align: right;">TOTAL </h3>
					<h3 style="text-align: right;"> <span id="resultPrice"><fmt:formatNumber value="${productDetail.pprice }" pattern="#,###" /> 원</span></h3>
					<h5 style="text-align: right;"> <span id="resultRewards"> (적립금 : + ${productDetail.pprice * 0.01 } 원) </span></h5><br/><br/>
					
					<div style="display: flex;">
						<button type="button" id="btnCart" value="장바구니 담기" style="font-size: 25px; color: #477A7B; background-color: #DFE9E8; border: none; width: 100%; height: 60px">장바구니 담기</button>
						<button type="button" id="btnPurchase" value="즉시 구매하기" style="font-size: 25px; color: white; background-color: #477A7B; border: none; width: 100%; height: 60px">즉시 구매하기</button>
					</div>
				</form>
				<script type="text/javascript">
					var btnCart = document.getElementById("btnCart");
					var btnPurchase = document.getElementById("btnPurchase");
					
					btnCart.onclick = function() {
						var confirmation = confirm('장바구니에 추가하시겠습니까?');
						 if (confirmation === true) {
						   // 확인 버튼 클릭 시 장바구니에 추가하기
						   document.form1.action = "/insertCart";
						   document.form1.submit();
						 } else {
						   // 취소 버튼 클릭 시 다시 현재 페이지로 보여주기
						   document.form1.action = "/j_pClicked";
						   return false;
						 }
					}
					
					btnPurchase.onclick = function() {
						var confirmation = confirm('즉시 구매하시겠습니까?');
						 if (confirmation === true) {
						   // 확인 버튼 클릭 시 즉시 구매 페이지로 보내주기
						   document.form1.action = "/insertPurchase";
						   document.form1.submit();
						 } else {
						   // 취소 버튼 클릭 시 다시 현재 페이지로 보여주기
						   document.form1.action = "/j_pClicked";
						   return false;
						 }
					}
					
				
				
				</script>
			</div>
		</div>
		<div class="bottom-section-wrapper">
			<div class="bottom-section">
				<img alt="" src="images/filename/${productDetail.pfilename }.jpg"><br/>
			</div>
			
			<!-- 고정된 구매하기 버튼 --><%-- 
			<form action="<!-- 태영이 구매.do -->" name="purchase" method="get" class="fixedPurchaseBtn">
				<input type="button" value="구매하기" onclick="sendToPay()" style="font-size: 15px; color: white; background-color: #477A7B; border: none; width: 100%; height: 40px">
			</form> --%>
		</div>
		
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
	</main>

	<script src="JS/O_ScrollTop.js"></script>
	<button class="top-button" onclick="scrollToTop()">top</button>
	

</body>
<script type="text/javascript" src="/JS/J_productDetail.js"></script>
<script type="text/javascript">
function clickPlus() {		/* 수량 파트 : (+) 클릭할 때 */
  	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(tfQuantity.value);				// 현재 수량 텍스트 필드에 입력되어있는 값(정수).
    if (currentValue < ${productDetail.pstock}) {
    	tfQuantity.value = currentValue + 1;						// 현재 텍스트 필드 값에서 1 더한 값을 현재값으로 할당. 
	} else {
    	alert("죄송합니다. 주문 가능한 수량을 초과하였습니다. \n 해당 제품은 " + ${productDetail.pstock} + "개 까지만 주문 가능합니다.");
    }
	calcPrice();
	calcRewards();
  }
  
function calcPrice() {
	  var quantityField = document.getElementById('quantity');
	  var quantity = parseInt(quantityField.value);
	  var price = parseInt(${productDetail.pprice});
	  var result = quantity * price;
	  var resultElement = document.getElementById('resultPrice');
	  resultElement.textContent = result.toLocaleString() + '원';
	}

function calcRewards() {
	var quantityField = document.getElementById('quantity');
	  var quantity = parseInt(quantityField.value);
	  var price = parseInt(${productDetail.pprice});
	  var result = quantity * price * 0.01;
	  var resultElement = document.getElementById('resultRewards');
	  resultElement.textContent = '(적립금 : + ' + result.toLocaleString() + '원)';
	}
	
function resetSelection() {
	  document.getElementById("quantity").value = "1";
	  var resultElement = document.getElementById('resultPrice');
	  var resultElement1 = document.getElementById('resultRewards');
	    var price = parseInt(${productDetail.pprice});
	    var result = 1 * price; // 초기 수량(1)과 가격을 곱하여 초기 결과 계산
	    var result1 = result * 0.01; // 초기 결과에 대한 적립금 계산
	    resultElement.textContent = result.toLocaleString() + '원';
	  resultElement1.textContent = '(적립금 : + ' + result1.toLocaleString() + '원)';
	  
}
	
	function sendToCart() {			/* 사용자가 선택한 수량 장바구니에 넘겨주기 */
		/* openCartModal(); */
		const qty = document.getElementById('quantity').value;
		document.basket.qty.value = qty;
		document.basket.submit();
	}
	
	function sendToPay() { 			/* 사용자가 선택한 수량 구매 페이지에 넘겨주기 */
		const count = document.getElementById('quantity').value;
		document.purchase.count.value = count;
		document.purchase.submit();
		
	}
	
/* 	const modal = document.getElementById("modal")=
	window.addEventListener('load', function() {
		const btnCart = document.getElementById('btnCart');
		btnCart.addEventListener("click", openCartModal);
	})
		 modal.style.display = "flex" 
	}) 
	
	function openCartModal() {
		var cartModal = document.getElementById("cartModal");
		cartModal.style.display = "block";
		
		const qty = document.getElementById('quantity').value;
		document.basket.qty.value = qty;
		document.basket.submit();
	}
	
	function closeCartModal() {
		var cartModal = document.getElementById("cartModal");
		cartModal.style.display = "none"; 
} */

	/* 사진 넘기는 효과주기 */
	const slides = document.querySelectorAll('.slide');
	let currentSlide = 0;

	function showSlide(n) {
	  slides[currentSlide].classList.remove('active');
	  slides[n].classList.add('active');
	  currentSlide = n;
	}

	function nextSlide() {
	  let next = currentSlide + 1;
	  if (next >= slides.length) {
	    next = 0;
	  }
	  showSlide(next);
	}

	function prevSlide() {
		let prev = currentSlide - 1;
		if (prev < 0) {
			prev = slides.length - 1;
		}
		showSlide(prev);
	}
	
	slides[currentSlide].classList.add('active');
	setInterval(nextSlide, 5000); // 5초마다 다음 슬라이드로 이동

	for (let i = 0; i < slides.length; i++) {
	  slides[i].addEventListener('click', (event) => {
		  const slideWidth = slides[i].offsetWidth;
		  const clickX = event.offsetX;
		  
		  if (clickX > slideWidth / 2) {
		    nextSlide();
		  } else {
			  prevSlide();
		  }
	  });
	}

	
	
	
	
	
	
	
	
</script>
</html>