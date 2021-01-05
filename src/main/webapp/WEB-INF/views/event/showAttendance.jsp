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
		<div>
			<div
				style="float: left; width: 20%; text-align: center; margin-left: 220px;">

				<dl>
					<dt>
						<h2>預約活動</h2>
					</dt>
					<hr width=70% size=1 color=#BFBFBF
						style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)">
					<dt class="a1">
						<A href="showEvent">
							<h2>活動介紹</h2>
						</A>
					</dt>
					<dt class="a1">
						<a href="<c:url value='showAllAttendanceByID'/>?id=${member.id}"><h2>查詢會員報名</h2></a>	
					</dt>
					<dt class="a1">
						<A href='showAttendance'><h2>查詢報名</h2></A>	
					</dt>

				</dl>
			</div>
		</div>
	
	
		<h1>報名資料</h1>
		<c:choose>
		<c:when test='${empty attendances}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		查無報名資料<br>
		</c:when>
		<c:otherwise>
			<table border='1' >
				<tr>				
					<td>帳號</td>
					<td>活動名稱</td>
					<td>mail</td>
					<td>電話號碼</td>
					<td>參加人數</td>
					<td colspan="2">修改報名資料</td>
					
				</tr>
				<c:forEach var='Attendance' varStatus='vs' items='${attendances}'>
					<tr>
						<td>${Attendance.member.account}</td>
						<td>${Attendance.event.eventname}</td>
						<td>${Attendance.mailaddress}</td>
						<td>${Attendance.phone}</td>
						<td>${Attendance.pax}</td>

						<td><a href="<c:url value='update'/>?aid=${Attendance.aid}">編輯</a></td>
                        <td><a href="<c:url value='delete'/>?aid=${Attendance.aid}">刪除</a></td>
<%--                class='deletelink'         ${Attendance.aid} --%>
					</tr>
					
				</c:forEach>
			</table>
		</c:otherwise>
		</c:choose>
		<p />
		<a href="<c:url value='attendanceForm'/>">回到報名</a>
	
</div>

<%@include file="../jspf/footer.jspf"%>
</body>
<!-- 	<script type='text/javascript'> -->
<!--     $(document).ready(function() {    	 -->
<!--         $('.deletelink').click(function() { -->
<!--         	if (confirm('確定刪除此筆紀錄? ')) { -->
<!--         	var href = $(this).attr('href');        	       		 -->
<!--                 $('form').attr('action', href).submit(); -->
<!--         	}  -->
<!--         	return false; -->
            
<!--         }); -->
<!--     }) -->
<!-- </script> -->
</html>