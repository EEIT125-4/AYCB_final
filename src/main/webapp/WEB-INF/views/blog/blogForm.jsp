<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/comment.css"> --%>
<meta charset="UTF-8">
<title>部落格上傳</title>
</head>


<%-- ${member} --%>
<style>
.center {
	width: 500px;
	margin-left: 500px;
}
</style>
<!-- Page Preloder -->

<%@include file="../jspf/header.jspf"%>


<div id="preloder">
	<div class="loader"></div>
</div>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>部落格文章上傳</h2>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<div class='center' style='position: relative; top: 200px;'>
	<form:form method="POST" modelAttribute="blog" enctype='multipart/form-data'>
		<fieldset class="updateform">
			<legend class="title">部落格文章上傳</legend>
			<p>
				<label class="t1" for="">上傳者:</label>
				<form:input type="text" path="member" value="${member.name}" disabled='true' />
			</p>
			<p>
				<label for="" class="t1">文章標題:</label> 
				<form:input type="text" name="title" path="title" value="${title}"/>
			</p>
			<p>
				<label for="" class="t1">上傳部落格照片:</label> 
				<form:input type="text" name="picture" path="picture" value="${picture}"/>
			</p>
			
			<label for="reflection">文章內文:</label>
			<form:textarea name="reflection" id="reflection" path="reflection" value="${reflection}"/>
			
			<!--隱藏選項共4個 -->
			<p>
				<input type="hidden" name="commentTime" value="${commentTime}">
			</p>

			<p>
				<input type="hidden" name="status" value="0">
			</p>

			<p>
				<input type="hidden" name="id" value="${id}">
			</p>
			<p>
				<input type="hidden" name="blogId" value="${blogId}">
			</p>
			<input type="submit" name="confirmupdate" value="送出">

		</fieldset>
	</form:form>
</div>
</body>
</html>