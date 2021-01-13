  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eventpage.css">
<title>填寫報名資料</title>

<%@include file="../jspf/header.jspf"%>
		<div class="container" style="margin-bottom: 80px;">
                <form:form method="POST" modelAttribute="attendance" >
				<fieldset style="background-color: lightgray; margin-left: 350px" >
					<legend>
						<h2>報名資料</h2>
					</legend>
					<div>
						<label class="label1">帳號: ${member.account}</label> 
						<input name="account" type="hidden" value="${member.account}"/> <br> 
						<font color='red' size='-3'>${error.id}</font><br>
							
					</div>
					<div>
						<label class="label1">電話號碼:</label>						
						<form:input path="phone" value="${member.phone}"/> <br> 
						<font color='red' size='-3'>${error.phone}</font><br>
					</div>
					<div>
						<label class="label1">mail:</label> 						
						<form:input path="mailaddress" value="${member.email}"/> <br> 	
						<font color='red' size='-3'>${error.mail}</font><br>
					</div>
					<div>
						<label class="label1">活動名稱:</label> 
						<input type="hidden" name="eventid" value="${eventid}"> 						
						<input name="eventname" value="${eventname}" disabled="true">
						 <font color='red' size='-3'>${error.eid}</font><br>							
					</div>
					<div>
						<label class="label1">參加人數:</label> 
						<form:input type="number" path="pax"/> <br> 
						<font color='red'size='-3'>${error.pax}</font><br>
							
					</div>
					<div class="sub">
						<input type='submit' name='name' value='提交'> <input
							type='reset' name='name' value='還原'><br>
					</div>

				</fieldset>
			</form:form>
		</div>
<%@include file="../jspf/footer.jspf"%>
</body>

</html>