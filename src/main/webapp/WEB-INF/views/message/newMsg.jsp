<%@page import="message.model.MessageBean"%>
<%@page import="message.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!-- 標準寫法,詳細參考網站https://www.javatpoint.com/jstl-sql-setdatasource-tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://use.edgefonts.net/arizonia:n4:default.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/message.css">

<link href="${pageContext.request.contextPath}/css/editor.css"
	rel="stylesheet">
<title>NewMsg</title>

<style>
.preview {
	width: 300px;
	height: 300px;
	background-size: cover;
}
</style>

</head>
<%@include file="../jspf/header.jspf"%>

<div class="mid">
	<c:set var="msg" value="${message}" />
	<c:out value="${msg.getId()}" />
	<c:if test='${not empty msg.getId()}'>
		<c:set var='action' value='update' />
		<c:set var="hint" value="更新" />
	</c:if>
	<c:if test='${empty msg.getId()}'>
		<c:set var='action' value='insert' />
		<c:set var="hint" value="新訊息" />
	</c:if>

	<main>
		<div>
			<form:form method="POST" modelAttribute="message"
				enctype='multipart/form-data'>
				<fieldset>
					<legend>
						<c:out value='${hint}' />
					</legend>
					<table>
						<tr>
							<td>標題</td>
							<td><form:input path="title" type="text"
									placeholder="${message.title}" /></td>
						</tr>

						<tr>
							<td>分類</td>
							<td><form:input type="text" path="type"
									placeholder="${message.type}" /></td>
						</tr>
						<tr>
							<td>訊息內容</td>
							<td><form:textarea id="editor" path="content" cols="100"
									rows="10" /></td>

						</tr>
						<tr>
							<td>上傳圖片</td>
							<td><input id="file" type="file" name="file" /></td>
						</tr>
						<tr>
							<td>圖片預覽 <form:input type="hidden" path="imageid" />
							</td>
							<td><img id="demo" class="preview"
								src=<c:if test='${not empty message.getId()}'>
							<c:out value="${pageContext.request.contextPath}/pic/${message.getImageid()}"/>
							
							</c:if>
								<c:if test='${empty message.getId()}'>
							<c:out value=""/>
							</c:if>
								alt=<c:out value='${msg.getImageid()}'/>
								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">

							</td>
						</tr>

						<tr>

							<td colspan="2"><input type="hidden" name="id"
								value='${msg.getId()}'> <c:if
									test='${not empty message.getId()}'>
									<form:input type="hidden" path="date" />
								</c:if> <input type="submit" name="submit" value='${action}'> <input
								type="reset" value="清除"></td>
						</tr>
					</table>
				</fieldset>

			</form:form>
			>
		</div>
	</main>
</div>
<%@include file="../jspf/footer.jspf"%>


<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>

<script>
	$('#file').change(function() {

		var file = $('#file')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#demo').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	

    ClassicEditor
            .create(document.querySelector( 
                    '#editor'))
            .then(editor=>{
                   console.log(editor);
            })
            .catch(error=>{
                   console.error(error);
            });
	
</script>


</body>

</html>