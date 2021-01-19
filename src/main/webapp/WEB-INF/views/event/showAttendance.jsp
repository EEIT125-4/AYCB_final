<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>

<html>
<head>


<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eventpage.css">
<link REL="STYLESHEET" HREF="${pageContext.request.contextPath}/css/manager.css" TYPE="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<title>活動資料</title>

<body>
<!-- <div class="contentoutbox"> -->
<!-- 	<div class="contentbox"> -->
<!-- 		<div class="back"> -->
<!-- 			<div class="title">後臺管理</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="會員" -->
<%-- 					onclick='location.href="${pageContext.request.contextPath}/member/Backstage"'> --%>
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="商品" -->
<%-- 					onclick='location.href="${pageContext.request.contextPath}/MProduct"'> --%>
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="訂單" -->
<%-- 					onclick='location.href="${pageContext.request.contextPath}/orderManager"'> --%>
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="訊息" -->
<!-- 					onclick='location.href="#"'> -->
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="活動" -->
<%-- 					onclick='location.href="${pageContext.request.contextPath}/event/showAttendance"'> --%>
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="留言板" -->
<!-- 					onclick='location.href="#"'> -->
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="部落格" -->
<!-- 					onclick='location.href="blog/backstage"'> -->
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="影音區" -->
<!-- 					onclick='location.href="#"'> -->
<!-- 			</div> -->
<!-- 			<div class="mbtnbox"> -->
<!-- 				<input class="mbtn" type="button" value="廣告區" -->
<%-- 					onclick='location.href="${pageContext.request.contextPath}/advertisement"'> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="backnav"> -->
<%-- 			<%@include file="../jspf/managerheader.jspf"%> --%>
<!-- 		</div> -->
<button  style="width: 120px; background: none;border: 0px" id="showallevent">所有活動</button>
		<div class="backcontent" id="backcontent" >
		
			<c:choose>
					<c:when test='${empty attendances}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		查無報名資料<br>
					</c:when>
					<c:otherwise>
						<table id="mytable">
							<thead>
							<tr>
								<td>帳號</td>
								<td>活動名稱</td>
								<td>mail</td>
								<td>電話號碼</td>
								<td>參加人數</td>
								<td>修改報名資料</td>
								<td>刪除報名資料</td>                             
							</tr>
							</thead>
							<c:forEach var='Attendance' varStatus='vs' items='${attendances}'>
								<tr>
									<td>${Attendance.member.account}</td>
									<td>${Attendance.event.eventname}</td>
									<td>${Attendance.mailaddress}</td>
									<td>${Attendance.phone}</td>
									<td>${Attendance.pax}</td>

									<td><a
										href="<c:url value='update'/>?aid=${Attendance.aid}">編輯</a></td>
									<td><a
										href="<c:url value='delete'/>?aid=${Attendance.aid}">刪除</a></td>
								</tr>

							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>		
    	

		
<!-- 	</div> -->
<!-- </div> -->

				










</body>
<script>

$('#showallevent').click(function() {
	$('#backcontent').load("/AYCB_final/event/backstageshowEvent")
})


//所有參加者
//   $('#eventmanager').click(function() {  
//  	  $.ajax({ 
//  		 async : false,
//     	  url : "ajaxShowAttendance", 
//     	  dataType : "json",
// 		  contentType : "application/json;charset=utf-8", 
//        success : function(data){
//     	   console.log(data.lenth);
//    			var insertData = "";
//    			insertData ="<table id='mytable' class='display'>"
//    				+"<thead>"
//    				+"<tr>" 
// 				+"<th>帳號</th>" 
// 				+"<th>活動名稱</th>" 
// 				+"<th>mail</th>" 
// 				+"<th>電話號碼</th>" 
// 				+"<th>參加人數</th>" 
// 				+"<th>編輯報名資料</th>"
// 				+"<th>修改報名資料</th>"
// 				+"</tr>"
// 				+"</thead>"
//    			for (let i = 0; i < data.length; i++) {
//    				insertData += 	"<tr>" 
//     										+"<td>"+data[i].member.account+"</td>" 
//     										+"<td>"+data[i].event.eventname+"</td>" 
//     										+"<td>"+data[i].mailaddress+"</td>" 
//     										+"<td>"+data[i].phone+"</td>" 
//     										+"<td>"+data[i].pax+"</td>" 
//                                          +"<td><a href='<c:url value='update'/>?aid="+data[i].aid+"'>編輯</a></td>" 
//                                          +"<td><a href='<c:url value='delete'/>?aid="+data[i].aid+"'>刪除</a></td>" 
//                                          +"</tr>"
//                                          +"</table>"
//     				console.log(insertData);  			
//    			}
//    				$("#backcontent").html(insertData);
   			
		  
//  	  }
        	

