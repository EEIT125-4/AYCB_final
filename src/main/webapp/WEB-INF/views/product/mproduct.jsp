<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link REL=STYLESHEET HREF="css/mproduct.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/productswitch.css" TYPE="text/css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	
<script>
	$(document).ready(function() {
		ProductTotal();
		BrandTotal();
		CateChart();
		BrandChart();
	});
</script>

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
					<div id="prototal" class="counttext"></div>
				</div>
				<div class="overviewtitle">商品總數</div>
			</div>
			<div class="overviewbox red">
				<div class="imgbox">
					<img class="overviewimg" src="image/company.png">
				</div>
				<div class="overviewcount">
					<div id="brandtotal" class="counttext"></div>
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
			<div >
				<div class="tableviewtitle">
					商品管理
				</div>
				<div class="addbox">
					<button type="button" class="btn btn-primary">新增商品</button>
				</div>
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
							<th>上下架</th>
							<th>管理</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pro" items='${Products}'>
							<tr>
								<td>${pro.productno}</td>
								<td>${pro.brandname}</td>
								<td>${pro.productname}</td>
								<td>${pro.productcategory}</td>
								<td>${pro.productprice}</td>
								<td>${pro.stock}</td>
								<td>
									<div class="switch">
    									<input class="switch-checkbox" id="switchID1${pro.productno}" type="checkbox" name="switch-checkbox" checked>
    									<label class="switch-label" for="switchID1${pro.productno}">
        									<span class="switch-txt" turnOn="✔" turnOff="✘"></span>
        									<span class="switch-Round-btn"></span>
    									</label>
									</div>
								</td>
								<td>
									<button type="button" class="btn btn-primary">修改</button>
									<button type="button" class="btn btn-danger">刪除</button>
								</td>
							</tr>
						</c:forEach>
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
	function CateChart(){
		var cate = document.getElementById('cateChart');
			$.ajax({
				type : 'GET',
				url : "GetCateTotal",
				dataType : "json",
				success : function(data) {
					var cateChart = new Chart(cate, {
						type : 'pie', //圖表類型
						data : {
							//標題
							labels : data.Cates,
							datasets : [ {
								label : '#test', //標籤
								data : data.Count, //資料
								//圖表背景色
								backgroundColor : [ 
										'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 185, 15, 0.2)',
										'rgba(155, 255, 155, 0.2)',
										'rgba(153, 50, 204, 0.2)',
										'rgba(255, 140, 0, 0.2)',
										'rgba(72, 61, 139, 0.2)',
										'rgba(139, 101, 8, 0.2)' ],
								//圖表外框線色
								borderColor : [ 
										'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 185, 15, 1)',
										'rgba(155, 255, 155, 1)',
										'rgba(153, 50, 204, 1)',
										'rgba(255, 140, 0, 1)',
										'rgba(72, 61, 139, 1)',
										'rgba(139, 101, 8, 1)' ],
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
				}
			});
		
	}
	
	function BrandChart(){
		var brand = document.getElementById('brandChart');
		$.ajax({
			type : 'GET',
			url : "GetBrandTotal",
			dataType : "json",
			success : function(data) {
				var brandChart = new Chart(brand, {
					type : 'pie', //圖表類型
					data : {
						//標題
						labels : data.Brands,
						datasets : [ {
							label : '#test', //標籤
							data : data.Count, //資料
							//圖表背景色
							backgroundColor : [ 
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 185, 15, 0.2)',
									'rgba(155, 255, 155, 0.2)' ],
							//圖表外框線色
							borderColor : [ 
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 185, 15, 1)',
									'rgba(155, 255, 155, 1)' ],
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
			}
		});
	}

	function ProductTotal() {
		$.ajax({
			type : 'GET',
			url : "GetProductTotal",
			dataType : "json",
			success : function(data) {
				$("#prototal").html(data);
			}
		});
	}
		
	function BrandTotal() {
		$.ajax({
			type : 'GET',
			url : "GetBrandTotal",
			dataType : "json",
			success : function(data) {
				$("#brandtotal").html(data.BrandTotal);
			}
		});
	}

	$(function() {
		$("#myDataTalbe").DataTable({
			lengthMenu : [5, 10, 30, 50],
			columnDefs : [ {
				orderable : true,
			} ],
			language: {
		        processing : "處理中...",
		        loadingRecords : "載入中...",
		       	lengthMenu : "顯示 _MENU_ 項結果",
		        zeroRecords : "沒有符合的結果",
		        info : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
		        infoEmpty : "顯示第 0 至 0 項結果，共 0 項",
		        infoFiltered : "(從 _MAX_ 項結果中過濾)",
		        infoPostFix : "",
		        search : "搜尋:",
		        paginate : {
		            first : "第一頁",
		            previous : "上一頁",
		            next : "下一頁",
		            last : "最後一頁"
		        },
		        aria : {
		            sortAscending: ": 升冪排列",
		            sortDescending: ": 降冪排列"
		        }
		    }
		});
	});
	
// 	$('#switchID1').change(function(){
// 		alert("123");
// 	})
	</script>
</body>
</html>