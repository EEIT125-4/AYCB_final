<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
<title></title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
</head>

<%@include file="../jspf/header.jspf"%>
<body>
	<div align='center' style='position: relative; top: 200px;'>


		<div>
			<h3>活動資料</h3>
			<form method='POST'>
				<input type='hidden' name='_method' value='DELETE'>
			</form>

			<c:choose>
				<c:when test="${empty events}"> 沒有任何活動<br></c:when>   
				
				<c:otherwise>
					<table border='1' cellpadding="3" cellspacing="1" bordercollapse="collapse">
						
						<tr>
							<th width='56'>活動編號</th>
							<th width='140'>活動名稱</th>
							<th width='180'>活動日期</th>
							<th width='130'>活動地點</th>
							<th width='64'>活動簡介</th>
							<th width='56'>主辦人</th>
							<th width='56'>連絡電話</th>
							<th width='56'>人數</th>
							<th>照片</th>
							<th colspan='2' width='72'>資料維護</th>
						</tr>
						<c:forEach var='event' items='${events}'>
							<tr>
								<td style="text-align: center">${event.eventid}</td>
								<td style="text-align: center">${event.eventname}</td>
								<td style="text-align: center">${event.eventdate}</td>
								<td style="text-align: center">${event.eventlocation }</td>
								<td style="text-align: right">${event.eventdescription}</td>
								<td style="text-align: center">${event.host}</td>
								<td style="text-align: center">${event.hostphone}</td>
								<td style="text-align: center">${event.pax}</td>
								<td><img width='60' height='72' src='${pageContext.request.contextPath}/img/${event.filename}' /></td>

								<td><a
									href="${pageContext.request.contextPath}/event/${event.eventid}">編輯</a></td>
								<td><a class='deletelink'
									href="${pageContext.request.contextPath}/event/${event.eventid}">刪除</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>

			<a href="<c:url value='/event/eventForm'/>">新增活動</a>
			&nbsp;&nbsp;&nbsp;<a href="<c:url value='/'/> ">回前頁</a>
		</div>
	</div>

	<script type='text/javascript'>
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;

			});
		})
	</script>
	
	<%@include file="../jspf/footer.jspf"%>
</body>
</html>