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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link REL=STYLESHEET HREF="css/paper-dashboard.css" TYPE="text/css">

<script>
	$(document).ready(function() {
		ProductTotal();
		BrandTotal();
		CateChart();
		BrandChart();
		Checkstatus();
	});
</script>

<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/backstage.jspf"%>
	<div class="content" style="position: relative;top: 150px;float: right;width: 88%;">
	<div class="row">
		<div class="col-12 col-lg-5 col-md-4 col-sm-6" style="margin-left: 130px;">
        	<div class="card card-stats">
        		<div class="card-body " style="padding-top: 0;padding-bottom: 30px;">
                	<div class="row">
                  	<div class="col-9 col-md-4">
                    <div class="icon-big text-center icon-warning" style="margin-top: 50px;">
                      <i class="fa fa-product-hunt" style="font-size: 70px;font-weight: bold;color: tomato;"></i>
                    </div>
                  	</div>
                  	<div class="col-7 col-md-7">
                    <div class="numbers">
                      <h4 class="card-category" style="font-size: 40px;font-weight: bold;color: black;">商品總數</h4>
                      <p id="prototal" class="card-title" style="margin-top: 10px;font-size: 36px;font-weight: bold;color: black;"><p>
                    </div>
                  	</div>
                	</div>
              	</div>
        	</div>
        </div>									
		<div class="col-12 col-lg-5 col-md-4 col-sm-6">
        	<div class="card card-stats">
        		<div class="card-body " style="padding-top: 0;padding-bottom: 30px;">
                	<div class="row">
                  	<div class="col-9 col-md-4">
                    <div class="icon-big text-center icon-warning" style="margin-top: 50px;">
                      <i class="fa fa-building-o" style="font-size: 70px;font-weight: bold;color: tomato;"></i>
                    </div>
                  	</div>
                  	<div class="col-7 col-md-7">
                    <div class="numbers">
                      <h4 class="card-category" style="font-size: 40px;font-weight: bold;color: black;">廠商總數</h4>
                      <p id="brandtotal" class="card-title" style="margin-top: 10px;font-size: 36px;font-weight: bold;color: black;"><p>
                    </div>
                  	</div>
                	</div>
              	</div>
        	</div>
        </div>
	</div>	
	<div class="row">
		<div class="col-12 col-lg-5 col-md-5 col-sm-6" style="margin-left: 130px;">
        	<div class="card card-stats">
        		<div class="card-header ">
	            	<p class="picviewtitle">商品種類總覽</p>
	            </div>
        		<div class="card-body " style="padding-top: 0;padding-bottom: 30px;">
                	<canvas id="cateChart" width="800" height="600"></canvas>
              	</div>
        	</div>
        </div>	
        <div class="col-12 col-lg-5 col-md-5 col-sm-6">
        	<div class="card card-stats">
        		<div class="card-header ">
	            	<p class="picviewtitle">廠商總覽</p>
	            </div>
        		<div class="card-body " style="padding-top: 0;padding-bottom: 30px;">
                	<canvas id="brandChart" width="800" height="600"></canvas>
              	</div>
        	</div>
        </div>
	</div>
	<div class="row">
		<div class="col-12 col-lg-10 col-md-5 col-sm-6" style="margin-left: 130px;">
        	<div class="card card-stats">
        		<div class="card-header ">
	            	<p class="tableviewtitle" style="">商品管理</p>
	            	<div class="addbox">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product">新增商品</button>
					</div>
	            </div>
        		<div class="card-body " style="padding-top: 0;padding-bottom: 30px;">
					<div class="modal fade" id="product" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title" id="addtitle modalTitle"><h2><b>新增商品</b></h2></div>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="caption">
										<form:form id="addform" method='POST' modelAttribute="ProductBean" enctype="multipart/form-data">
											<div class="adddiv">
												<label class="addlab">廠牌名稱 : </label>
												<form:input class="addinput" id="brandname" path="brandname" type="text" required="required" />
											</div>
											<div class="adddiv">
												<label class="addlab">產品類型 : </label>
												<form:select class="addsel" id="producttype" path="producttype" required="required">
												<form:option id="producttype" value=""></form:option>
												<form:option value="保養品">保養品</form:option>
												<form:option value="彩妝">彩妝</form:option>
												</form:select>
											</div>
											<div class="adddiv">
												<label class="addlab">產品名稱 : </label>
												<form:input class="addinput" id="productname" type="text" path="productname" required="required" />						
											</div>
											<div class="adddiv">
												<label class="addlab">產品系列 : </label>
												<form:input class="addinput" id="productseries" type="text" path="productseries" required="required" />
											</div>
											<div class="adddiv">
												<label class="addlab">產品種類 : </label>
												<form:input class="addinput" id="productcategory" type="text" path="productcategory" required="required" />
											</div>
											<div class="adddiv">
												<label class="addlab">產品價格 : </label>
												<form:input class="addinput" id="productprice" type="text" path="productprice" required="required" />
											</div>
											<div class="adddiv">
												<label class="addlab">產品數量 : </label>
												<form:input class="addinput" id="stock" type="text" path="stock" required="required" />
											</div>
											<div class="adddiv">
												<label class="addlab">產品圖片:</label>
												<form:input id="productimage" type="file" path="productimage" required="required" />
												<form:input type="hidden" path="productstatus" value="1" />
												<form:input type="hidden" path="status" value="1" />
												<input type="hidden" name="todo" value="add" />
											</div>
											<div class="adddiv">
												<button id="addbtn" type="submit" class="btn btn-primary">新增</button>
												<button id="databtn" type="button" class="btn btn-primary">帶入資料</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>
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
    									<input class="switch-checkbox" id="switchID1${pro.productno}" type="checkbox" name="switch-checkbox" onchange="status(${pro.productno})" checked>
    									<label class="switch-label" for="switchID1${pro.productno}">
        									<span class="switch-txt" turnOn="✔" turnOff="✘"></span>
        									<span class="switch-Round-btn"></span>
    									</label>
									</div>
								</td>
								<td>
									<button id="update${pro.productno}" type="submit" class="btn btn-primary" data-toggle="modal" data-target="#up${pro.productno}">修改</button>
									<button id="del" type="button" class="btn btn-danger" onclick="del(${pro.productno})">刪除</button>
								</td>
								<div class="modal fade" id="up${pro.productno}" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
											<div class="modal-title" id="modalTitle"><h2><b>更新商品</b></h2></div>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="caption">
													<form:form id="upform" method='POST' modelAttribute="UPBean" enctype="multipart/form-data" >
														<div class="adddiv">
															<label class="addlab">廠牌名稱 : </label>
															<form:input class="addinput" type="text" path="brandname" value="${pro.brandname}" required="required" />
														</div>
														<div class="adddiv">
															<label class="addlab">產品類型 : </label>
															<form:input class="addinput" type="text" path="producttype" value="${pro.producttype}" required="required" />
														</div>
														<div class="adddiv">
															<label class="addlab">產品名稱 : </label>
															<form:input class="addinput" type="text" path="productname" value="${pro.productname}" required="required" />						
														</div>
														<div class="adddiv">
															<label class="addlab">產品系列 : </label>
															<form:input class="addinput" type="text" path="productseries" value="${pro.productseries}" required="required" />
														</div>
														<div class="adddiv">
															<label class="addlab">產品種類 : </label>
															<form:input class="addinput" type="text" path="productcategory" value="${pro.productcategory}" required="required" />
														</div>
														<div class="adddiv">
															<label class="addlab">產品價格 : </label>
															<form:input class="addinput" type="text" path="productprice" value="${pro.productprice}" required="required" />
														</div>
														<div class="adddiv">
															<label class="addlab">庫存 : </label>
															<form:input class="addinput" type="text" path="stock" value="${pro.stock}" required="required" />
															<form:input type="hidden" path="productno" value="${pro.productno}" />
															<form:input type="hidden" path="brandno"  value="${pro.brandno}" />
															<form:input type="hidden" path="skintype"  value="${pro.skintype}" />
															<form:input type="hidden" path="imagepath" value="${pro.imagepath}" />
															<form:input type="hidden" path="productstatus" value="${pro.productstatus}" />
															<form:input type="hidden" path="status" value="${pro.status}" />
															<input type="hidden" name="todo" value="update" />
														</div>
														<div class="adddiv">
															<label class="addlab">產品圖片:</label>
															<form:input id="productimage" type="file" path="productimage" />
														</div>
														<div class="adddiv">
															<button id="addbtn" type="submit" class="btn btn-primary">更新</button>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
            </div>
        </div>
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
			lengthMenu : [100],
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
	
	$('#databtn').click(function() {
		$('#brandname').val("Biotherm");
		$('#producttype').val("保養品");
		$('#productname').val("海洋深層水精油保溼噴霧");
		$('#productseries').val("海洋系列");
		$('#productcategory').val("精華液");
		$('#productprice').val("1230");
		$('#stock').val("50");
	})
	
	function del(no) {
		swal.fire({
			title: '確定刪除商品?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '刪除',
		    cancelButtonText: '取消',
		}).then((result) => {
			  if (result.isConfirmed) {	  
				$.ajax({
					async : true,
					type : 'GET',
					url : 'Delete',
					data : {
						"no":no							
					},
					dataType : "json",
					success : function(data) {
						window.location.reload(false);
					}
				});			
			  }
		})
	}

	function status(no) {
		$.ajax({
			async : true,
			type : 'GET',
			url : 'Statuscheck',
			data : {
				"no":no							
			},
			dataType : "json",
			success : function(data) {
				if(data == true) {
					swal.fire({
							title:'已上架',
				  			icon:'success',
							button: "OK",
				  		})
				} else {
					$('#switchID1' + no).prop("checked", false);
					swal.fire({
							title:'已下架',
				  			icon:'warning',
							button: "OK",
				  	})
				}
			}
		})
	}
	
	function Checkstatus() {
		$.ajax({
			type : 'GET',
			url : 'AllStatus',
			dataType : "json",
			success : function(data) {
				for (let i = 0; i < data.Products.length; i++) {
					if(data.Products[i].status == 0) {
						$('#switchID1' + data.Products[i].productno).prop("checked", false);
					} else {
						$('#switchID1' + data.Products[i].productno).prop("checked", true);
					}
				}
			}
		});
	}
	</script>
</body>
</html>