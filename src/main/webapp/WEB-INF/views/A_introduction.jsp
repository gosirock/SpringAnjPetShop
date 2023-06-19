<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="A_heardCss.css">
<link rel="stylesheet" href="A_inCss.css">
<link rel="stylesheet" href="A_MainCss.css">
<link rel="stylesheet" href="exampleCss.css">
</head>
<script type="text/javascript">
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
								        
								<li class="main-nav04"><a href="#">CART</a></li>        
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
										    <li><button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">MyPage</button></li>
										  </c:otherwise>
										</c:choose>
									<li style="font-size: 11px; margin-top: 10px;">${sessionScope.USERID}님</li>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
						<br/>
						<br/><br/><br/>
					

					
					
					
					<div style="text-align: center;">
						  <h1>ANJ PET SHOP Story</h1><br/>
						  <p>
						   <a href="A_ProductView.do" class="button">SHOP</a>
						  </p>
						  
						  <br/><hr class="custom-hr">
					</div>
					
				
					<main>
						<div class="backpack">
							<img class="cat-one"
								src="https://images.unsplash.com/photo-1517213849290-bbbfffdc6da3?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=a5b0a2f6956817ea22a12b356e4f65a4"
								alt="">
							<p style="font-size: 15px; font-weight: bold;">1인 가구의 증가와 반려동물을 키우는 가구의 수의 증가는 현대 사회에서 두드러진 트렌드입니다.</p>
						</div>
						<div class="backpack">
							<img class="cat-two"
								src="https://images.unsplash.com/photo-1527150602-a98f7a6f2746?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=dcb354b71b44d63af3c75f38fad003d1"
								alt="">
							<p>우리의 목표는 반려동물을 키우는 사람들이 집에서 편하게 반려동물 용품을 구매할 수 있는 최적의 플랫폼을 제공하는
								것입니다. 이 사이트를 통해 고객들은 다양한 종류의 반려동물 용품을 한 자리에서 쉽게 찾아볼 수 있습니다. 사료, 간식,
								장난감, 목줄과 하네스 등 다양한 제품들을 다양한 브랜드에서 선택할 수 있으며, 편리한 검색 및 필터링 기능을 통해
								고객들의 요구에 맞는 상품을 빠르게 찾을 수 있습니다.</p>
						</div>
						<div class="backpack">
							<img class="cat-three"
								src="https://images.unsplash.com/photo-1534135954997-e58fbd6dbbfc?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=8f9945b96f9130c4475f6a88b1f5dcfd"
								alt="">
							<p>We treat our pets as family We need to care for them Too many
								pets are abandoned every year. It is our purpose to protect them and
								enable them to return to their loved ones.We will continue to work
								harder to become better than yesterday, and we wish happiness to all
								companion animals in the world.</p>
							<p>우리는 반려동물을 가족이라 생각하고 그들을 아껴주어야 합니다 매년 버려지는 반려동물이 너무 많습니다. 그들을
								지켜주고 사랑하는 가족의 곁으로 돌아갈수 있게 하는것이 우리의 목적입니다. 앞으로도 어제보다 나은 우리가 되기위해 더욱
								노력하며, 세상에 있는 모든 반려동물의 행복을 기원합니다.<br/> Not every person knows how to love a dog, but every dog knowshow to love a person. </p><br/><br/><br/>
								<p>Stare at guinea pigs meow loudly just to annoy owners. Make meme, make cute face demand to be let outside at once, meow meow meow and expect owner to wait for me as i think about it nya nya nya meow. Caticus cuteicus. Rub face on everything paw at your fat belly yet rub whiskers on bare skin act innocent.</p>
								<p>I should be a god, meowing non stop for food inspect anything brought. Kitty power meow nya nya meow.</p>
						</div>
					</main><br/><br/><br/><br/>
					
					<a href="A_MainView.do?id"><img class="head-logo" src="LOGO.png" style="width: 200px; height: auto;"></a><br/>
					<h3 style="font-size: 15px; font-weight: bold;">ANJ.industry</h3>

					<footer>
						<ul>
							<li><a href="#">Brand Story</a></li>
							<li><a href="#">서비스이용약관</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li><a href="#">전자금융거래약관</a></li>
						</ul>
						<div>
							<p>
								<strong>Corporation ANJ.industry</strong> <br> Gangnam-gu,
								Seoul (Yeoksam-dong The Joy Computer Academy) <br> CEO: Ahn
								Jae-won <br> Business registration number: 240-81-87676
								Business information confirmation <br> Mail-order business
								report: Gangnam 10238 Fax: 02-000-1234
							</p>
							<p>
								<strong>customer service center</strong> <br> Tel:
								Representative number 1234-5678 (Weekdays 09:00~18:00) <br>
								Dedicated to the future: 1522-5700 (365 days 09:00-18:00) <br>
								Gangnam-gu, Seoul (Yeoksam-dong The Joy Computer Academy) <br>
								Fax: 02-000-1234 | Mail: ajw0376@gmail.com <br>
							</p>
						</div>
					</footer>



</body>
</html>