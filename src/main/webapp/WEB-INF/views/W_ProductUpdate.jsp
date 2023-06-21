<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">

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
    .container {
   	 display: flex;
      justify-content: center;
      align-items: center;
      width: 87%;
      padding: 20px;
      background-color: #f1f1f1;
	border-radius: 5px;
	font-size: 20px;
    }


    .container form input[type="submit"] {
      padding: 10px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      cursor: pointer;
      size:40px;
      width:100px;
      margin-left: 670px;
    }
    .sidebar input[type="submit"]{
	display: float;
	width: 100%;
	height:50px;
	font-size: 20px;
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
<form action="W_ProductList"><input type="submit" value="상품 목록"></form>
<br/>
<form action="W_ProductInsert"><input type="submit" value="상품 등록"></form>
<br/>
</div>
<div class="container">
	
	<form action="W_ProductUpdataAction" method="post" enctype="multipart/form-data">
	<h1 style="margin-left: 300px; font-size: 50px">상품 정보 변경</h1><br/>
	<table style="height: 10px">
		<tr>
			<td>제품코드</td>	
			<td><input type="text" name="pid" value="${dto.pid}" readonly="readonly" style="font-size: 20px"></td>
		</tr>
		<tr><td><br/></td></tr>
		<tr>
			<td style="padding-right: 5px">제품명</td>
			<td style="padding-right: 50px"><input type="text" name="pname" value="${dto.pname}" style="font-size: 20px"></td>
			<td style="padding-right: 5px">카테고리</td>
			<td><select name="pcategory" id="pcategory" style="font-size: 20px">
			<option value="food" >food</option>
			<option value="living">living</option>
			<option value="clean">clean</option>
			</select></td>
		</tr>
		<tr><td><br/></td></tr>
	 	<tr>
	 		<td>상품가격</td>
	 		<td><input type="number" name="pprice" value="${dto.pprice}" style="font-size: 20px"> </td>
	 		<td>재고</td>
	 		<td style="padding-right: 30px"><input type="number" name="pstock" value="${dto.pstock}"style="font-size: 20px"></td>
	 		<td>노출여부</td>
	 		<td><select name="available" id="available" style="font-size: 20px">
	<option  value="1">Y</option>
	<option  value="0">N</option>
	</select></td>
	 	</tr>
	
	</table>
	<br/>
	<table>
		<tr>
			<th><img id="preview" style="width: 250px; height: 150px" src="images/thumbnail/${dto.pthumbnail}.png"></th>
			<th><img id="preview2" style="width: 250px; height: 150px" src="images/thumbnail/${dto.pth2}.png"></th>
			<th><img id="preview3" style="width: 250px; height: 150px" src="images/thumbnail/${dto.pth3}.png"></th>
		</tr>
		<tr>
		<th>메인 이미지  </th>
		<th>2번 이미지 </th>
		<th>3번 이미지 </th>
		</tr>
		<tr>
		<th><input type="file" name="pthumbnail" onchange="readURL(this)"></th>
		<th> <input type="file" name="pth2" onchange="readURL2(this)"></th>
		<th> <input type="file" name="pth3" onchange="readURL3(this)"></th>
		</tr>
	</table>
	<br/>
	 <br/><br/>
	<input type="submit" value="수정" >

	</form>
</div>
</div>

</body>
<script type="text/javascript">

var pthumbnailValue = "${dto.pthumbnail}";
var pthumbnailValue2 = "${dto.pth2}";
var pthumbnailValue3 = "${dto.pth3}";

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview').src = pthumbnailValue;
	  }
	}
function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = pthumbnailValue2;
	  }
	}
function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview3').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = pthumbnailValue3;
	  }
	}
$(document).ready(function() {
	  let category = "${dto.pcategory}";
	  $("#pcategory").val(category);
	  
	  let available = "${dto.available}";
	  $("#available").val(available);
	  
	});
	
</script>

</html>