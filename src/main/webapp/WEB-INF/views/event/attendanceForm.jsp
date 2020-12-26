  
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
</head>
<%@include file="../jspf/header.jspf"%>
<body>

	<div style=' position: relative; top: 200px;'>
		<div>
			<div style="float: left; width: 20%; text-align: center; margin-left: 220px;">

				<dl>
					<dt>
						<h3>預約活動</h3>
					</dt>
					<hr width=70% size=1 color=#BFBFBF
						style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)">
					<dt class="a1">
						<A href="showEvent">
							<h4>活動介紹</h4>
						</A>
					</dt>
					<dt class="a1">
						<a href='attendanceForm'><h5>報名參加</h5></a>	
					</dt>
					<dt class="a1">
						<A href='showAttendance'><h6>查詢報名</h6></A>	
					</dt>

				</dl>
			</div>
		</div>


		<div>
                <form:form method="POST" modelAttribute="attendance">
				<fieldset>
					<legend>
						<h2>報名資料</h2>
					</legend>
					<div class="form1">
						<label class="label1">帳號:</label> 
						<form:input path="member" value="${member.account}" disabled="true"/> <br> 
						<font color='red' size='-3'>${error.id}</font><br>
							
					</div>
					<div class="form1">
						<label class="label1">電話號碼:</label>						
						<form:input path="phone" value="${member.phone}" /> <br> 
						<font color='red' size='-3'>${error.phone}</font><br>
					</div>
					<div class="form1">
						<label class="label1">mail:</label> 						
						<form:input path="mailaddress" value="${member.email}"/> <br> 	
						<font color='red' size='-3'>${error.mail}</font><br>
					</div>
					<div class="form1">
						<label class="label1">活動名稱:</label> 
						<input type="text" name="eventid" value="${eventid}"> 						
						<input name="eventname" value="${eventname}" disabled="true"/> <br> 
						 <font color='red' size='-3'>${error.eid}</font><br>
							
					</div>
					<div class="form1">
						<label class="label1">參加人數:</label> 
						<form:input path="pax"/> <br> 
						<font color='red'size='-3'>${error.pax}</font><br>
							
					</div>


					<div class="sub">
						<input type='submit' name='name' value='提交'> <input
							type='reset' name='name' value='還原'><br>
					</div>

				</fieldset>
			</form:form>
			
		</div>
	</div>
</body>
<%@include file="../jspf/footer.jspf"%>
</html>