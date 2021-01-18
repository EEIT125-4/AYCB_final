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
			<div>
				<label class="label1" >活動名稱:</label> 
				<form:input type='text' path="eventname"/>
				<form:errors path="eventname" cssStyle="font-size:15px; color:red"/><br>					
			</div>
 			<div>
 				<label class="label1" >活動類別:</label> 
				<form:select type='text' path="eventcategory">					
				<form:option value="NONE"  label="請選擇"/>					
				<form:option value="手做"    label="手做"/>					
				<form:option value="教學"    label="教學"/>					
				<form:option value="新品發表"    label="新品發表"/>					
				<form:option value="促銷"     label="促銷"/>					
				<form:option value="其他"     label="其他"/>
				</form:select>
				<form:errors path="eventcategory" cssStyle="font-size:15px; color:red"/><br>					
 			</div> 
			<div>
				<label class="label1">活動日期:</label> 
				<form:input type='date'  path="eventdate"/>
				<form:errors path="eventdate" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div >
				<label class="label1">活動地點:</label> 
				<form:input type='text' path="eventlocation"/>
				<form:errors path="eventlocation" cssStyle="font-size:15px; color:red"/><br>
			</div>			
			<div>
				<label class="label1">活動聯絡人:</label> 
				<form:input type='text' path="host"/>
				<form:errors path="host" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div>
				<label class="label1">聯絡電話:</label> 
				<form:input type='text' path="hostphone"/>
				<form:errors path="hostphone" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div>
				<label class="label1">名額:</label> 
				<form:input type='text' path="totalpax"/>
				<form:errors path="totalpax" cssStyle="font-size:15px; color:red"/><br>					
			</div>
<!-- 			<div> -->
<!-- 				<label class="label1">參加人數:</label>  -->
<%-- 				<form:input type='text' path="pax"/><br>					 --%>
<!-- 			</div> -->
			<div>
				<label class="label1">活動簡介:</label> 
				<form:textarea type='text' path="eventdescription"/><br>
			</div>
			<div>
				<label class="label1">活動圖片:</label> 
				<input name="file" type="file" />
				<form:errors path="filename" cssStyle="font-size:15px; color:red"/><br>
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