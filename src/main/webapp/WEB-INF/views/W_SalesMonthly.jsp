<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
  <head>
 
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
	.sidebar input[type="submit"]{
	display: float;
	width: 100%;
	height:50px;
	font-size: 20px;
    }	
    .container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 100%;
    text-align: center;
    }
    #chart{
     display: flex;
    flex-direction: row;
     justify-content: center;
      align-self:center;
         text-align: center;
     width: 400px;
     height: 400px;
    }
    #table{
     display: flex;
       flex-direction: column;
     justify-content: center;
     align-self:center;
         text-align: center;
    }
     #toptable{
    display: flex;
       flex-direction: row;
     justify-content: center;
     align-self:center;
         text-align: center;
    }
   
  </style>
  
  </head>
  
  
  
  
  <link rel="stylesheet" href="W_Header.css">
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
			<form action="W_SalesDaily"><input type="submit" value="일별 매출"></form>
			<br />
			<form action="W_SalesMonthly"><input type="submit" value="월별 매출"></form>
			<br />
		</div> <!-- sidebar -->
		
		<div class="container">
  <h1 style="font-size: 50px">월별 매출 현황</h1><br/>
  
  <div id="chart" >
   <div style="width: 900px; height: 300px"><canvas id="myChart" width="900px" height="300px"></canvas></div>
   
  </div>
  <div id="table">
<div id="toptable">
  <input type="month" id="monthday" onChange="monthaday()" style="width: 150px; height: 30px"> <p id="total" style="align-self:center; font-size: 30px; margin-top: 0px; margin-bottom: 10px; margin-left: 300px"></p><br/>
</div>

    <table border="1">
    	<tr>
    		<th>순번</th>
    		<th>제품코드</th>
    		<th>상품명</th>
    		<th>상품가격</th>
    		<th>판매수량</th>
    		<th>판매금액</th>
    		<th>사용포인트</th>
    		<th>순이익</th>
    		<th>날짜</th>
    		
    	</tr>
    	<tbody class="table_body" id="tbody" style="text-align: center;">
    	
    	</tbody>
    </table>
    </div>

 	</div> <!-- container -->
</div> <!-- rowdata -->
  </body>
  
  <script type="text/javascript">
