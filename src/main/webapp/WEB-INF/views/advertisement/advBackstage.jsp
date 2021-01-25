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
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">

<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/manager.css" TYPE="text/css">	

<title>廣告維護後台</title>
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
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/paper-dashboard.css" TYPE="text/css">
<style>
.content {
    width: 88%;
    float: right;
    margin-top: 150px;
}
</style>
</head>
<%@include file="../jspf/backstage.jspf"%>

<div class="content">
<div style="background-color: #589167;text-align: center;">
	<h1>廣告後台</h1>
	
	<a  href="${pageContext.request.contextPath}/advertisement/edit"><h2>新增廣告</h2></a>
	</div>
	
	
	<table id="myDataTable" class="display">
		<thead>
			<tr>
				<th>id</th>
				<th>標題</th>
				<th>分類</th>
				<th>開始日期</th>
				<th>結束日期</th>
				<th>播放次數</th>
				<th>狀態</th>
				<th>上傳者</th>
				<th>廠商</th>
				

			</tr>
		</thead>

		<tbody id="tbody">
		</tbody>
	</table>
	<div class="row">
						<div class="col-md-11" style="margin-left: 80px;">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title"
										style="font-weight: bold; font-size: x-large;">近期廣告播放次數</h4>
									<p class="card-category" style="font-size: large;">2020/12月-2021/01月</p>
								</div>
								<div class="card-body ">
									<canvas id="chartWeeks" width="400" height="100"></canvas>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-history"></i> Updated 3 days ago
									</div>
								</div>
							</div>
						</div>
					</div>
</div>
</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<!-- 	Kevin:datatable -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>


<script>
//此javascript負責抓資料
function getData(){
	
	$.ajax({
		//Kevin:等資料完成 所以用false
		async : false,
		type : "get",
		url : "${pageContext.request.contextPath}/getAds",
		contentType : "application/json; charset=utf-8",
		dataType : "json",

		success : function(data) {
			
			console.log("轉換前:" + data);

			console.log("資料數" + data.length);
			
			
			
			$('#tbody').empty();

			
			
			for (let i = 0; i < data.length; i++) {
				console.log("data:" + i + data[i].advtitle);
				
				
				$('#tbody').append(
				"<tr>"
				+"<td>"+data[i].advid+"</td>"
				+"<td>"+data[i].advtitle+"</td>"
				+"<td>"+data[i].advcategory+"</td>"
				+"<td>"+data[i].postTime+"</td>"
				+"<td>"+data[i].endTime+"</td>"
				+"<td>"+data[i].advcount+"</td>"
				+"<td>"+data[i].status+"</td>"
				+"<td>"+data[i].member.name+"</td>"
				+"<td>"+data[i].owner+"</td>"
				+"</tr>"

				);
	
			}												
			
		},
		error : function() {
			alert("fail");
		}

	})
		
		
		
		
	}
	
	getData();
	
	
	
	



</script>
<script type="text/javascript">

var table=document.getElementById("myDataTable");

        $(function () {
            $("#myDataTable").DataTable({
                searching: true, 
                columnDefs: [{
                    orderable: true,
                }],
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
        
        
        var ctxC = document.getElementById('chartWeeks').getContext("2d");

    	var myChartC = new Chart(ctxC, {
    		      type: 'line',

    		      data: {
    		        labels: ["12/01-12/7", "12/8-12/14", "12/15-12/21","12/22-12/28","12/29-1/4","1/5-1/11","1/12-1/18","1/19-1/25"],
    		        datasets: [{
    		            borderColor: "#2894FF",
    		            backgroundColor: "	#FF77FF",
    		            pointRadius: 0,
    		            pointHoverRadius: 0,
    		            borderWidth: 3,
    		            data: [241,43,140,51,44,11,202,877]
    		          }
    		        ]
    		      },
    		      options: {
    		        legend: {
    		          display: false
    		        },

    		        tooltips: {
    		          enabled: false
    		        },

    		        scales: {
    		          yAxes: [{

    		            ticks: {
    		              fontColor: "#9f9f9f",
    		              beginAtZero: false,
    		              maxTicksLimit: 5,
    		              //padding: 20
    		            },
    		            gridLines: {
    		              drawBorder: false,
    		              zeroLineColor: "#ccc",
    		              color: '#7B7B7B'
    		            }

    		          }],

    		          xAxes: [{
    		            barPercentage: 1.6,
    		            gridLines: {
    		              drawBorder: false,
    		              color: 'rgba(255,255,255,0.1)',
    		              zeroLineColor: "transparent",
    		              display: false,
    		            },
    		            ticks: {
    		              padding: 20,
    		              fontColor: "#9f9f9f"
    		            }
    		          }]
    		        },
    		      }
    		    });
        
        
    </script>
</body>


</html>