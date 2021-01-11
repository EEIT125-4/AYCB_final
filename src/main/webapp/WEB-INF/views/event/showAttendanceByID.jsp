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
<!-- 		<div> -->
<!-- 			<div -->
<!-- 				style="float: left; width: 20%; text-align: center; margin-left: 220px;"> -->

<!-- 				<dl> -->
<!-- 					<dt> -->
<!-- 						<h2>預約活動</h2> -->
<!-- 					</dt> -->
<!-- 					<hr width=70% size=1 color=#BFBFBF -->
<!-- 						style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)"> -->
<!-- 					<dt class="a1"> -->
<!-- 						<A href="showEvent"> -->
<!-- 							<h2>活動介紹</h2> -->
<!-- 						</A> -->
<!-- 					</dt> -->
<!-- 					<dt class="a1"> -->
<%-- 						<a href="<c:url value='showAllAttendanceByID'/>?id=${member.id}"><h2>查詢會員報名</h2></a>	 --%>
<!-- 					</dt> -->
<!-- 					<dt class="a1"> -->
<!-- 						<A href='showAttendance'><h2>查詢報名</h2></A>	 -->
<!-- 					</dt> -->

<!-- 				</dl> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
	
		<h2>已報名活動</h2>
		<c:choose>
		<c:when test='${empty attendancelist}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		查無報名資料<br>
		</c:when>
		<c:otherwise>
			<table class="table table-borderless table-dark" >
				<tr>
					<td align="center" valign="middle">活動圖片</td>
					<td align="center" valign="middle" width="">活動名稱</td>			
					<td align="center" valign="middle">日期</td>
					<td align="center" valign="middle">地點</td>								
<!-- 					<td align="center" valign="middle">帳號</td>	 -->
					<td align="center" valign="middle">mail</td>
					<td align="center" valign="middle">電話號碼</td>
					<td align="center" valign="middle">參加人數</td>
					<td align="center" valign="middle" colspan="2">修改報名資料</td>
					
				</tr>
				<c:forEach var='Attendance' varStatus='vs' items='${attendancelist}'>
					<tr>
						<td align="center" style="vertical-align:middle;"><img width='180' height='200' src='${Attendance.event.filename}' /></td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventname}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventdate}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.event.eventlocation}</td>
<%-- 						<td align="center" style="vertical-align:middle;">${Attendance.member.account}</td> --%>
						<td align="center" style="vertical-align:middle;">${Attendance.mailaddress}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.phone}</td>
						<td align="center" style="vertical-align:middle;">${Attendance.pax}</td>
						<td align="center" style="vertical-align:middle;"><a href="<c:url value='update'/>?aid=${Attendance.aid}" class="btn btn-primary" style="width: 150px ;background-color: grey; border: none;">更改聯絡資訊</a></td>
                        <td align="center" style="vertical-align:middle;"><a href="<c:url value='delete'/>?aid=${Attendance.aid}" class="btn btn-primary" style="width: 100px ;background-color: grey;border: none;">取消報名</a></td>
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