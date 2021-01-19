<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<link REL="STYLESHEET" HREF="${pageContext.request.contextPath}/css/manager.css" TYPE="text/css">
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>


	
<title></title>
</head>
<body>
<div class="backcontent" id="backcontent">
				
				<c:choose>
					<c:when test='${empty events}'>查無報名資料<br></c:when> 
				<c:otherwise>
							
				<table id="mytable" class="display">				
				  <thead>	
				 <tr> 
				   <th>活動ID</th>
				   <th>活動圖片</th> 
				   <th>活動名稱</th> 
				   <th>日期</th>
				   <th>地點</th>
				   <th>主辦人</th>
				   <th>聯絡電話</th>
				   <th>活動敘述</th> 
				   <th>名額</th> 
				   <th>報名人數</th> 
				   <th >編輯活動資料</th>
				   <th >刪除活動資料</th>
				 </tr>
				 </thead>
				 
							<c:forEach var='event' varStatus='vs' items='${events}'>
								<tr>
								<td>
<%-- 								<a href="<c:url value='showAllAttendanceByEvent'/>?eventid=${event.eventid}"><button id="showattendancebyevent">${event.eventid}</button></a> --%>
								<input type=button id="showattendancebyevent${event.eventid}" value="${event.eventid}">
								<input type=hidden id="test${event.eventid}" value="${event.eventid}">
								</td> 
    										<td><img width='180' height='200' src='${event.filename}'/></td> 
    										<td>${event.eventname}</td> 
    										<td>${event.eventdate}</td>
    										<td>${event.eventlocation}</td>
    										<td>${event.host}</td>
    										<td>${event.hostphone}</td> 
    										<td>${event.eventdescription}</td> 
    										<td>${event.totalpax}</td> 
    										<td>${event.pax}</td> 
                                            <td><a href="<c:url value='eventupdate'/>?eventid=${event.eventid}">編輯</a></td>    
                                            <td> <a href="<c:url value='eventdelete'/>?eventid=${event.eventid}">刪除</a></td> 
                                </tr> 

<%-- 							<input type="hidden" value="${event.eventid}" id="eventid" class="evnetid"> --%>
<script>
$('#showattendancebyevent${event.eventid}').click(function(){
	var eventid = $('#test${event.eventid}').val();
	console.log(eventid);
	$('#backcontent').load("http://localhost:8080/AYCB_final/event/showAllAttendanceByEvent?eventid="+eventid)
})
</script>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			
		
</body>
<script>
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
