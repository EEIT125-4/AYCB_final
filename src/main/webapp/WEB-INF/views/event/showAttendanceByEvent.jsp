<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eventpage.css">
<title>新增報名資料成功</title>
</head>
<%@include file="../jspf/header.jspf"%>
<body>
	<div>
		<c:choose>
					<c:when test='${empty attendanceOfEvent}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		                                        查無報名資料<br>
					</c:when>
					<c:otherwise>
						<table class="table table-borderless table-dark">
							<tr>
								<td>帳號</td>
								<td>活動名稱</td>
								<td>mail</td>
								<td>電話號碼</td>
								<td>參加人數</td>
								<td colspan="2">修改報名資料</td>

							</tr>
							<c:forEach var='Attendance' varStatus='vs' items='${attendanceOfEvent}'>
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
<%@include file="../jspf/footer.jspf"%>
</html>