//          })  
//   }) 

//所有活動
//    $('#showallevent').click(function() {  
//  	  $.ajax({ 
//  		 async : false,
//     	  url : "ajaxShowEvent", 
//     	  dataType : "json",
// 		  contentType : "application/json;charset=utf-8", 
//        success : function(data){
//     	   console.log(data.lenth);
//    			var insertData = "";
//    			insertData ="<table id='mytable' class='display'>"
//    				+"<thead>"
//    				+"<tr>" 
// 				+"<th>活動ID</th>" 
// 				+"<th>活動圖片</th>" 
// 				+"<th>活動名稱</th>" 
// 				+"<th>日期</th>" 
// 				+"<th>地點</th>" 
// 				+"<th>主辦人</th>" 
// 				+"<th>連絡電話</th>" 
// 				+"<th>活動敘述</th>" 
// 				+"<th>名額</th>" 
// 				+"<th>報名人數</th>" 
// 				+"<th>編輯活動資料</th>"
// 				+"<th>刪除活動資料</th>"
// 				+"</tr>"
// 				+"</thead>"
//    			for (let i = 0; i < data.length; i++) {
//    				insertData += 	"<tr>" 
//     										+"<td><a href='<c:url value='showAllAttendanceByEvent'/>?eventid="+data[i].eventid+"'>"+data[i].eventid+"</a></td>" 
//     										+"<td><img width='180' height='200' src="+data[i].filename+"/></td>" 
//     										+"<td>"+data[i].eventname+"</td>" 
//     										+"<td>"+data[i].eventdate+"</td>" 
//     										+"<td>"+data[i].eventlocation+"</td>" 
//     										+"<td>"+data[i].host+"</td>" 
//     										+"<td>"+data[i].hostphone+"</td>" 
//     										+"<td>"+data[i].eventdescription+"</td>" 
//     										+"<td>"+data[i].totalpax+"</td>" 
//     										+"<td>"+data[i].pax+"</td>" 
//                                             +"<td><a href='<c:url value='eventupdate'/>?eventid="+data[i].eventid+"'>編輯</a></td>" 
//                                             +"<td><a href='<c:url value='eventdelete'/>?eventid="+data[i].eventid+"'>刪除</a></td>" 
//                                          +"</tr>"
//                                          +"</table>"
//                   console.log(insertData);  			
//    			}
//    				$("#backcontent").html(insertData);
   			
//  	  }
        	

//          })  
//   }) 

$(document).ready(function () {
    $('#mytable').DataTable({
    	bFilter: true,
    	bPaginate: true, // 顯示換頁
  		searching: true, // 顯示搜尋
  		info:	true, // 顯示資訊
  		fixedHeader: true,  // 標題置頂
		destroy:true,
		language:{
		    "processing": "處理中...",
		    "loadingRecords": "載入中...",
		    "lengthMenu": "顯示 _MENU_ 項結果",
		    "zeroRecords": "沒有符合的結果",
		    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
		    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
		    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
		    "search": "搜尋:",
		    "paginate": {
		        "first": "第一頁",
		        "previous": "上一頁",
		        "next": "下一頁",
		        "last": "最後一頁"
		    },
		    "aria": {
		        "sortAscending": ": 升冪排列",
		        "sortDescending": ": 降冪排列"
		    },
		    "select": {
		        "1": "%d 列已選擇",
		        "2": "%d 列已選擇",
		        "_": "%d 列已選擇"
		    }
		} 
});
});
  
</script>
</html>