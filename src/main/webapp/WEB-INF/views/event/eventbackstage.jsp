<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css" />
<link REL="STYLESHEET"
	HREF="${pageContext.request.contextPath}/css/manager.css"
	TYPE="text/css">
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/paper-dashboard.css"
	TYPE="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<title></title>
</head>
<body  style="background-color: #f5f5f5">
	<div>

		<div class="back" style="width: 180px">
			<div class="title" style="text-align: left">後臺管理</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="會員"
					onclick='location.href="${pageContext.request.contextPath}/memberback"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="商品"
					onclick='location.href="${pageContext.request.contextPath}/GetAllProduct"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="訂單"
					onclick='location.href="${pageContext.request.contextPath}/orderManager"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="訊息"
					onclick='location.href="#"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="活動"
					onclick='location.href="${pageContext.request.contextPath}/event/backstageshowEvent"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="留言板"
					onclick='location.href="#"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="部落格"
					onclick='location.href="${pageContext.request.contextPath}/blog/backstage"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="影音區"
					onclick='location.href="#"'>
			</div>
			<div class="mbtnbox">
				<input class="mbtn" type="button" value="廣告區"
					onclick='location.href="${pageContext.request.contextPath}/advertisement"'>
			</div>
		</div>
		<div class="row" style="margin: 50px">
			<div class="col-lg-6 col-md-6 col-sm-6" style="margin-left: 200px;">
				<div class="card card-stats">
					<div class="card-body">
						<div class="row">
							<div class="col-9 col-md-4">
								<div class="icon-big text-center icon-warning">
									<i class="fa fa-user" aria-hidden="true" style="color:#B8B8FF"></i>
								</div>
							</div>
							<div class="col-7 col-md-8">
								<div class="numbers">
									<h4 class="card-category" style="font-size: x-large;">活動參加總人數</h4>
									<p class="card-title" style="font-size: x-large;" id="totalattendance">共人
									<p>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer ">
						<hr>
						<div class="stats">
							<i class="fa fa-refresh"></i> Update Now 安插日期
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6" style="margin-left: 200px;">
				<div class="card card-stats">
					<div class="card-body">
					<canvas id="myChart"></canvas>	
					</div>
					<div class="card-footer ">
						<hr>
						<div class="stats">
							<i class="fa fa-refresh"></i> Update Now 安插日期
						</div>
					</div>
				</div>
			</div>
<!-- 			<div style="width: 500px; height: 500px; margin-left: 220px"> -->
<%-- 			<canvas id="myChart"></canvas> --%>
		</div>	
		</div>
		<div class="row" style="margin:0px 5px 0px 55px">
		<div class="col-lg-1 col-md-6 col-sm-6"></div>
		<div class="col-lg-11 col-md-6 col-sm-6" style="margin:0px">
		<div class="card card-stats">
		<div class="card-body">
		<div id="backcontent">

			<c:choose>
				<c:when test='${empty events}'>查無報名資料<br>
				</c:when>
				<c:otherwise>

					<table id="mytable" class="display">
						<thead>
							<tr>
								<th>活動ID</th>
								<th width='180' height='200'>活動圖片</th>
								<th>活動名稱</th>
								<th>日期</th>
								<th>地點</th>
								<th>主辦人</th>
								<th>聯絡電話</th>
<!-- 								<th>活動敘述</th> -->
								<th>名額</th>
								<th>報名人數</th>
								<th>編輯活動資料</th>
								<th>刪除活動資料</th>
							</tr>
						</thead>

						<c:forEach var='event' varStatus='vs' items='${events}'>
							<tr>
								<td>
									<%-- 								<a href="<c:url value='showAllAttendanceByEvent'/>?eventid=${event.eventid}"><button id="showattendancebyevent">${event.eventid}</button></a> --%>
									<input type=button id="showattendancebyevent${event.eventid}"
									value="${event.eventid}"> <input type=hidden
									id="test${event.eventid}" value="${event.eventid}">
								</td>
								<td><img width='180' height='200' src='${event.filename}' /></td>
								<td>${event.eventname}</td>
								<td>${event.eventdate}</td>
								<td>${event.eventlocation}</td>
								<td>${event.host}</td>
								<td>${event.hostphone}</td>
