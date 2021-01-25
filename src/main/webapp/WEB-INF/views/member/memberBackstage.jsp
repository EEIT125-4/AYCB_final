<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
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



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="UTF-8">
<meta name="description" content="blog">
<meta name="keywords" content="blog, article, share, write">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>

/*停權開關*/
.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 24px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
	border-radius: 34px;
}

.slider:before {
	/* 未開顏色 */
	position: absolute;
	content: "";
	height: 20px;
	width: 20px;
	left: 2px;
	top: 2px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
	border-radius: 50%;
}

input:checked+.slider {
	/* 以開顏色 */
	background-color: lightpink;
}

input:checked+.slider:before {
	/* 按鈕顏色 */
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
</style>
<script>
$(document).ready(function(){
	
  	Gender();
 	Month();
 	MemberTotal();
 	Monthbirth();
});


</script>


<title>會員後台管理</title>
</head>
<body>
	<%@include file="../jspf/backstage.jspf"%>





	<div class="content"
		style="width: 88%; float: right; margin-top: 250px;">
		
<div class="row">
<div class="col-lg-3 col-md-6 col-sm-6" style="margin-left: 200px;">
            <div style="width:420px" class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-9 col-md-4">
                    <div class="icon-big text-center icon-warning">
                  <i class="fa fa-user" aria-hidden="true" style="color:#B8B8FF"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <h4 class="card-category" style="font-size:x-large;">會員總數</h4>
                      <p class="card-title" id="membertotal" style="font-size:x-large;">共筆<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>
                  Update Now <!--安插日期-->
                </div>
              </div>
            </div>
          </div>	
          
          
          
          <div class="col-lg-3 col-md-6 col-sm-6" style="margin-left: 200px;">
            <div style="width:420px" class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-9 col-md-4">
                    <div class="icon-big text-center icon-warning">
                 <i class="fa fa-birthday-cake" aria-hidden="true" style="color:pink"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <h4 class="card-category" style="font-size:x-large;">當月生日</h4>
                      <p class="card-title" id="monthbirth" style="font-size:x-large;">共筆<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>            
                  Update Now <!--安插日期-->
                </div>
              </div>
            </div>
          </div>	
          </div>
          
          			
		<div class="row">
		<div style="width: 530px; margin-left: 120px">
			<div style="font-size: 50px">男女比例</div>
			<canvas id="gender" width="800" height="600"></canvas>
			</div>
			<div style="width: 530px; margin-left: 120px">
			<div style="font-size: 50px">註冊人數</div>
			<canvas class="card" id="month" width="800" height="600"></canvas>
		</div>
		</div>
		<div style="width: 1300px; margin-left: 30px">
			<table id="myDataTalbe" class="display">
				<thead class="thead-light">
					<tr>
						<th scope="col">會員ID</th>
						<th scope="col">名稱</th>
						<th scope="col">帳號</th>
						<th scope="col">信箱</th>
						<th scope="col">手機</th>
						<th scope="col">生日</th>
						<th scope="col">地址</th>
						<th scope="col">權限</th>
						<!--             <th scope="col">刪除</th> -->
					</tr>
				</thead>
				<tbody>

					<c:forEach var="member" items='${memberBackstage}'>
						<tr>
							<th scope="row" >${member.id}</th>
							<td>${member.name}</td>
							<td>${member.account}</td>
							<td>${member.email}</td>
							<td>${member.phone}</td>
							<td>${member.birth}</td>
							<td>${member.address}</td>
							<td><label class="switch"> <input type="checkbox">
									<span class="slider" checkType="${member.ckpower}"></span>
							</label></td>
							

							
							<%-- 			<td><form id="delete" action="<c:url value="delete" />"><button type=button id=checkde  >刪除</button> --%>
							<%-- 			<input type=hidden id=check name=delete value="${member.id}"> --%>
							<!-- 			</form></td> -->
						</tr>
					</c:forEach>


				</tbody>
			</table>

		</div>
	</div>
</body>



<c:if test="${not empty member }">

</c:if>




<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript">







$(function() {
	$("#myDataTalbe").DataTable({
		lengthMenu : [50],
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





    $(document).ready(function(){	
		$(".slider").each(function(){
		if($(this).attr("checktype") == 'true'){
		$(this).click();
		}
		$(this).click(function(){
		let s = $(this);
		console.log("++++++++++++++++")
		console.log("11111111111111"+s.parent().parent().parent().children('th').eq(0).html());
		
		$.ajax({
		url:"${pageContext.request.contextPath}/member/ckpower2",
		data:{
		'id':  s.parent().parent().parent().children('th').eq(0).html() },
		type:"POST",
		success:function(){
		if(s.attr("checktype") == 'true'){
		s.attr("checktype", "false");
		}
		else{
		s.attr("checktype", "true");
		}
		}
		})
		})
		})
})




function Gender(){
		var g = document.getElementById('gender');
			$.ajax({
				type : 'GET',
				url : "gender",
				dataType : "json",
				success : function(data) {
					var gender = new Chart(g, {
						type : 'pie', //圖表類型
						data : {
							//標題
							labels : ["男","女"],
							datasets : [ {
								label : '#test', //標籤
								data : data, //資料
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
// 						options : {
// 							scales : {
// 								yAxes : [ {
// 									ticks : {
// 										beginAtZero : true,
// 										responsive : true
// 										//符合響應式
// 									}
// 								} ]
// 							}
// 						}
					});
				}
			});
		
	}



function Month(){
	console.log("1111111111111111111");
	var k = document.getElementById('month');
		$.ajax({
			type : 'GET',
			url : "monthtotal",
			dataType : "json",
			success : function(data) {
				console.log("+++++++++++++++++++++++");
				var month = new Chart(k, {
					type : 'bar', //圖表類型
				
					data : {
						//標題
						labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
						datasets : [ {
							label : '註冊月份人數', //標籤
							data : data, //資料
							//圖表背景色
							backgroundColor : [ 
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 185, 15, 0.2)',
									'rgba(155, 255, 155, 0.2)',
									'rgba(153, 50, 204, 0.2)',
									'rgba(255, 140, 0, 0.2)',
									'rgba(72, 61, 139, 0.2)',
									'rgba(139, 101, 8, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 185, 15, 0.2)',
									'rgba(155, 255, 155, 0.2)'],
							//圖表外框線色
							borderColor : [ 
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 185, 15, 1)',
									'rgba(155, 255, 155, 1)',
									'rgba(153, 50, 204, 1)',
									'rgba(255, 140, 0, 1)',
									'rgba(72, 61, 139, 1)',
									'rgba(139, 101, 8, 1)',
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 185, 15, 1)',
									'rgba(155, 255, 155, 1)'],
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



	function MemberTotal() {
		$.ajax({
			type : 'GET',
			url : "membertotal",
			dataType : "json",
			success : function(data) {
				$("#membertotal").html(data);
			}
		});
	}



	function Monthbirth() {
		$.ajax({
			type : 'GET',
			url : "monthbirth",
			dataType : "json",
			success : function(data) {
				$("#monthbirth").html(data);
			}
		});
	}

	
	
</script>
</body>

<!-- Js Plugins -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>


</html>