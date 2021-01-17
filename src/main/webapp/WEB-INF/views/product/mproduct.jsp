<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link REL=STYLESHEET HREF="css/mproduct.css" TYPE="text/css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/backstage.jspf"%>
	<div class="content">
		<div class="overview">
			<div class="overviewbox yellow">
				<div class="imgbox">
					<img class="overviewimg" src="image/product.png">
				</div>
				<div class="overviewcount">
					<div class="counttext">50</div>
				</div>
				<div class="overviewtitle">商品總數</div>
			</div>
			<div class="overviewbox red">
				<div class="imgbox">
					<img class="overviewimg" src="image/company.png">
				</div>
				<div class="overviewcount">
					<div class="counttext">50</div>
				</div>
				<div class="overviewtitle">廠商總數</div>
			</div>
		</div>
		<div class="picview">
			<div class="picbox">
				<div class="picviewtitle">商品種類總覽</div>
				<div class="pic">
					<canvas id="cateChart" width="800" height="600"></canvas>
				</div>
			</div>
			<div class="picbox">
				<div class="picviewtitle">廠商總覽</div>
				<div class="pic">
					<canvas id="brandChart" width="800" height="600"></canvas>
				</div>
			</div>
		</div>
		<div class="tableview">
			<div class="tableviewtitle">
				商品管理
			</div>
			<div>
				<table id="myDataTalbe" class="display">
					<thead>
						<tr>
							<th>商品編號</th>
							<th>廠牌</th>
							<th>商品名稱</th>
							<th>商品種類</th>
							<th>商品價格</th>
							<th>商品庫存</th>
							<th>管理</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>Apple</td>
							<td>2000</td>
							<td>1</td>
							<td>
								<button type="button">修改</button>
								<button type="button">刪除</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>2</td>
							<td>2</td>
							<td>Banana</td>
							<td>3000</td>
							<td>1</td>
							<td>
								<button type="button">修改</button>
								<button type="button">刪除</button>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>3</td>
							<td>3</td>
							<td>Cherry</td>
							<td>4000</td>
							<td>1</td>
							<td>
								<button type="button">修改</button>
								<button type="button">刪除</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script>
		var cate = document.getElementById('cateChart');
		var brand = document.getElementById('brandChart');
		var cateChart = new Chart(cate,
				{
					type : 'pie', //圖表類型
					data : {
						//標題
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
								'Orange' ],
						datasets : [ {
							label : '#test', //標籤
							data : [ 12, 19, 3, 5, 2, 3 ], //資料
							//圖表背景色
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							//圖表外框線色
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							//外框線寬度
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									responsive : true
								//符合響應式
								}
							} ]
						}
					}
				});
		var brandChart = new Chart(brand, {
			type : 'pie', //圖表類型
			data : {
				//標題
				labels : [ 'Red', 'Blue' ],
				datasets : [ {
					label : '#test', //標籤
					data : [ 12, 19 ], //資料
					//圖表背景色
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)' ],
					//圖表外框線色
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)' ],
					//外框線寬度
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							responsive : true
						//符合響應式
						}
					} ]
				}
			}
		});

		$(function() {
			$("#myDataTalbe").DataTable({
				searching : true,
				columnDefs : [ {
					orderable : true,
				} ]
			});
		});
	</script>
</body>
</html>