// 오늘 날짜를 가져오는 함수
function getTodayDate() {
  var today = new Date();
  var year = today.getFullYear();
  var month = String(today.getMonth() + 1).padStart(2, '0');
  return year + '-' + month;
}
// 페이지 로드 시 오늘 날짜로 설정
window.onload = function() {
  var today = getTodayDate();
  document.getElementById('monthday').value = today;
};
  </script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script type="text/javascript">
      let pagestart = 1;
      let myChart;
      const ctx = document.getElementById('myChart');
      function monthaday(){
    	  let day = $('#monthday').val();
    	  pagestart = 1;
    	  if (myChart) {
  		    myChart.destroy();
  		  }
    	  $.ajax({
				url : "./W_SalesMonthlyAction",
				type : "post",
				dataType : "JSON",
				data : {
					"day" : day
				},
				success : function(data) {
					let str = '';
					let item;
					var price= [];
					var pname= [];
					let totalcall = 0; // 전체 주문 가격 합계

					$.each(data, function(i, currentItem) {
						item = currentItem;
						str += '<tr>';
						str += '<td>' + (pagestart++) + '</td>';
						str += '<td>'+ item.pid+ '</td>';
						str += '<td>'+ item.pname+ '</td>';
						str += '<td>'+ item.pprice+ '</td>';
						str += '<td>'+ item.count+ '</td>';
						str += '<td>'+ item.orderprice+ '</td>';
						str += '<td>'+ item.usedmileage+ '</td>';
						str += '<td>'+ (item.orderprice-item.usedmileage)+ '</td>';
						str += '<td>'+ item.orderdate+ '</td>';
						str += '</tr>';
						totalcall += (item.orderprice-item.usedmileage);
					});
					var totalElement = document.getElementById("total");
					totalElement.textContent = "합계 : "+totalcall+"원";
					$(".table_body").html(str);
				}
    	  })// 하단 표 제작 끝
    	  $.ajax({
				url : "./W_SalesMonthlyChart",
				type : "post",
				dataType : "JSON",
				data : {
					"day" : day
				},
				success : function(data) {
					let str = '';
					let item;
					var total= [];
					var date= [];
					$.each(data, function(i, currentItem) {
						item = currentItem;
						
						total.push(item["total"]);
						date.push(item["date"]);
						
						
					});
					
					myChart = new Chart(ctx, {
						  type: 'line',
						    data: {
						    	 labels: date,
						      datasets: [{
						    	  label: '일별매출',
						          data: total,
						          borderColor: 'red',
						          backgroundColor: 'rgba(255, 99, 132, 0.5)',
						          pointStyle: 'circle',
						          pointRadius: 10,
						          pointHoverRadius: 15
						      }]
						  },
						  options: {
							    responsive: true,
							    maintainAspectRatio: false,
							    aspectRatio: 1,
							    plugins: {
							      title: {
							        display: true,
							        text: (ctx) => 'Point Style: ' + ctx.chart.data.datasets[0].pointStyle
							      }
							    }
							  }
							}); /* 차트끝 */
				}
  	  })
    	  
      } //달력이벤트끝
      $(document).ready(function() {
    	  /* alert($('#monthday').val()); */
    		  let day = $('#monthday').val();
  				$.ajax({
					url : "./W_SalesMonthlyAction",
					type : "post",
					dataType : "JSON",
					data : {
						"day" : day
					},
					success : function(data) {
						let str = '';
						let item;
						var price= [];
						var pname= [];
						let totalcall = 0; // 전체 주문 가격 합계

						$.each(data, function(i, currentItem) {
							item = currentItem;
							str += '<tr>';
							str += '<td>' + (pagestart++) + '</td>';
							str += '<td>'+ item.pid+ '</td>';
							str += '<td>'+ item.pname+ '</td>';
							str += '<td>'+ item.pprice+ '</td>';
							str += '<td>'+ item.count+ '</td>';
							str += '<td>'+ item.orderprice+ '</td>';
							str += '<td>'+ item.usedmileage+ '</td>';
							str += '<td>'+ (item.orderprice-item.usedmileage)+ '</td>';
							str += '<td>'+ item.orderdate+ '</td>';
							str += '</tr>';
							totalcall += (item.orderprice-item.usedmileage);
						});
						$(".table_body").html(str);
						var totalElement = document.getElementById("total");
						totalElement.textContent = "합계 : "+totalcall+"원";
					}
  	    	  })// 하단 표 제작 끝
						 $.ajax({
								url : "./W_SalesMonthlyChart",
								type : "post",
								dataType : "JSON",
								data : {
									"day" : day
								},
								success : function(data) {
									let str = '';
									let item;
									var total= [];
									var date= [];
									$.each(data, function(i, currentItem) {
										item = currentItem;
										
										total.push(item["total"]);
										date.push(item["date"]);
									});
									
									myChart = new Chart(ctx, {
										  type: 'line',
										    data: {
										    	 labels: date,
										      datasets: [{
										    	  label: '일별매출',
										          data: total,
										          borderColor: 'red',
										          backgroundColor: 'rgba(255, 99, 132, 0.5)',
										          pointStyle: 'circle',
										          pointRadius: 10,
										          pointHoverRadius: 15
										      }]
										  },
										  options: {
											    responsive: true,
											    maintainAspectRatio: false,
											    aspectRatio: 1,
											    plugins: {
											      title: {
											        display: true,
											        text: (ctx) => 'Point Style: ' + ctx.chart.data.datasets[0].pointStyle
											      }
											    }
											  }
											}); /* 차트끝 */
								}
				  	  })
      });
						
      </script>
      
  
</html>
