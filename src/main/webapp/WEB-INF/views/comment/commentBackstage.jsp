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

<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/manager.css"
	TYPE="text/css">
<title>網誌後台</title>
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
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/paper-dashboard.css"
	TYPE="text/css">

<style>
.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}

table {
	text-align: center;
	border: 2px solid blue
}

td {
	border: 1px solid black;
	max-width: 300px;
}

body {
	background-image:
		url(${pageContext.request.contextPath}/image/backstage2.jpg);
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="../jspf/backstage.jspf"%>


	<div id="mytop" class="content"
		style="position: relative; top: 150px; float: right; width: 88%;">
		<h2 style="font-weight: bold; text-align: center;">留言板後臺</h2>



		<br>
		<div class="row">

			<!-- 		 一筆開頭 -->
			<div class="col-lg-3 col-md-6 col-sm-6" style="margin-left: 200px;">
				<div class="card card-stats">
					<div class="card-body ">
						<div class="row">
							<div class="col-9 col-md-4">
								<div class="icon-big text-center icon-warning">
									<i class='fa fa-commenting-o' aria-hidden='true' style='color:blue'></i>


								</div>
							</div>
							<div class="col-7 col-md-8">
								<div class="numbers">
									<h4 class="card-category" style="font-size: x-large;">留言總數</h4>
									<p class="card-title" style="font-size: x-large;"
										id="commentCount"></p>
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
							style="font-weight: bold; text-align: center;">分類比例</h4>
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
<!-- 			<div class="col-md-5"> -->
<!-- 				<div class="card "> -->
<!-- 					<div class="card-header "> -->
<!-- 						<h4 class="card-title" -->
<!-- 							style="font-weight: bold; text-align: center;">TOP5 熱門影片</h4> -->
<!-- 					</div> -->
<!-- 					<div class="card-body "> -->
<%-- 						<canvas id="chartTop"></canvas> --%>
<!-- 					</div> -->
<!-- 					<div class="card-footer "> -->
<!-- 						<hr> -->
<!-- 						<div class="stats"> -->
<!-- 							<i class="fa fa-refresh"></i> Update Now -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>


		<!-- 					<div class="row"> -->
		<!-- 						<div class="col-md-11" style="margin-left: 80px;"> -->
		<!-- 							<div class="card "> -->
		<!-- 								<div class="card-header "> -->
		<!-- 									<h4 class="card-title" -->
		<!-- 										style="font-weight: bold; font-size: x-large;">每週成交量</h4> -->
		<!-- 									<p class="card-category" style="font-size: large;">2020/12月-2021/01月</p> -->
		<!-- 								</div> -->
		<!-- 								<div class="card-body "> -->
		<%-- 									<canvas id="chartWeeks" width="400" height="100"></canvas> --%>
		<!-- 								</div> -->
		<!-- 								<div class="card-footer "> -->
		<!-- 									<hr> -->
		<!-- 									<div class="stats"> -->
		<!-- 										<i class="fa fa-history"></i> Updated 3 days ago -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->

		<p class="container">

			<button class="btn btn-secondary" type="button"
				data-toggle="collapse" data-target="#collapseExample"
				aria-expanded="false" aria-controls="collapseExample">留言清單</button>
		</p>

		<div class="collapse" id="collapseExample">
			<div class="card card-body" style="width: auto; margin-left: 100px;">
				<fieldset
					style="margin: auto; position: relative; top: 10px; width: auto; border: 1px solid transparent;">

					<h4 style="font-weight: bold; text-align: center">留言清單</h4>
					<br>
					<table id="dataTable" class="" class="row">
						<thead>
							<tr>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">留言編號</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">留言類別</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">類別索引</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">留言內容</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">留言者</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">留言時間</th>
								<th
									style="text-align: center; vertical-align: middle; font-size: 18px;"
									scope="col">修改時間</th>
								
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

	</div>

</body>



<!-- 	Kevin:datatable -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript">

//	初始化參數	
var table=document.getElementById("dataTable");
var categoryData;//類別分析
var TopData;//前5名分析

var tb;//準備放datatable的變數
var tr_selected;
var path = "${pageContext.request.contextPath}";

//

//撈取資料
function getData(){
	getTable();
	getCategory();
// 	getTop10();
	//getAnalysis();
			 		
	}	
//

//AJAX新版表格
	function getTable(){
		
		$.ajax({
			
            type: "POST", //傳送方式
            url: "${pageContext.request.contextPath}/AllComment", 
            dataType: "json", //資料格式

            success: function(data) {     
            	console.log('共'+data.length+'筆');
      	        $('#commentCount').append("共"+data.length+"筆");
      	      
            	$('#tbody').empty();
            	
            	//動態表格
// 				<textarea class='contentBox' disabled>"+data[i].contentBox+"<textarea>
				for (let i = 0; i < data.length; i++) {
																	
					$('#tbody').append(
					"<tr>"
					+"<td name='commentId'>"+data[i].commentId+"</td>"
					+"<td>"+data[i].type+"</td>"
					+"<td>"+data[i].keynumber+"</td>"
					+"<td name='content'><textarea class='contentBox' disabled>"+data[i].contentBox+"</textarea></td>"
					+"<td>"+data[i].member.name+"</td>"
					+"<td>"+formatTimeStamp(data[i].commentTime)+"</td>"
					+"<td>"+formatTimeStamp(data[i].editTime)+"</td>"					
					+"<td><button type='button' title='編輯留言'style='border: none;background-color: transparent;' class='editbtn'><i class='fa fa-pencil' aria-hidden='true' style='color:green'></i></button>"										
					+"<button class='delete_btn' title='刪除留言' style='border: none;background-color: transparent;' value='"+data[i].commentId+"'>"
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
	
	
	
//刪除按鈕
	
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
    		            url: "${pageContext.request.contextPath}/deleteComment/"+vid, 
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
    </script>

<script>

//編輯留言
	$(document).on('click','.editbtn',function(){
		
		
		$(this).parent().siblings("td[name='content']").children().removeAttr("disabled");
		
		
	});
	
	
	$(document).on('change','.contentBox',function(){
		
		var commentId=$(this).parent().siblings("td[name='commentId']").text();
//     	blog.css({"color":"red","border":"2px solid red"});
    	
		var contentBox=$(this).val();
		
//     	console.log($(this).val());
    	console.log("commentId="+commentId+",content="+contentBox);
        $.ajax({
            type: "POST", //傳送方式
            url: "${pageContext.request.contextPath}/editComment", 
            dataType: "json", //資料格式
            data: { //傳送資料            	
            	"commentId":commentId,
            	"contentBox":contentBox               
            },
            success: function(data) {
   				
     				swal.fire({
      				  title: "已更新",
      				  text: "留言修改成功",
      				  icon: "success",
      				  button: "OK",
      				});
     				
            },
            error: function(data) {
            	
            	
            	swal.fire({
    				  title: "oops",
    				  text: "留言修改失敗",
    				  icon: "error",
    				  button: "OK",
    				});
              
            }
//             ,$(this).attr("disabled","false");
            
        });
    }) ;
		
    
  //其他資料
  	
	//TOP10
		function getTop10(){
	  
			console.log('取前10圖表');	
			$.ajax({
				
	            type: "GET", //傳送方式
	            url: "${pageContext.request.contextPath}/blog/TopAnalysis", 
	            dataType: "json", //資料格式

	            	success: function(data) {
	            	console.log('取得資料,筆數:'+data.length); 
	            	titles=data.titles;//類別分析
	            	views=data.views;
	            	var ctxB = document.getElementById('chartTop').getContext("2d");
	            	getColor(titles.length);
	            	var myChartB = new Chart(ctxB, {
	            		  type: 'bar', //圖表類型
	            		  data: {
	            		    //標籤
	            		    labels:titles,
	            		    //labels: ${jsonBrandName},
	            		    datasets: [{
	            		      label: '前10名影片', //標籤
	            		      data:views, //資料  
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
  
  
  
  	//類別比例
	function getCategory(){
	  
	  		console.log('取得類型圖表');	
	  		var ctxA = document.getElementById('chartCategory').getContext("2d");
        	getColor(4);
        	var myChartA = new Chart(ctxA, {
        		  type: 'pie', //圖表類型
        		  data: {
        		    //標題
        		    labels:['blog','product','video','comment'],
        		  
        		    datasets: [{
        		      label: '留言類型', //標籤
        		        
        		      data: [21,10,15,13], //資料

        		      backgroundColor: bg_colors,
        		      //圖表外框線色
        		      borderColor:line_colors,
         		    
        		      //外框線寬度
        		      borderWidth: 1
        		    }]
        		  },
        		});
	  		
		
// 			$.ajax({
			
//             type: "GET", //傳送方式
//             url: "${pageContext.request.contextPath}/blog/analysisCategory", 
//             dataType: "json", //資料格式

//             	success: function(data) {
//             	console.log('取得資料,筆數:'+data.length); 
//             	categorys=data.categorys;//類別分析
//             	counts=data.counts;
            	
    	            	            	 		     				
//             },
                     
//         }); 
		

	}

   
   



</script>
<script>
getData();
</script>

</body>

<!-- Js Plugins -->


</html>