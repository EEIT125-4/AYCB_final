<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}css/member.css" TYPE="text/css">
<link rel="icon" href="image/logo.ico" type="image/x-icon">
<title>註冊</title>
</head>
<%@include file="../jspf/header.jspf"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="position: relative; top: 200px;">
	<fieldset
		style="margin: auto; border: 3px solid black; border-radius: 20px; width: 550px;">
		<legend
			style="background-color: lightgray; border-radius: 3px; width: 60px; margin: 0 auto; text-align: center;">註冊</legend>
		<form:form action="memberConfirm" method="POST" modelAttribute="member" > 
		
			<table>
				<br>
				<tr>
					<td>*姓名</td>
					<td><form:input class="abc" type="text" path="name" id="realname"/>
					</td>
				</tr>
				<tr>
					<td>*性別</td>
					
<%-- 					<form:radiobuttons path="gender" items='${gender}'/></td> --%>
					<td><form:radiobutton  path="gender" value="男"/>先生 
					<form:radiobutton  path="gender" value="女" />小姐</td>

				</tr>
				<tr>
					<td>*帳號</td>
					<td><form:input class="ddd" type="text" path="account" id="acc"
						onblur="Ckac();"/></td>
						<span id="idsp" style="color: red;"></span> 
				</tr>
				<tr>
					<td>*密碼</td>
					<td><form:input class="ddd" type="password" path="password" id="pwd"/></td>
				</tr>
				<tr>
					<td>*確認密碼</td>
					<td>
						<form:input class="ddd" type="password" path="" id="cpwd"/> 
					</td>
				</tr>
				<tr>
					<td>*信箱</td>
					<td><form:input class="ccc" type="text" path="email" id="email"/></td>
				</tr>
				<tr>
					<td>*生日</td>
					<td><div>
							<form:input type="date" class="bb" path="birth" id="bday"/>
								

						</div></td>
			</table>
			<div style="margin-left: 250px">
<!-- 				<button style="width: 50px;" class="sb" type="submit" name="submit">註冊</button> -->
  						<input type="submit" value="註冊"> 
<!-- 						<button type="submit" name="submit"><a href='memberConfirm'>確認</a></button> -->
			</div>
		</form:form>
	</fieldset>
</div>
<script>




</script>



</body>
</html>