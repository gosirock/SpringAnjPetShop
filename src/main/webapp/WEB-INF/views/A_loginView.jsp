<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="A_loginCss.css">
<link rel="stylesheet" href="A_heardCss.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
<script type="text/javascript">


function loginCheck() {
	const form = document.login
	const id = form.id.value;
	const passwd = form.pw.value;
	
	//아이디 null값 경고
	if(!id){
		alert("아이디를 입력해 주세요")
		form.id.select()
		return
	}
	//비빌번호 null값 경고
	if(!passwd){
		alert("비밀번호를 입력해 주세요")
		form.id.select()
		return
	}
	
	// 아이디 패스워드 확인 후 보내기
	$.ajax({
		url:"loginCheck.do",
		type:"post",
		dataType:"text",
		data:{"id":id,"pw":passwd},
		success:function(data){
		if(data=="admin"){ 
			location.href = 'W_Home.do?adminid='+id;
		}else if(data=="user"){
			location.href = 'A_Main.do?userid='+id;
			form.submit()
		}else{
			alert("아이디, 비밀번호를 확인하세요");
		}
		},
		error:function(){
			alert("실패");
		}
	});	
	
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

				
				
							<!-- 로그인 기능 입력창  -->
						  <form action="A_MainView.do" method="post" name="login">
					    <div class="wrap">
					        <div class="login">
					            <h2>ANJ PETSHOP</h2>
					            <div class="login_sns">
					            <li><a href=""><i class="fab fa-instagram"></i></a></li>
					            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
					            <li><a href=""><i class="fab fa-twitter"></i></a></li>
					            </div>
					            <div class="login_id">
					                <h4>ID</h4>
					                <input type="text" name="id" placeholder="ID">
					            </div>
					            <div class="login_pw">
					                <h4>Password</h4>
					                <input type="password" name="pw"  placeholder="Password">
					            </div><br/>
					            <h3 style="font-size: 12px;">Pets are our family. Let's find out what gifts to give to your family with us.</h3><br/>
					            <button class="btn-login btn-dog" onclick="location.href='A_loginView.jsp'">new</button> <br/>
					            <div class="submit">
					                <input type="button" value="LOGIN" onclick="loginCheck()">
					            </div>
					           </div>	 					  
							</div>
								</form>
							   
					       
				
			 
			 
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