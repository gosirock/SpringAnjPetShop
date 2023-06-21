<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>회원 정보</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    

  
      .rowdata{
	
	 display: flex;
	 background-color: f1f1f1;
	  margin-top: 5%;
	}
	.sidebar{
	  display: flex;
	flex-direction: column;
	width: 10%;
	background-color: f1f1f1;
	padding: 20px;
	
	}
	.sidebar input[type="submit"]{
	display: float;
	width: 100%;
	height:50px;
	font-size: 20px;
    }	
     .container {
   	 display: flex;
      justify-content: center;
      width: 87%;
      padding: 20px;
      background-color: #f1f1f1;
      flex-direction: column;
    }
    .top{
    align-self: left;
     position: relative;
    left: 90px;
    
    }
    .top select{
    font-size: 15px;
    }
    #selectType{
     margin-left: 63%;
    }
    .top input[type="text"]{
    font-size: 15px;
    }
    .top button{
    font-size: 15px;
   
    }
    .table{
   	 width: 90%;
   	 align-self: center;
    }
    .low{
    align-self: center;
    }
    .low ul{
    list-style:none;
    }
    .low ul li{
    float: left;
    cursor: pointer;
    padding: 5px;
    }
  </style>
<link rel="stylesheet" href="W_Header.css">
</head>
<body style="height: 830px; background-color: #f1f1f1;">

<header>
					  <nav>
					    <ul>
					      <li><a href="W_Home">HOME</a></li>
					      <li><a href="W_ProductList">상품 관리</a>
					      	<ul>
					      		<li><a href="W_ProductList">상품 목록</a></li>
					      		<li><a href="W_ProductInsert">상품 등록</a></li>
					      	</ul>
					      </li>
					      <li><a href="W_UserList">회원 관리</a></li>
					      <li><a href="O_adminNotice">게시판 관리</a>
					      	
					      	</li>
					      <li><a href="W_SalesDaily">매출현황</a>
					      <ul>
					      		<li><a href="W_SalesDaily">일별 매출</a></li>
					      		<li><a href="W_SalesMonthly">월별 매출</a></li>
					      	</ul>
					      </li>
					    </ul>
					  </nav>
</header>			
				

<div class="rowdata">

		<div class="sidebar">
			<form action="W_UserList"><input type="submit" value="회원 정보"></form>
			<br />
		</div>
	<div class="container">
	<h1 style="margin-left: 43%; font-size: 50px">회원 정보</h1><br/>
		<div class="top">
		<select name="pagesize" id="pagesize">
			<option value="10" selected="selected">10개씩</option>
			<option value="15">15개씩</option>
			<option value="20">20개씩</option>
			<option value="5">5개씩</option>
			<option value="2">2개씩</option>
		</select> <select id="selectType">
			<option value="userid" selected="selected">ID</option>
			<option value="username">이 름</option>
			<option value="useraddress">주소</option>
		</select> <input type="text" id="text">
		<button id="btn" onclick="selectAction()">검색</button>
	<br/><br/>
		</div>

		<table class="table" border="1">
			<thead>
				<tr>
					<th style="width: 40px; height:40px; text-align: center;">순서</th>
					<th style="width: 100px; text-align: center;">아이디</th>
					<th style="width: 50px; text-align: center;">이 름</th>
					<th style="width: 100px; text-align: center;">전화번호</th>
					<th style="width: 100px; text-align: center;">이메일</th>
					<th style="width: 80px; text-align: center;">주소</th>
					<th style="width: 130px; text-align: center;">마일리지</th>
					<th style="width: 90px; text-align: center;">가입일자</th>
					<th style="width: 50px; text-align: center;">탈퇴일자</th>
				</tr>
			</thead>
			<tbody class="table_body" style="text-align: center;">

			</tbody>
		</table>
		<div class="low">
		<ul id="pagenum">
		</ul>
	</div>
		</div>
