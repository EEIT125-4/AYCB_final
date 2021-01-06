<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/member.css" TYPE="text/css">
<link rel="icon" href="image/logo.ico" type="image/x-icon">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>資料確認</title>
</head>
<%@include file="../jspf/header.jspf"%>
<div style="position: relative; top: 200px; ; left: 700px;">
	
	<form:form   action="insert" method="POST" modelAttribute="member" > 
		<fieldset class="confirmfs">
			<legend style="font-size: 28px;">請再次確認個人資料</legend>
			<div>
				<form:hidden path="name"/>
				<label>姓名:</label> <label name="name" >${member.name}</label>
			</div>
			<div>
			<form:hidden path="gender"/>
				<label>性別:</label> <label name="gender" >${member.gender}</label>
			</div>
			<div>
			<form:hidden path="account"/>
				<label>帳號:</label> <label name="account" >${member.account}</label>
			</div>
			<div>
			<form:hidden path="password"/>
				<label>密碼:</label> <label name="password" >${member.password}</label>
			</div>
			<div>
			<form:hidden path="email"/>
				<label>信箱:</label> <label name="email" >${member.email}</label>
			</div>
			<div>
			<form:hidden path="birth"/>
				<label>生日:</label> <label name="birth" >${member.birth}</label>
			</div>
<!-- 			<button type="submit" name="submit"><a href='memberConfirm'>確認</a></button> -->
			
			<input type="submit" name="submit" id="send" value="確認">
		</fieldset>
	</form:form>
</div>
<%@include file="../jspf/footer.jspf"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

document.getElementById("send").addEventListener("click",function(){
	  swal("Good job!", "You clicked the button!", "success");
	});







</script>




</body>
</html>