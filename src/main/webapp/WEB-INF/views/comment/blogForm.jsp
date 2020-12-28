<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
<meta charset="UTF-8">
<title>部落格上傳</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file="../jspf/footer.jspf"%>
<%-- ${member} --%>
<style>
.center {
	width: 500px;
	margin-left: 500px;
}
</style>
<div class='center' style='position: relative; top: 200px;'>
	<form:form method="POST" modelAttribute="video"
		enctype='multipart/form-data'>
		<fieldset class="updateform">
		<legend class="title">文章上傳</legend>
			<p>
				<label class="t1" for="">上傳者:</label>
				<form:input type="text" path="member" value="${member.name}"
					disabled='true' />
			</p>
			<p>
				<label for="" class="t1">文章標題:</label> <input type="text"
					name="title" value="${title}">
			</p>
			<p>
				<label for="" class="t1">上傳部落格照片:</label> <input type="text" name="picture"
					value="${picture}">
			</p>
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
</html>tml>