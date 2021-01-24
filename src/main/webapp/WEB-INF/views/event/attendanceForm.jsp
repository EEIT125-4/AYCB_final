  
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
                <div style="text-align: center;">
				<img width="400px" height="400px" src="${filename}" style="display: inline-block; margin-bottom: 35px">
				<form:form method="POST" modelAttribute="attendance"  cssStyle="display:inline-block; margin-top:70px">
				<fieldset style=" text-align: left;" >
					
					<div>
						<label class="label1">活動名稱:</label> 
						<input type="hidden" name="eventid" value="${eventid}"> 					
						<input name="eventname" type="text" value="${eventname}" readonly="readonly" size="30" style="background-color:lightgray;border:transparent"><br>	
<%-- 						<form:errors path="eventname" cssStyle="font-size:15px; color:red"/><br>				 --%>
					</div>
					<div>
						<label class="label1">會員帳號: </label> 
						<input name="account" type="text" value="${member.account}" readonly="readonly" size="30" style="background-color:lightgray;border:transparent"/> <br> 
							
					</div>
					<div>
						<label class="label1">電話號碼:</label>						
						<form:input path="phone" value="${member.phone}"/>
						<form:errors path="phone" cssStyle="font-size:15px; color:red"/><br>
					</div>
					<div>
						<label class="label1">Email:</label> 						
						<form:input path="mailaddress" value="${member.email}" size="30"/> 
						<form:errors path="mailaddress" cssStyle="font-size:15px; color:red"/><br>
					</div>
					
					<div>
						<label class="label1">參加人數:</label> 
						<form:input type="number" path="pax" size="3" max="5" min="1"/> 
						<form:errors path="pax" cssStyle="font-size:15px; color:red"/>
						<font color='red'size='-3'>${pax1}</font><br>
							
					</div>
					<div class="sub">
						<input class="btn btn-primary" type='submit' name='name' value='送出報名'> 
						<input class="btn btn-primary" type='reset' name='name' value='清除資料'><br>
							
					</div>
                     
				</fieldset>
			</form:form>
			</div>
				
			
		</div>
<%@include file="../jspf/footer.jspf"%>
</body>


</html>