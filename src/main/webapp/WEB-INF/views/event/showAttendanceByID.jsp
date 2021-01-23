<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
	
<html>
<head>


<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventpage.css">
<title>活動資料</title>

<%@include file="../jspf/header.jspf"%>

<div class="container" style="margin-bottom: 80px">
		<h2>已報名活動</h2>
		<c:choose>
		<c:when test='${empty attendancelist}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		查無報名資料<br>
		</c:when>
		<c:otherwise>
			<table id="mytable" class="display">
			<thead>
				<tr>
					<th align="center" valign="middle">活動圖片</th>
					<th align="center" valign="middle" width="">活動ID</th>			
					<th align="center" valign="middle" width="">活動名稱</th>			
					<th align="center" valign="middle">日期</th>
					<th align="center" valign="middle">地點</th>								
<!-- 					<td align="center" valign="middle">帳號</td>	 -->
					<th align="center" valign="middle">mail</th>
					<th align="center" valign="middle">電話號碼</th>
					<th align="center" valign="middle">報名人數</th>
					<th align="center" valign="middle">修改報名資料</th>
					<th align="center" valign="middle">修改報名資料</th>
					
				</tr>
			</thead>	
				<c:forEach var='Attendance' varStatus='vs' items='${attendancelist}'>
					<tr>
						<td align="center" style="vertical-align:middle;"><img width='180' height='200' src='${Attendance.event.filename}' /></td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventid}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventname}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventdate}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventlocation}</td>
<%-- 						<td align="center" style="vertical-align:middle;">${Attendance.member.account}</td> --%>
						<td align="center" style="vertical-align:middle;">${Attendance.mailaddress}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.phone}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.pax}</td>
						<td align="center" style="vertical-align:middle;"><a href="<c:url value='update'/>?aid=${Attendance.aid}" class="btn btn-primary" style="width: 150px ;background-color: grey; border: none;">更改報名資訊</a></td>
                        <td align="center" style="vertical-align:middle;"><a href="<c:url value='delete'/>?aid=${Attendance.aid}&eventid=${Attendance.event.eventid}&id=${Attendance.member.id}" class="btn btn-primary" style="width: 100px ;background-color: grey;border: none;">取消報名</a></td>
<%--                class='deletelink'         ${Attendance.aid} --%>
					</tr>
					
				</c:forEach>
			</table>
		</c:otherwise>
		</c:choose>
		<p />
<%-- 		<a href="<c:url value='attendanceForm'/>">回到報名</a> --%>
	
</div>

<%@include file="../jspf/footer.jspf"%>
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