<%-- 								<td>${event.eventdescription}</td> --%>
								<td>${event.totalpax}</td>
								<td>${event.pax}</td>
								<td><a
									href="<c:url value='eventupdate'/>?eventid=${event.eventid}">編輯</a></td>
								<td><a
									href="<c:url value='eventdelete'/>?eventid=${event.eventid}">刪除</a></td>
							</tr>

							<%-- 							<input type="hidden" value="${event.eventid}" id="eventid" class="evnetid"> --%>
							<script>
								$('#showattendancebyevent${event.eventid}')
										.click(
												function() {
													var eventid = $(
															'#test${event.eventid}')
															.val();
													console.log(eventid);
													$('#backcontent').load(
															"http://localhost:8080/AYCB_final/event/showAllAttendanceByEvent?eventid="
																	+ eventid)
												})
							</script>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
					</div>
					<div class="card-footer ">
						<hr>
						
					</div>
				</div>		
          </div>
<!--           <div class="col-lg-1 col-md-6 col-sm-6" ></div> -->
</div>
	

</body>
<script>
	$(document).ready(function() {
		$('#mytable').DataTable({
			bFilter : true,
			bPaginate : true, // 顯示換頁
			searching : true, // 顯示搜尋
			info : true, // 顯示資訊
			fixedHeader : true, // 標題置頂
			destroy : true,
			language : {
				"processing" : "處理中...",
				"loadingRecords" : "載入中...",
				"lengthMenu" : "顯示 _MENU_ 項結果",
				"zeroRecords" : "沒有符合的結果",
				"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
				"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
				"infoFiltered" : "(從 _MAX_ 項結果中過濾)",
				"search" : "搜尋:",
				"paginate" : {
					"first" : "第一頁",
					"previous" : "上一頁",
					"next" : "下一頁",
					"last" : "最後一頁"
				},
				"aria" : {
					"sortAscending" : ": 升冪排列",
					"sortDescending" : ": 降冪排列"
				},
				"select" : {
					"1" : "%d 列已選擇",
					"2" : "%d 列已選擇",
					"_" : "%d 列已選擇"
				}
			}
		});
	});

	$(document).ready(
			function NumberOfCategory() {
				var ctx = document.getElementById('myChart');
				$.ajax({
					type : 'GET',
					url : "numberofCategory",
					dataType : "json",
					success : function(data) {
						var category = new Chart(ctx, {
							type : 'pie', //圖表類型
							data : {
								//標題
								labels : [ "體驗", "教學", "新品發表", "促銷", "其他" ],
								datasets : [ {
									label : '#test', //標籤
									data : data, //資料
									//圖表背景色
									backgroundColor : [
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 185, 15, 0.2)',
											'rgba(155, 255, 155, 0.2)',
											'rgba(153, 50, 204, 0.2)' ],
									//圖表外框線色
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 185, 15, 1)',
											'rgba(155, 255, 155, 1)',
											'rgba(153, 50, 204, 1)', ],
									//外框線寬度
									borderWidth : 1
								} ]
							},
// 							options : {
// 								scales : {
// 									yAxes : [ {
// 										ticks : {
// 											beginAtZero : true,
// 											responsive : true
// 										//符合響應式
// 										}
// 									} ]
// 								}
// 							}
						});
					}
				});

			});
	
	$(document).ready(
		function TotalAttendance() {
			console.log("data")
		$.ajax({
			type : 'GET',
			url : " totalattendance",
			dataType : "json",
			success : function(data) {
				$("#totalattendance").html(data);
			}
		});
	});
</script>
</html>
