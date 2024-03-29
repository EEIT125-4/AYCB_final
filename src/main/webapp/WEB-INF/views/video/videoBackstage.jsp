<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>


<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">

<title>影片後台</title>
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
<!-- <script src="sweetalert.min.js"></script>  -->
<!-- <link rel="stylesheet" href="sweetalert.css">  -->

<style>
.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}

table{
text-align: center;
/* border:2px solid blue */

}

td{

border :1px solid black;

}

body{

	background-image:url(${pageContext.request.contextPath}/image/backstage2.jpg);
	background-size: repeated;
}

</style>
</head>
<body style="">
	<%@include file="../jspf/backstage.jspf"%>
	<div id="mytop" class="content"
		style="position: relative; top: 150px; float: right; width: 88%;">
		<h2 style="font-weight: bold; text-align: center;">影音後臺</h2>
		
			

				<br>
				<div class="row">

					<!-- 		 一筆開頭 -->
					<div class="col-lg-3 col-md-6 col-sm-6" style="margin-left: 200px;">
						<div class="card card-stats">
							<div class="card-body ">
								<div class="row">
									<div class="col-9 col-md-4">
										<div class="icon-big text-center icon-warning">
											<i class="fa fa-video-camera" aria-hidden="true"
												style="color: red"></i>
										</div>
									</div>
									<div class="col-7 col-md-8">
										<div class="numbers">
											<h4 class="card-category" style="font-size: x-large;">影片總數</h4>
											<p class="card-title" style="font-size: x-large;" id="videoCount">
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer ">
								<hr>
								<div class="stats">
									<i class="fa fa-refresh"></i> Update Now
									<!--安插日期-->
								</div>
							</div>
						</div>
					</div>
							<!-- 		 一筆結尾 -->
					</div>
			

					<div class="row">
						<div class="col-md-5" style="margin-left: 150px;">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title"
										style="font-weight: bold; text-align: center;">影片觀看比例</h4>
								</div>
								<div class="card-body ">
									<canvas id="chartCategory"></canvas>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh"></i> Update Now
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title"
										style="font-weight: bold; text-align: center;">TOP5 熱門影片</h4>
								</div>
								<div class="card-body ">
									<canvas id="chartTop"></canvas>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh"></i> Update Now
									</div>
								</div>
							</div>
						</div>
						</div>
					
					
					<div class="row">
						<div class="col-md-11" style="margin-left: 80px;">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title"
										style="font-weight: bold; font-size: x-large;">近期上傳影片數量</h4>
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

					<p class="container">

						<button class="btn btn-secondary" type="button"
							data-toggle="collapse" data-target="#collapseExample"
							aria-expanded="false" aria-controls="collapseExample">
							影片清單</button>
					</p>

					<div class="collapse" id="collapseExample">
						<div class="card card-body"
							style="width: auto; margin-left: 100px;">
							<fieldset
								style="margin: auto; position: relative; top: 10px; width: auto; border: 1px solid transparent;">

								<h4 style="font-weight: bold; text-align: center">影片清單</h4>
								<br>
								<table id="dataTable" class="" class="row">
									<thead>
										<tr>

											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">影片編號</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">預覽圖片</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">影片標題</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">影片類型</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">上傳者</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">上傳時間</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">觀看次數</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">喜歡</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">不喜歡</th>
											<th
												style="text-align: center; vertical-align: middle; font-size: 18px;"
												scope="col">功能列</th>

										</tr>
									</thead>
									<tbody id="tbody">
									</tbody>
								</table>
								<br>

							</fieldset>
						</div>
					</div>
	
		
		<!-- Modal -->
				<div class="modal fade" id="commentTable" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalTitle">留言列表</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">	
										<div class="caption">											
											<table>
											<thead>
											<tr>
											
											<td>留言者</td>
											<td>留言時間</td>
											<td>留言內容</td>
											
											</tr>
											
											</thead>
											<tbody id='commentBody'>
																	
											</tbody>
											
											
											
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" style="width: 100px;"
												class="btn btn-secondary" data-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>
						</div>

	</div>

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script>
	

// 	初始化參數	
	var table=document.getElementById("dataTable");
	var categoryData;//類別分析
	var TopData;//前5名分析

	var tb;//準備放datatable的變數
	var tr_selected;
	var path = "${pageContext.request.contextPath}";
	var object='video';
//

