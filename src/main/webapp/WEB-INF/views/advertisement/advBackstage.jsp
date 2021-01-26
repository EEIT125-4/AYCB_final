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
</head>
<%@include file="../jspf/backstage.jspf"%>

<div class="content">
<div style="background-color: #589167;text-align: center;">
	<h1>廣告後台</h1>
	
	<a  href="${pageContext.request.contextPath}/advertisement/edit"><h2>新增廣告</h2></a>
	</div>
	
	
	<table id="dataTable" class="display">
		<thead>
			<tr>
				<th>id</th>
				<th >標題</th>
				<th>分類</th>
				<th>開始日期</th>
				<th>結束日期</th>
				<th>播放次數</th>
				<th>強制秒數</th>
				<th>狀態</th>
				<th>上傳者</th>
				<th>廠商</th>
				<th>功能</th>
				

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


var tr_selected;

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
				+"<td style='max-width: 200px;'>"+data[i].advid+"</td>"
				+"<td>"+data[i].advtitle+"</td>"
				+"<td>"+data[i].advcategory+"</td>"
				+"<td>"+data[i].postTime+"</td>"
				+"<td>"+data[i].endTime+"</td>"		
				+"<td>"+data[i].advcount+"</td>"
				+"<td><input type='number' class='second' min='0' max='10' value="+data[i].advlength+"></td>"
				+"<td><label class='switch'> <input type='checkbox' value="+data[i].status+">"
				+"<span class='slider' checkType='"+data[i].status+"'></span>"
				+"</label></td>"
				+"<td>"+data[i].member.name+"</td>"
				+"<td>"+data[i].owner+"</td>"
				+"<td><a href='${pageContext.request.contextPath}/video/edit?videoId="+data[i].videoId+"' title='編輯廣告'><i class='fa fa-pencil fa-2x' aria-hidden='true' style='color:green'></i></a>"	
				+"<button class='delete_btn' title='刪除廣告' style='border: none;background-color: transparent;' value='"+data[i].advid+"'>"
				+"<i class='fa fa-trash-o fa-2x' aria-hidden='true' style='color:green'></i></button>"
				+"</td>"
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



        $(function () {
            $("#dataTable").DataTable({
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
    	
    	//修改強制秒數
    	$(document).on('change','.second',function(){
    		
    		let index=$(this).parent().siblings().eq(0);
    		console.log('second='+$(this).val());
//     		index.css("background","red");
    		console.log('index'+index.text());
    		if($(this).val()<0 || $(this).val()>10){
    			
    			Swal.fire({
  				  icon: 'error',
  				  title: '請輸入0~10之間的數值',
  				icon: "error",
				  button: "OK",
  				});
    			
    			$(this).val(0);
    	
    			
    		}else{
    			console.log('合法');
    			
    			$.ajax({
    				
    	            type: "POST", //傳送方式
    	            url:"${pageContext.request.contextPath}/modifyAdsLength", 
    	            
    	            dataType: "json", //資料格式
    	            data:{
    	            "adsID":index.text(),
    	            "length":$(this).val()	
    	            },
    		    
    	            success: function(data) {
    	            	console.log('成功');
    	            
    	           
    	             	
    	            },error: function(){
    	            	alert('失敗');
    	            	
    	            	
    	            }
    				  				
    			})
    					
    		}
  		
    	});
    	
    	
    	//開啟按鈕
    	
    	 $(document).ready(function(){
    		 
			$(".slider").each(function(){
				console.log('目前狀態:'+$(this).attr("checktype"));
				if($(this).attr("checktype") == 'true'){
					$(this).click();
					console.log('檢查狀態:'+$(this).attr("checktype"));
				}
				
		$(this).click(function(){
		
			let s = $(this);
			
// 			s.parent().parent().parent().children().eq(0).css('background','red');
		
		let adsID=s.parent().parent().parent().children().eq(0).text();
		console.log("ID:"+adsID);
		
		let status=$(this).attr("checktype");
		console.log("變更前:"+status);
		if(status=='true'){
			
			status='false';
		}else{
			
			status='true';
		}
		
		console.log('變更狀態為:'+status);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/switchAds",
			type:"POST",
			data:{
					'adsID': adsID,
					'status': status
				},
					
				success:function(){
					
					if(s.attr("checktype") == 'true'){
						s.attr("checktype", "false");
					
						}
						else{
						s.attr("checktype", "true");
						}
					console.log('修改成功');
// 					swal.fire({
// 	      				  title: "success",
// 	      				  text: "狀態變更",
// 	      				  icon: "success",
// 	      				  button: "OK",
// 	      				});
					},
					error:function(){
						
						swal.fire({
		      				  title: "fail",
		      				  text: "未變更",
		      				  icon: "error",
		      				  button: "OK",
		      				});
						
					}
				});
			});
		})
});
    	
    		//轉換時間格式
 		function formatTimeStamp(time) {
 			var time = new Date(time);
 			var date = (
 				(time.getFullYear()) + "-" +
 				(time.getMonth() + 1) + "-" +
 				(time.getDate()));
 			return date;
 		}
    	
    	
    	//刪除廣告按鈕
    		
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
    	    		            url: "${pageContext.request.contextPath}/deleteAds", 
    	    		            dataType: "json", //資料格式
    	    		            data:{"adsID":vid},
    	          

    	    		            success: function(data) {
    	    		            	if(data){
    	    		            		swal.fire({
    	      		      				  title: "已刪除",
    	      		      				  text: "狀態變更",
    	      		      				  icon: "success",
    	      		      				  button: "OK",
    	      		      				});
    	    		            		console.log("this="+$(this));

    									let tb=$("#dataTable").DataTable();
    	    		            		tb.row('.selected').remove().draw( false );
    	    		            	

    	    		            		
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
    	    				console.log('取消刪除');

    	    				
    	    			}
    	    			    			  			
    	    		});
    	    	
    	    });
        
        
    </script>
</body>


</html>