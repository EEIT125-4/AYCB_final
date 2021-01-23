<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
	<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/inside.css" TYPE="text/css">

<title>你的影片</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 	=======TEST============ -->
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
<link REL=STYLESHEET HREF="css/paper-dashboard.css" TYPE="text/css">
	
<!-- 	============END TEST=========== -->
	
<style>
table{
text-align: center;
border:2px solid blue

}

td{

border :1px solid black;

}

body{

	background-image:url(${pageContext.request.contextPath}/image/backstage2.jpg);background-size: cover;
}

</style>	
	
</head>



<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentbox" style="background-image: url(${pageContext.request.contextPath}/image/backstage2.jpg);background-size: cover;">
		<%@include file="../jspf/memberPanel.jspf"%>
		<div class="rightoutbox">
			<table id="myDataTable" class="display" style="background:lightblue">
				<thead>
					<tr style='background:green'>
						<!-- 						<th>影片id</th> -->
						<th>預覽圖片</th>
						<th>影片標題</th>
						<th>影片類型</th>
						<th>上傳時間</th>
						<th>觀看次數</th>
						<th>喜歡</th>
						<th>不喜歡</th>
						<th>功能列</th>
						<!-- 						<th>編輯</th> -->

					</tr>
				</thead>


				<tbody id="tbody">

				</tbody>
			</table>
			
			

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




<%-- 		<%@include file="../jspf/footer.jspf"%> --%>


		<!-- Js Plugins -->
		<script type="text/javascript" charset="utf8"
			src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
		<script type="text/javascript">

		var tb;//準備放datatable的變數
		var tr_selected;
		var path = "${pageContext.request.contextPath}";
		var object='video';
		
		
		
		
		function getData(){			
			$.ajax({
					
	            type: "GET", //傳送方式
	            url: "${pageContext.request.contextPath}/video/MyVideoList", 
	            dataType: "json", //資料格式
//		            data: { //傳送資料            	
//		            	"blogId":blogId,
//		            	"state":state                
//		            },
	            success: function(data) {
	            	//pick tbody,產生表格
	            	console.log("取得資料!共"+data.length+"筆");
	            	
	            	$('#tbody').empty();

			
			
					for (let i = 0; i < data.length; i++) {
		// 				<th>預覽圖片</th>
		// 				<th>影片標題</th>
		// 				<th>影片類型</th>
		// 				<th>上傳時間</th>
		// 				<th>觀看次數</th>
		// 				<th>喜歡</th>
		// 				<th>不喜歡</th>
						
						$('#tbody').append(
						"<tr>"
						+"<td><a href='${pageContext.request.contextPath}/video/videoWatch?videoID="+data[i].videoId+"'><img style='width: 100px;height: 100px;' src='"+data[i].coverUrl+"' title='前往影片頁面'></a></td>"
						+"<td>"+data[i].title+"</td>"
						+"<td>"+data[i].category+"</td>"
						+"<td>"+data[i].commentTime+"</td>"
						+"<td>"+data[i].viewCount+"</td>"
						+"<td>"+data[i].thumbsup+"</td>"
						+"<td>"+data[i].thumbsdown+"</td>"
						+"<td><a href='${pageContext.request.contextPath}/video/edit?videoId="+data[i].videoId+"' title='修改影片'><i class='fa fa-pencil' aria-hidden='true' style='color:green'></i></a>"
						+"<button class='showComment' value='"+data[i].videoId +"' data-toggle='modal' data-target='#commentTable' style='border: none;background-color: transparent;'>"
						+"<i class='fa fa-commenting-o' aria-hidden='true' style='color:green'></i></button>"	
						+"<button class='delete_btn' style='border: none;background-color: transparent;' value='"+data[i].videoId+"'>"
						+"<i class='fa fa-trash-o' aria-hidden='true' style='color:green'></i></button>"
// 						<a href='' title='檢視留言'><i class='fa fa-commenting-o' aria-hidden='true' style='color:green'></i></a>
						+"</td>"
						+"</tr>"
		
						);
			
					}	
					var tb=$("#myDataTable").DataTable({
						searching : true,
						columnDefs : [ {
			
							orderable : true,
						} ]
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
		
// 		function setDataTable(){
			
// 			tb= $("#myDataTable").DataTable({
// 				searching : true,
// 				columnDefs : [ {
	
// 					orderable : true,
// 				} ]
// 			});
			
// 		}
		
	
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

// 	            		content+=
// 		            		"<tr><td>"+data[i].member.name+"</td>"	
// 		 	            	+"<td>"+data[i].commentId+"</td>"
// 		 	            	+"<td>"+data[i].contentBox+"</td>"
// 		 	            	+"</tr>"
	            	
	  
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
// 	    		            		var target=$(this).parent().parent();
// 	    		            		target.css({"color":"red","border":"2px solid red"});
	    		            		tb.row('.selected').remove().draw( false );
	    		            	
//	     		            		var target=$(this).parent().parent();
//	     		            		target.css({"color":"red","border":"2px solid red"});
	    		            		
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
//	     				swal.fire({
//	 	    				  title:'取消',
//	 	    				  text: '取消刪除',
//	 	    				  type:'info',
//	 	    				  icon: "info",
//	 	    				  button: "OK",
//	 	    				});  
	    				
	    			}
	    			    			  			
	    		});
	    	
	    });
		
		
		
		
		
		
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
		
		$('#myDataTable tbody').on('click','tr',function(){
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
		
// 		setDataTable();
		getData();
		
			
	
		</script>

	
		<script>
//	var table = document.getElementById("myDataTable");
//	$('#myDataTable').DataTable({
	
//		autoWidth: false,
//		serverSide: true,
//		ajax:{
		
//			url:"video/MyVideoList" ,//請求路徑
//			method: "GET",
//			data: {
//				//請求參數
//				"member": member,

//		},

//	},
//	columns:[
//// 				<th>預覽圖片</th>
//// 				<th>影片標題</th>
//// 				<th>上傳時間</th>
//// 				<th>觀看次數</th>
	
//// 				{"data":'coverUrl'},
//		{"data":'title'},
//		{"data":'category'},
//		{"data":'commentTime'},
//		{"data":'viewCount'},
//		{data:'thumbsup'},
//		{"data":'thumbsdown'},],
//	columnDefs:[]}

//	);

</script>
		</body>

		<!-- Js Plugins -->
</html>