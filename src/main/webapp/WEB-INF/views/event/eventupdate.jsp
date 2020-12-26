<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML>
<html>
<head>
<style>
</style>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventpage.css">
<title>修改報名資料</title>
<script type="text/javascript">
	function confirmDelete(eventID) {
		var result = confirm("確定取消(活動:" + eventid + ")?");
		if (result) {
			document.forms[1].finalDecision.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate(memberID) {
		var result = confirm("確定修改此(活動:" + eventid + ")?");
		if (result) {
			document.forms[1].finalDecision.value = "UPDATE";
			return true;
		}
		return false;
	}
</script>
</head>
<%@include file="../jspf/header.jspf"%>

<body>
	<p>&nbsp;</p>
	<hr>
	<div class='center' style=' position: relative; top: 200px;'>
		<H1 class='center'>更新活動資料</H1>
		<hr>
		<p>
		<form:form method='POST' modelAttribute='eventupdate' enctype='multipart/form-data'>
			<input type="hidden" name="eventid" value="${event.eventid}"> 
<%-- 			<input type="hidden" name="memberid" value="${event.memberid}">  --%>
			<input type="hidden" name="finalDecision" value="">
				
			<Table>
				<TR>
					<TD align="RIGHT">活動名稱：</TD>
					<TD align="LEFT">
					<input type="text" name="eventname" value="${event.eventname}${param.eventname}" size="30">
				    <font color='red' size='-3'>${error.eid}</font></TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動日期：</TD>
					<TD align="LEFT">
					<input type="date" name="eventdate" value="${event.eventdate}${param.eventdate}" size="30">
				    <font color='red' size='-3'>${error.eid}</font></TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動地點：</TD>
					<TD align="LEFT">
					<input type="text" name="eventlocation" value="${event.eventlocation}${param.eventlocation}" size="30">
				    <font color='red' size='-3'>${error.eid}</font></TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動簡介：</TD>
					<TD align="LEFT">
					<input type="text" name="eventdescription" value="${event.eventdescription}${param.eventdescription}" size="30">
				    <font color='red' size='-3'>${error.eid}</font></TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">主辦方：</TD>
					<TD align="LEFT">
					<input type="text" name="host" value="${event.host}${param.host}">
						<font color='red' size='-3'>${error.phone}</font></TD>						
				</TR>
				<TR>
					<TD align="RIGHT">主辦方連絡電話：</TD>
					<TD align="LEFT">
					<input type="text" name="hostphone" value="${event.hostphone}${param.hostphone}">
						<font color='red' size='-3'>${error.phone}</font></TD>	
				</TR>
				<TR>
					<TD align="RIGHT">活動人數：</TD>
					<TD align="LEFT">
					<input type="text" name="pax"value="${event.pax}${param.pax}"> 
						<font color='red' size='-3'>${error.mail}</font>
						</TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動圖片：</TD>
					<TD align="LEFT">
					<input type="file" name="file" value="${event.filename}${param.filename}"> 
						<font color='red' size='-3'>${error.pax}</font>
					</TD>
				</TR>
						

				<TR>
					<TD colspan="2" align="center">
					<input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${event.eventid}');">
						
					<input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${event.eventid}');"></TD>
						
				</TR>
			</Table>
			<c:if test="${not empty requestScope.modify}">
				<c:remove var="member" scope="request" />
			</c:if>
		</form:form>
		<p />
		<small>&lt;&lt;<a href="javascript:history.back()">回上一頁</a>&gt;&gt;
		</small>
	</div>
</body>
<%@include file="../jspf/footer.jspf"%> 

</html>