//撈取資料
function getData(){
	getTable();
	getAnalysis();
			 		
	}	
		
	//表格	
	function getTable(){
		
		$.ajax({
			
            type: "GET", //傳送方式
            url: "${pageContext.request.contextPath}/video/allvideo", 
            dataType: "json", //資料格式

            success: function(data) {     
            	console.log('共'+data.length+'筆');
      	        $('#videoCount').append("共"+data.length+"筆");
      	      
            	$('#tbody').empty();

				for (let i = 0; i < data.length; i++) {
		
					$('#tbody').append(
					"<tr>"
					+"<td>"+data[i].videoId+"</td>"
					+"<td><a href='${pageContext.request.contextPath}/video/videoWatch?videoID="+data[i].videoId+"'><img style='width: 100px;height: 100px;' src='"+data[i].coverUrl+"' title='前往影片頁面'></a></td>"
					+"<td>"+data[i].title+"</td>"
					+"<td>"+data[i].category+"</td>"
					+"<td>"+data[i].member.name+"</td>"
					+"<td>"+data[i].commentTime+"</td>"
					+"<td>"+data[i].viewCount+"</td>"
					+"<td>"+data[i].thumbsup+"</td>"
					+"<td>"+data[i].thumbsdown+"</td>"
					+"<td><a href='${pageContext.request.contextPath}/video/edit?videoId="+data[i].videoId+"' title='編輯影片'><i class='fa fa-pencil' aria-hidden='true' style='color:green'></i></a>"
					+"<button class='showComment' title='檢視留言' value='"+data[i].videoId +"' data-toggle='modal' data-target='#commentTable' style='border: none;background-color: transparent;'>"
					+"<i class='fa fa-commenting-o' aria-hidden='true' style='color:green'></i></button>"	
					+"<button class='delete_btn' title='刪除影片' style='border: none;background-color: transparent;' value='"+data[i].videoId+"'>"
					+"<i class='fa fa-trash-o' aria-hidden='true' style='color:green'></i></button>"
					+"</td>"
					+"</tr>"
	
					);
		
				}	
				var tb=$("#dataTable").DataTable({
					searching : true,
					columnDefs : [ {
		
						orderable : true,
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
				
				console.log("tb"+tb);
				
				
   		     				
            },
            error: function(data) {
            	
            	swal.fire({
    				  title:'請求錯誤',
    				  text: 'server無回應,聯絡管理員',
    				  icon: "error",
    				  button: "OK",
    				});        		
            	}               
        }) 
		
		
	}
	
	//獲取留言
	$(document).on('click','.showComment',function(){
		console.log('show comment');
		console.log('btn value='+$(this).val());

		$('#commentBody').empty();
		
		
		$.ajax({
			async:false,
            type: "POST", //傳送方式
            url: path + "/loadComment?key=" +$(this).val() + "&type=" + object, 
            
            dataType: "json", //資料格式
	    
            success: function(data) {
            	console.log('取得資料成功,留言數:'+data.comments.length);
            	let content='';
            	for(let i=0;i<data.comments.length;i++){
            		
            	$('#commentBody').append(
            	"<tr><td>"+data.comments[i].member.name+"</td>"	
            	+"<td>"+formatTimeStamp(data.comments[i].commentTime)+"</td>"
            	+"<td>"+data.comments[i].contentBox+"</td>"
            	+"</tr>");

//	            		content+=
//		            		"<tr><td>"+data[i].member.name+"</td>"	
//		 	            	+"<td>"+data[i].commentId+"</td>"
//		 	            	+"<td>"+data[i].contentBox+"</td>"
//		 	            	+"</tr>"
            	
  
            	}
          
            	
            	
            	
            },error: function(){
            	alert('取得留言失敗');
            	
            }
			
		});
		
	});
	
	//刪除video按鈕
	
    $(document).on('click','.delete_btn',function() {
    
    	var vid=$(this).val();
    	console.log('delete id='+vid);
    	
    	
    	swal.fire({ 
    		  title: '確定刪除?', 
    		  text: '將無法恢復此筆資料', 
    		  type: 'warning',
    		  showCancelButton: true, 
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: '刪除', 
    		}).then((result)=>{
    			if(result.isConfirmed){
    				
    				$.ajax({
    		            type: "POST", //傳送方式
    		            url: "${pageContext.request.contextPath}/video/delete?vid="+vid, 
    		            dataType: "json", //資料格式
          

    		            success: function(data) {
    		            	if(data){
    		            		swal.fire({
      		      				  title: "已刪除",
      		      				  text: "狀態變更",
      		      				  icon: "success",
      		      				  button: "OK",
      		      				});
    		            		console.log("this="+$(this));
//	    		            		var target=$(this).parent().parent();
//	    		            		target.css({"color":"red","border":"2px solid red"});
								let tb=$("#dataTable").DataTable();
    		            		tb.row('.selected').remove().draw( false );
    		            	
//     		            		var target=$(this).parent().parent();
//     		            		target.css({"color":"red","border":"2px solid red"});
    		            		
    		            	}else{
    		            		
    		            	 	swal.fire({
      		    				  title:'刪除失敗',
      		    				  text: '資料刪除過程中現異常,請聯絡管理員',
      		    				  icon: "error",
      		    				  button: "OK",
      		    				});        		
    		            	}
			   		     				
    		            },
    		            error: function(data) {
    		            	
    		            	swal.fire({
    		    				  title:'請求錯誤',
    		    				  text: 'server無回應,聯絡管理員',
    		    				  icon: "error",
    		    				  button: "OK",
    		    				});        		
  		            	}   		            	            	    		              		           
    		        }) ;
  				
    			}else{
    				console.log('取消刪');
//     				swal.fire({
// 	    				  title:'取消',
// 	    				  text: '取消刪除',
// 	    				  type:'info',
// 	    				  icon: "info",
// 	    				  button: "OK",
// 	    				});  
    				
    			}
    			    			  			
    		});
    	
    });
	
  //獲取目前被選取的row
	
	$('#dataTable tbody').on('click','tr',function(){
		if($(this).hasClass('selected')){
			
			 $(this).removeClass('selected');
			 console.log('remove select');
		}else {
			if(tr_selected!=null){
				tr_selected.removeClass('selected');
			}
			
			
			tr_selected=$(this);
			

            $(this).addClass('selected');
            console.log('add select');
          
        }		
		
	});
	
	//轉換時間格式
	function formatTimeStamp(time) {
		var time = new Date(time);
		var date = (
			(time.getFullYear()) + "-" +
			(time.getMonth() + 1) + "-" +
			(time.getDate()) + " " +
			(time.getHours()) + ":" +
			(time.getMinutes())
			// 	               + ":" +(time.getSeconds())
		);
		return date;
	}
	
	//隨機取色
	var bg_colors;
	var line_colors;
	
	function getColor(num){
		bg_colors=[];
		line_colors=[];
		
		for(let i=0;i<num;i++){
			 	
			 
			 let rgb = [];
			 for (let i = 0; i < 3; i++) {
		         rgb[i] = parseInt(Math.random() * 256);
		          console.log(rgb[i]);
		     };
		     let color="rgba("+rgb[0]+","+rgb[1]+","+rgb[2]+",0.2)";         
			 bg_colors.push(color);
			 color="rgba("+rgb[0]+","+rgb[1]+","+rgb[2]+",1.0)";
			 line_colors.push(color);	 
//		 	 console.log("json_title"+blogJson[i].title);
		}
		
		
		
	}
	
	
	//其他資料
	function getAnalysis(){
		
			$.ajax({
			
            type: "GET", //傳送方式
            url: "${pageContext.request.contextPath}/video/analysis", 
            dataType: "json", //資料格式

            	success: function(data) {
            	
            	categoryData=data.vbc;//類別分析
            	
            	var ctxA = document.getElementById('chartCategory').getContext("2d");
            	getColor(categoryData.categorys.length);
            	var myChartA = new Chart(ctxA, {
            		  type: 'pie', //圖表類型
            		  data: {
            		    //標題
            		    labels:categoryData.categorys,
            		  
            		    datasets: [{
            		      label: '影片分佈', //標籤
            		        
            		      data: categoryData.categoryviews, //資料
            		      //圖表背景色
//             		      backgroundColor: [
//             		        'rgba(255, 99, 132, 0.2)'
//             		      ],
            		      backgroundColor: bg_colors,
            		      //圖表外框線色
            		      borderColor:line_colors,
//             		      borderColor: [
//               		        'rgba(255, 99, 132, 1)'

//               		      ],
            		      //外框線寬度
            		      borderWidth: 1
            		    }]
            		  },

            		});
            	
            	TopData=data.top;//前5名分析
            	
            	var ctxB = document.getElementById('chartTop').getContext("2d");
            	getColor(TopData.names.length);
            	var myChartB = new Chart(ctxB, {
            		  type: 'bar', //圖表類型
            		  data: {
            		    //標籤
            		    labels:TopData.names,
            		    //labels: ${jsonBrandName},
            		    datasets: [{
            		      label: '前五名影片', //標籤
            		      data: TopData.views, //資料  
            		      //data: ${jsonBrandCount}, //資料
            		      //圖表背景色
            		      backgroundColor:bg_colors ,
            		      //圖表外框線色
            		      borderColor:line_colors ,
            		      //外框線寬度
            		      borderWidth: 1
            		    }]
            		  },
            		  options: {
            		    scales: {
            		      yAxes: [{
            		        ticks: {
            		          beginAtZero: true,
            		          responsive: true //符合響應式
            		        }
            		      }]
            		    }
            		  }
            		});
            	            	            	            	 		     				
            },
                     
        }); 
		

	}
	
	getData();
	

	
	
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
		            data: [3,2,0,0,0,1,2,4]
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