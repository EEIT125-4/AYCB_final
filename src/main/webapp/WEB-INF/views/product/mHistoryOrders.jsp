<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%
	String user = "";
boolean editable = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	user = member.getName();
	System.out.println("顧客名稱: " + user);
	editable = true;
}
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">

<title>訂單後台</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
<!-- <script src="sweetalert.min.js"></script>  -->
<!-- <link rel="stylesheet" href="sweetalert.css">  -->

<style>
.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}
.top {
		color: white;
		background: #FF2D2D;
		padding: 14px 10px;
		position: fixed;
		right: 20px;
		bottom: 100px;
		text-align: center;
		border-radius: 50px;
		z-index: 1;
	}
</style>
<body style="">
	<%@include file="../jspf/backstage.jspf"%>
<div id="mytop" style="position: relative;top: -650px;">
	<h2 style="font-weight: bold; text-align: center;">訂單管理後台</h2>
	<c:choose>
		<c:when test="${empty AllOrders}">
			查無資料<br>
		</c:when>
		<c:when test="${not empty AllOrders }">
<!-- 			<hr> -->
			<br>
			<div style="text-align: center;font-size: 25px;">
			<span class="">訂單總數:</span>
			<span class="">${size}</span>
			</div>
			<br>
			<br>
			<div style="width: 800px; height: 600px;margin: auto;border: 2px solid red;">
			<br>
			<br>
				<h4 style="font-weight: bold; text-align: center;">訂單品牌總覽</h4>
				<br>
				
				<canvas id="myChart"></canvas><br>
			<br>
			<br>
			</div>
			<br>
			<p class="container">
			
			  <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			    	管理訂單
			  </button>
			</p>
			<div class="collapse" id="collapseExample">
  				<div class="card card-body">
			<fieldset
				style="margin: auto; position: relative; top: 10px; width: 1000px; border: 1px solid transparent;">
				<form action="<c:url value='/Manager' />" method="get">
					<h4 style="font-weight: bold; text-align: center" >歷史訂單</h4>
					<br>
					<table id="dataTable" class="table table-hover">
						<thead>
							<tr>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">訂單編號</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">顧客姓名</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">總價</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">訂購時間</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">訂單狀態</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">明細</th>
								<th style="text-align: center; vertical-align: middle;"
									scope="col">取消訂單</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" varStatus='vs' items="${AllOrders}">
								<c:choose>
									<c:when test='${vs.count % 2 == 0}'>
										<c:set var='color' value='#FFFFFF' />
									</c:when>
									<c:otherwise>
										<c:set var='color' value='#F0F0F0' />
									</c:otherwise>
								</c:choose>
								<%-- 								<input id="${row.orderNo}" type="hidden" value="${row.orderNo}"> --%>
								<tr bgcolor='${color}'>
									<td style="text-align: center; vertical-align: middle;"
										scope="row">${row.orderNo}</td>
									<td style="text-align: center; vertical-align: middle;">${row.customerId}</td>
									<td style="text-align: center; vertical-align: middle;">${row.totalAmount}</td>
									<td style="text-align: center; vertical-align: middle;">${row.orderDate}</td>
									<td style="text-align: center; vertical-align: middle;"><select id="s1"
										class="status">
											<option value="1-${row.orderNo}">${row.status}</option>
											<option>------------</option>
											<option value="2-${row.orderNo}">已出貨</option>
											<option value="3-${row.orderNo}">訂單完成</option>
									</select></td>
									<td style="text-align: center; vertical-align: middle;"><button type="button" class="btn btn-info" style="font-size: 14px;">
									<a href="<c:url value="/managerSelectOrderItem?selectindex=${row.orderNo}"/>" style="color: white;">商品清單</a></button></td>
									<td style="text-align: center; vertical-align: middle;"><input
										type="button" class="btn btn-danger"
										onclick='cancel(${row.orderNo})' value="取消 "></td>
									<%-- 									 href="<c:url value="/managerOrderDelete?deleteindex=${row.orderNo}"/> " --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
				</form>
			</fieldset>
			  </div>
		</div>
		</c:when>
	</c:choose>
	<br>
					<div style="text-align: center;">
						<input class="btn btn-dark" type="submit" value="回後台">						
					</div>
	
	
<!-- <a href=#mytop><div class="top">TOP</div></a> -->
<a onclick="goTop();"><div class="top">TOP</div></a>
<br>
<br>
<br>
</div>
<%@include file="../jspf/footer.jspf"%>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script>

	function goTop(){
		var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
		$body.animate({
			scrollTop: 0
		}, 200);
	}
	
		
	var table=document.getElementById("dataTable");
	
	$(function () {
	
	    $("#dataTable").DataTable({
	        searching: true, 
	        columnDefs: [{
	//             targets: [10],
	            orderable: true,
	        }]
	    });
	});
	
	function cancel(i) {
		console.log(i)
		Swal.fire({
			  title: '是否取消訂單?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '確定',
		      cancelButtonText: '取消'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
					$.ajax({
						async : true,
						type : 'GET',
						url : 'managerOrderDelete',
						data : {
							"deleteindex":i							
						},
						dataType : "json",
						success : function(data) {
							  Swal.fire({
						    		icon:'success',
						    		title:'取消訂單成功!',
						    		showConfirmButton: false,
						    		timer: 1500
						    })	
// 							window.location.href = "http://localhost:8080/AYCB_final/orderManager";
							window.location.reload(false);
						    
						}
					});			
			  }
			})
	}					

	

		
		$(".status").change(function(){
			var xhr = new XMLHttpRequest();
			console.log("sta");
			console.log($(this).val());
			xhr.open("GET", '<c:url value="/pickOrderUpdate/" />' + $(this).val()
					, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var bollean = JSON.parse(xhr.responseText);
					if (bollean =! false){
						Swal.fire({
							  icon: 'success',
							  title: '更新完成',
							  showConfirmButton: false,
							  timer: 1500
							})
					}else{
						window.alert ("更新失敗");
					}
				}
			}
		})
	
	
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		  type: 'pie', //圖表類型
		  data: {
		    //標題
		    //labels:["Biotherm", "olay", "Dr.Morita" , "Origins"],
		    labels: ${jsonBrandName},
		    datasets: [{
		      label: '# test', //標籤
		      //data: ["21", "2", "2", "2"], //資料  
		      data: ${jsonBrandCount}, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',

		      ],
		      //外框線寬度
		      borderWidth: 1
		    }]
		  },
// 		  options: {
// 		    scales: {
// 		      yAxes: [{
// 		        ticks: {
// 		          beginAtZero: true,
// 		          responsive: true //符合響應式
// 		        }
// 		      }]
// 		    }
// 		  }
		});
</script>

</body>
</html>