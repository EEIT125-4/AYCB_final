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
	function confirmDelete(member) {
		var result = confirm("確定取消參加(帳號:" + member + ")?");
		if (result) {
			document.forms[1].finalDecision.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate(member) {
		var result = confirm("確定送出此筆記錄(帳號:" + member + ")?");
		if (result) {
			document.forms[1].finalDecision.value = "UPDATE";
			return true;
		}
		return false;
	}
</script>
</head>
<%@include file="../jspf/header.jspf"%>

	<div class="container" >		
		<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<form:form method="POST" modelAttribute="attendance" >
		<legend><h3>更新報名資料</h3></legend>
			<input type="hidden" name="eventid" value="${attendance.event.eventid}"> 
			<input type="hidden" name="memberid" value="${attendance.member.id}"> 
			<input type="hidden" name="aid" value="${attendance.aid}"> 
			<input type="hidden" name="finalDecision" value="">
				
			<Table>
				<TR>
					<TD align="RIGHT"></TD>
					<TD align="LEFT">
					<input type="image" name="filename" src="${attendance.event.filename}">					
				   
				    </TD>
				</TR>
				<TR>
					<TD align="RIGHT">活動名稱：</TD>
					<TD align="LEFT">
					<input type="text" name="eventname" value="${attendance.event.eventname}${param.event.eventname}" size="30" disabled="disabled">					
				    
				    </TD>
				</TR>
				<TR>
					<TD align="RIGHT">活動日期：</TD>
					<TD align="LEFT"><input type="text" name="eventdate" value="${attendance.event.eventdate}${param.event.eventdate}" size="30" disabled="disabled">					
	
				</TR>
				<TR>
					<TD align="RIGHT">活動地點：</TD>
					<TD align="LEFT"><input type="text" name="evenlocation" value="${attendance.event.eventlocation}${param.event.eventlocation}" size="30" disabled="disabled">					
				    </TD>
				</TR>
				<TR>
					<TD align="RIGHT">聯絡電話：</TD>
					<TD align="LEFT"><input type="text" name="phone"
						value="${attendance.phone}${param.phone}"> 
					<form:errors path="phone" cssStyle="font-size:15px; color:red"/>
					</TD>
				</TR>
				<TR>
					<TD align="RIGHT">信箱：</TD>
					<TD align="LEFT"><input type="text" name="mailaddress"
						value="${attendance.mailaddress}${param.mailaddress}"> 
					<form:errors path="mailaddress" cssStyle="font-size:15px; color:red"/>
						</TD>
				</TR>


				<TR>
					<TD align="RIGHT">報名人數：</TD>
					<TD align="LEFT">
					<input type="hidden" name="oldpax" value="${attendance.pax}">
					<input type="text" name="pax" value="${attendance.pax}${param.pax}">
						 <font color='red' size='-3'>${error.pax}</font>
					</TD>
				</TR>

				<TR>
					<TD colspan="2" align="center">
					<input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${attendance.member.account}');">
					<input type="submit" value="刪除" name='deleteBtn'onclick="return confirmDelete('${attendance.member.account}');">	
						
					</TD>
				</TR>
			</Table>
			<c:if test="${not empty requestScope.modify}">
				<c:remove var="member" scope="request" />
			</c:if>
		</form:form>
</div>		
		<small>&lt;&lt;<a href="javascript:history.back()">回上一頁</a>&gt;&gt;</small>
		<div class="col-md-3"></div>
		</div>
	</div>

<%@include file="../jspf/footer.jspf"%> 
</body>
</html>