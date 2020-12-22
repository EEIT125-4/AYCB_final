<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/eventpage.css"> --%>
<title>報名資料管理</title>
</head>  

<%@include file="../jspf/header.jspf"%>

<div class='center'  style=' position: relative; top: 200px;' >
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
						<a href='attendanceForm'><h2>報名參加</h2></a>	
					</dt>
					<dt class="a1">
						<A href='showAttendance'><h2>查詢報名</h2></A>	
					</dt>

				</dl>
			</div>
		</div>

<a href='attendanceForm' >報名參加</a><br>
<a href='showAttendance' >報名資料查詢</a><br>
<br>


<a href="javascript:history.back()">回上一頁</a>
</div>
</body>
<%@include file="../jspf/footer.jspf"%>
</html>