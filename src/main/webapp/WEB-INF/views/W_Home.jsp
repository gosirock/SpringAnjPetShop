<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<!-- 현재날짜 -->
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일" />
</c:set>

<style type="text/css">
.rowdata {
	display: flex;
	background-color: f1f1f1;
	margin-top: 5%;
}

.sidebar {
	display: flex;
	flex-direction: column;
	width: 10%;
	background-color: f1f1f1;
	padding: 20px;
}

.sidebar input[type="submit"] {
	display: float;
	width: 100%;
	height: 50px;
	font-size: 20px;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	text-align: center;
}

.today {
	margin-left: 5%;
	margin-top: 5%;
	text-align: center;
	margin-bottom: 5%;
	justify-content: center;
}

.chartarea {
display: flex;
	flex-direction: low;
	justify-content: center;
	text-align: center;
}

.table{
margin-left: 5%;
margin-right: 5%;
}
</style>

</head>




<link rel="stylesheet" href="W_Header.css">
<body style="height: 830px; background-color: #f1f1f1;">

<header>
					  <nav>
					    <ul>
					      <li><a href="W_Home.do">HOME</a></li>
					      <li><a href="W_ProductList.jsp">상품 관리</a>
					      	<ul>
					      		<li><a href="W_ProductList.jsp">상품 목록</a></li>
					      		<li><a href="W_ProductInsert.jsp">상품 등록</a></li>
					      	</ul>
					      </li>
					      <li><a href="W_UserList.jsp">회원 관리</a></li>
					      <li><a href="O_adminNotice.do">게시판 관리</a>
					      	
					      	</li>
					      <li><a href="W_SalesDaily.jsp">매출현황</a>
					      <ul>
					      		<li><a href="W_SalesDaily.jsp">일별 매출</a></li>
					      		<li><a href="W_SalesMonthly.jsp">월별 매출</a></li>
					      	</ul>
					      </li>
					    </ul>
					  </nav>
</header>

		<div class="container">
			<div class="today">

				<h1 style="font-size: 40px">Today 리포트</h1>
				<br />
			</div> <!-- today -->
			<div class="chartarea">

				<div class="table">
					<table border="0" style="width: 400px">
						<tr style="background-color: #92b6e6">
							<td colspan="4" style=""><h2 style="color: white; text-align: center;">오늘의 매출 현황 <c:out value="${date}" /> </h2></td>
						</tr>
						<tr style="background-color: #e7e9f4">
							<td colspan="4" style="text-align: right;"><br/><h2 style="color: #779bd1">total ${dto.total } 원</h2></td>
						</tr>
						<tr>
							<td><h3>결제금액</h3></td>
							<td style="text-align: right;"><h3 style="color: #779bd1">${dto.orderprice } 원</h3></td>
							<td><h3>마일리지</h3></td>
							<td style="text-align: right;"><h3 style="color: #779bd1">${dto.usedmileage } P </h3></td>
						</tr>
						<tr>
							<td><h3>결제건수</h3></td>
							<td style="text-align: right;"><h3 style="color: #779bd1">${dto.count } 건</h3></td>
							<td><h3>판매수량</h3></td>
							<td style="text-align: right;"><h3 style="color: #779bd1">${dto.productcount } 개 </h3></td>
						</tr>
					</table>
				</div>
				<!-- table -->
				
				<div style="width: 600px; height: 400px"><canvas id="myChart" width="400px" height="400px"></canvas></div>
			</div>
		</div>
		<!-- container -->

	</div>
	<!-- rowdata -->
</body>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
const ctx = document.getElementById('myChart');
${yesterday}
const myChart = new Chart(ctx, {
    type: 'bar', // 그래프의 종류
    data: { //chart에 들어갈 값
        labels: ['오늘', '어제', '최근 일주일평균'], // 라벨 값을 대표할 이름
        datasets: [{
            label: '# of Votes', //범례
            data: [${dto.total}, ${yesterday}, ${avg}], //실제 데이터값
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)'
                
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
              
            ],
            borderWidth: 1
        }]
    },
    options: {
    	 maintainAspectRatio :false,//그래프의 비율 유지 
         plugins:{ // 라벨 숨기기
             legend: {
                 display: false
             },
         },
         indexAxis: 'y' //수평차트 만들기
        }
    
});
	
</script>
</html>
