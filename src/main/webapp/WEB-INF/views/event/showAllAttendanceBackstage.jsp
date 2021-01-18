<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>


	
<title></title>
</head>
<body>
<div>
				
				<c:choose>
					<c:when test='${empty attendances}'>查無報名資料<br></c:when> 
				<c:otherwise>
							
				<table id="mytable" class="display">				
				  <thead>	
				 <tr> 
				  <th>帳號</th> 
				<th>活動名稱</th> 
				<th>mail</th>
				<th>電話號碼</th>
				<th>參加人數</th> 
				<th >編輯活動資料</th>
				<th >刪除活動資料</th>
				 </tr>
				 </thead>
				 
							<c:forEach var='Attendance'  items='${attendances}'>
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
