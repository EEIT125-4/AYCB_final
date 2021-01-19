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

<%@include file="../jspf/header.jspf"%>

	<p>&nbsp;</p>
	<hr>
	<div class='center'>
		<H1 class='center'>更新活動資料</H1>
		<hr>
		<form:form method='POST' modelAttribute='event' enctype='multipart/form-data'>
			<input type="hidden" name="eventid" value="${event.eventid}"> 
<%-- 			<input type="hidden" name="memberid" value="${event.memberid}">  --%>
			<input type="hidden" name="finalDecision" value="">
				
			<Table>
				<TR>
					<TD align="RIGHT">活動名稱：</TD>
					<TD align="LEFT">
					<input type="text" name="eventname" value="${event.eventname}${param.eventname}" size="30">
<%-- 				    <font color='red' size='-3'>${error.eventname}</font></TD> --%>
                <form:errors path="eventname" cssStyle="font-size:15px; color:red"/>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動類別：</TD>
					<TD align="LEFT">
					<select name="eventcategory" value="${event.eventcategory}${param.eventcategory}">
					 <option value="NONE">請選擇</option>					
				     <option value="手做" >手做</option>					
				     <option value="教學" >教學</option>					
				     <option value="新品發表" >新品發表</option>					
				     <option value="促銷" >促銷</option>					
				     <option value="其他" >其他</option>
					</select>
				    <form:errors path="eventcategory" cssStyle="font-size:15px; color:red"/>
				    </TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動日期：</TD>
					<TD align="LEFT">
					<input type="date" name="eventdate" value="${event.eventdate}${param.eventdate}" size="30">
				    <form:errors path="eventdate" cssStyle="font-size:15px; color:red"/>
				    </TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動地點：</TD>
					<TD align="LEFT">
					<input type="text" name="eventlocation" value="${event.eventlocation}${param.eventlocation}" size="30">
				   <form:errors path="eventlocation" cssStyle="font-size:15px; color:red"/>
				   </TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動聯絡人：</TD>
					<TD align="LEFT">
					<input type="text" name="host" value="${event.host}${param.host}">
						<form:errors path="host" cssStyle="font-size:15px; color:red"/>
						</TD>						
				</TR>
				<TR>
					<TD align="RIGHT">聯絡電話：</TD>
					<TD align="LEFT">
					<input type="text" name="hostphone" value="${event.hostphone}${param.hostphone}">
						<form:errors path="hostphone" cssStyle="font-size:15px; color:red"/>
						</TD>	
				</TR>
				<TR>
					<TD align="RIGHT">名額：</TD>
					<TD align="LEFT">
					<input type="text" name="totalpax"value="${event.totalpax}${param.totalpax}"> 
						<form:errors path="totalpax" cssStyle="font-size:15px; color:red"/>
						</TD>
						
				</TR>
				<TR>
					<TD align="RIGHT">活動圖片：</TD>
					<TD align="LEFT">
					<input type="file" name="file" value="${event.filename}${param.filename}"> 
<%-- 						<form:errors path="filename" cssStyle="font-size:15px; color:red"/> --%>
					</TD>
				</TR>
				<TR>
					<TD align="RIGHT">活動簡介：</TD>
					<TD align="LEFT">
					<textarea cols="50" rows="5" name="eventdescription" style="text-align: left;" >
				    ${event.eventdescription}${param.eventdescription}
					</textarea>
<%-- 				    <form:errors path="eventdescrition" cssStyle="font-size:15px; color:red"/> --%>
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
		
		<small>&lt;&lt;<a href="javascript:history.back()">回上一頁</a>&gt;&gt;
		</small>
	</div>
	
	<%@include file="../jspf/footer.jspf"%> 
</body>


</html>