</div>
</body>
<script>
	let pagesize = $("#pagesize option:selected").val(); // 화면에 나타낼 데이터갯수
	let pagenum = 1;
	let pagestart = 1;
	let pageend;
	let selectText = "";
	let selectType = "userid";
	
	// 검색
	function selectAction() {
		selectText = $("#text").val();
		selectType = $("#selectType").val()
		pagenum = 1;
		$("#pagenum li").remove();
		$.ajax({
			url : "./W_UserListPaging",
			type : "post",
			dataType : "JSON",
			data : {
				"pagesize" : pagesize,
				"pagenum" : pagenum,
				"selectType" : selectType,
				"selectText" : selectText
			},
			success : function(data) {
				let str = '';
				pagestart = ((pagenum - 1) * pagesize) + 1;
				let item;

				$.each(data, function(i, currentItem) {
					item = currentItem;
					str += '<tr>';
					str += '<td>' + (pagestart++) + '</td>';
					str += '<td>'+ item.userid+ '</td>';
					str += '<td>' + item.username + '</td>';
					str += '<td>'+ item.usertel + '</td>';
					str += '<td>' + item.useremail + '</td>';
					str += '<td>' + item.useraddress + '</td>';
					str += '<td>' + item.mileage + '</td>';
					str += '<td>' + item.insertdate + '</td>';
					str += '<td>' + item.deletedate + '</td>';
					str += '</tr>';
				});
				$(".table_body").html(str);
				for (let i = 1; i <= Math.ceil(item.count/pagesize); i++) {
					$("#pagenum").append('<li value="' + i + '" id="' + i + '">' + i + '</li>');
				}
				if(item.count>pagenum){
					$("#pagenum").append('<li id="next">다음</li>');
					$("#pagenum").append('<li id="last">마지막</li>');
				}
				
				pageend=item.count;
				$('#'+pagenum).css({'color':'red', 'text-decoration':'underline'});
			}
		});
	};

	// 페이지 숫자 클릭시
	$("#pagenum").on("click","li",	function(event) {
				if($(this).text()=="다음"){
					pagenum++;
				}else if($(this).text()=="이전"){
					pagenum--;
				}else if($(this).text()=="마지막"){
					pagenum = pageend;
				}else if($(this).text()=="처음"){
					pagenum = 1;
				
				}else{
				pagenum = $(this).val();
				};
				$("#pagenum li").remove();
				$.ajax({
					url : "./W_UserListPaging",
					type : "post",
					dataType : "JSON",
					data : {
						"pagesize" : pagesize,
						"pagenum" : pagenum,
						"selectType" : selectType,
						"selectText" : selectText
					},
					success : function(data) {
						let str = '';
						pagestart = ((pagenum - 1) * pagesize) + 1;
						let item;
						if(pagenum>1){
							$("#pagenum").append('<li id="last">처음</li>');
							$("#pagenum").append('<li id="prev">이전</li>');
						}
						$.each(data, function(i, currentItem) {
							item = currentItem;
							str += '<tr>';
							str += '<td>' + (pagestart++) + '</td>';
							str += '<td>'+ item.userid+ '</td>';
							str += '<td>' + item.username + '</td>';
							str += '<td>'+ item.usertel + '</td>';
							str += '<td>' + item.useremail + '</td>';
							str += '<td>' + item.useraddress + '</td>';
							str += '<td>' + item.mileage + '</td>';
							str += '<td>' + item.insertdate + '</td>';
							str += '<td>' + item.deletedate + '</td>';
							str += '</tr>';
						});
						$(".table_body").html(str);
						for (let i = 1; i <= Math.ceil(item.count/pagesize); i++) {
							$("#pagenum").append('<li value="' + i + '" id="'+i+'">' + i + '</li>');
						}
						if(item.count>pagenum){
							$("#pagenum").append('<li id="next">다음</li>');
							$("#pagenum").append('<li id="last">마지막</li>');
						}
						
						pageend=item.count;
						$('#'+pagenum).css({'color':'red', 'text-decoration':'underline'});
					}
				});
				
			});

	// 처음 화면 리스트
	$(document).ready(
			function() {
				
				$("#pagenum li").remove();
				$.ajax({
					url : "./W_UserListPaging",
					type : "post",
					dataType : "JSON",
					data : {
						"pagesize" : pagesize,
						"pagenum" : pagenum,
						"selectType" : selectType,
						"selectText" : selectText
					},
					success : function(data) {
						let str = '';
						pagestart = ((pagenum - 1) * pagesize) + 1;
						let item;

						$.each(data, function(i, currentItem) {
							item = currentItem;
							str += '<tr>';
							str += '<td>' + (pagestart++) + '</td>';
							str += '<td>'+ item.userid+ '</td>';
							str += '<td>' + item.username + '</td>';
							str += '<td>'+ item.usertel + '</td>';
							str += '<td>' + item.useremail + '</td>';
							str += '<td>' + item.useraddress + '</td>';
							str += '<td>' + item.mileage + '</td>';
							str += '<td>' + item.insertdate + '</td>';
							str += '<td>' + item.deletedate + '</td>';
							str += '</tr>';
						});
						$(".table_body").html(str);
						for (let i = 1; i <= Math.ceil(item.count/pagesize); i++) {
							$("#pagenum").append('<li value="' + i + '" id="'+i+'">' + i + '</li>');
						}
						if(item.count>1){
							$("#pagenum").append('<li id="next">다음</li>');
							$("#pagenum").append('<li id="last">마지막</li>');
						}
						pageend=item.count;
						$('#'+pagenum).css({'color':'red', 'text-decoration':'underline'});
					}
				});
			});
	// 화면나타내는 수에따른 리스트
	$("#pagesize").change(
			function() {
				$("#pagenum li").remove();
				pagenum = 1;
				pagesize = $("#pagesize option:selected").val();
				$.ajax({
					url : "./W_UserListPaging",
					type : "post",
					dataType : "JSON",
					data : {
						"pagesize" : pagesize,
						"pagenum" : pagenum,
						"selectType" : selectType,
						"selectText" : selectText
					},
					success : function(data) {
						let str = '';
						pagestart = ((pagenum - 1) * pagesize) + 1;
						let item;
						
						$.each(data, function(i, currentItem) {
							item = currentItem;
							str += '<tr>';
							str += '<td>' + (pagestart++) + '</td>';
							str += '<td>'+ item.userid+ '</td>';
							str += '<td>' + item.username + '</td>';
							str += '<td>'+ item.usertel + '</td>';
							str += '<td>' + item.useremail + '</td>';
							str += '<td>' + item.useraddress + '</td>';
							str += '<td>' + item.mileage + '</td>';
							str += '<td>' + item.insertdate + '</td>';
							str += '<td>' + item.deletedate + '</td>';
							str += '</tr>';
						});
						$(".table_body").html(str);
						$('#'+pagenum).css('color','red');
						for (let i = 1; i <= Math.ceil(item.count/pagesize); i++) {
							$("#pagenum").append('<li value="' + i + '" id="'+i+'">' + i + '</li>');
							
						}
						
						if(item.count>1){
							$("#pagenum").append('<li id="next">다음</li>');
							$("#pagenum").append('<li id="last">마지막</li>');
						}
						pageend=item.count;
						$('#'+pagenum).css({'color':'red', 'text-decoration':'underline'});
					}
				});

			});
</script>
</html>