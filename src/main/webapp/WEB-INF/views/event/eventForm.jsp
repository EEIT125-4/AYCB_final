<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventpage.css">
<meta charset="UTF-8">
<title>新增活動</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class='container' style="margin-bottom: 80px">
	<form:form method="POST" modelAttribute="event" enctype='multipart/form-data'>
		<fieldset>
			<legend>
				<h2>新增活動</h2>
			</legend>
			<div class="form1">
				<label class="label1" >活動名稱:</label> 
				<form:input type='text' path="eventname"/><br>					
			</div>
			<div class="form1">
				<label class="label1" >活動名稱:</label> 
				<form:input type='text' path="eventcategory"/><br>					
			</div>
			<div class="form1">
				<label class="label1">活動日期:</label> 
				<form:input type='date'  path="eventdate"/><br>
			</div>
			<div class="form1">
				<label class="label1">活動地點:</label> 
				<form:input type='text' path="eventlocation"/><br>
			</div>			
			<div class="form1">
				<label class="label1">活動聯絡人:</label> 
				<form:input type='text' path="host"/><br>
			</div>
			<div class="form1">
				<label class="label1">聯絡電話:</label> 
				<form:input type='text' path="hostphone"/><br>
			</div>
			<div class="form1">
				<label class="label1">參加人數:</label> 
				<form:input type='text' path="pax"/><br>					
			</div>
			<div class="form1">
				<label class="label1">活動詳情:</label> 
				<form:textarea type='text' path="eventdescription"/><br>
			</div>
			<div class="form1">
				<label class="label1">活動圖片:</label> 
				<input name="file" type="file" /><br>
			</div>
			<div class="sub">
				<input type='submit' name='name' value='提交'> <input
					type='reset' name='name' value='還原'><br>
			</div>

		</fieldset>
	</form:form>
</div>

</body>
<%@include file="../jspf/footer.jspf"%>
</html>