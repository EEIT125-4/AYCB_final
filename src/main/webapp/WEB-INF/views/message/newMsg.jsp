<%@page import="message.model.MessageBean"%>
<%@page import="message.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!-- 標準寫法,詳細參考網站https://www.javatpoint.com/jstl-sql-setdatasource-tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://use.edgefonts.net/arizonia:n4:default.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/message.css">
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
	<c:out value="${msg.getMsg_id()}" />
	<c:if test='${not empty msg}'>
		<c:set var='action' value='update' />
		<c:set var="hint" value="更新"/>
	</c:if>
	<c:if test='${empty msg}'>
		<c:set var='action' value='insert' />
			<c:set var="hint" value="新訊息"/>
	</c:if>
	


	



	<%-- <aside id="left"><%=editBean.getMsg_title()%></aside>--%>
	<main>
		<div>
			<form action="<c:url value='/message/insertNewMessage'/>"
				method="post" enctype="multipart/form-data">
				<!-- 				enctype="multipart/form-data"> -->

				<fieldset>



					<legend><c:out value='${hint}' /></legend>
					<table>
						<tr>
							<td>標題</td>
							<td><input type="text" name="title"
								placeholder=<c:if test='${not empty msg }'>
								<c:out value='${msg.getMsg_title()}' />
								</c:if>
								<c:if test='${empty msg }'>
								<c:out value='填入標題' />
								</c:if>
								value='${msg.getMsg_title()}' /></td>
						</tr>

						<tr>
							<td>分類</td>
							<td><input type="text" name="type"
								placeholder=<c:if test='${not empty msg }'>
								<c:out value='${msg.getMsg_type()}' />
								</c:if>
								<c:if test='${empty msg }'>
								<c:out value='填入分類' />
								</c:if>
								value=<c:out value='${msg.getMsg_type()}'/>></td>
						</tr>
						<tr>
							<td>訊息內容</td>
							<td><textarea name="desc" cols="100" rows="10">${msg.getMsg_desc()}</textarea></td>

							<%-- 									placeholder= --%>

							<%-- 									<c:if test='${not empty msg }'> --%>
							<%-- 								<c:out value='${msg.getMsg_desc()}' /> --%>
							<%-- 								</c:if> --%>
							<%-- 								<c:if test='${empty msg }'> --%>
							<%-- 								<c:out value='填入內容' /> --%>
							<%-- 								</c:if> --%>
							<%--textarea有一個濫坑,那就是placeholder若要正常顯示,<textarea></textarea>中間不能出現空格..--%>
							<%--也因為placeholder一但要修改原本的佔位資訊就會全部清空,最後決定直接寫在value --%>


						</tr>
						<tr>
							<td>上傳圖片</td>
							<td><input id="file" type="file" name="file"></td>
						</tr>
						<tr>
							<td>圖片預覽</td>
							<td>
							
						
							<img id="demo" class="preview" 
							src=<c:if test='${not empty msg}'>
							<c:out value='${msg.getMsg_imgpath()}'/> 
							</c:if>
							<c:if test='${empty msg}'>
							<c:out value=""/>
							</c:if>
							alt=<c:out value='${msg.getMsg_imgpath()}'/>
								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
						

							</td>
						</tr>
						<tr>

							<td colspan="2"><input type="hidden" name="id"
								value='${msg.getMsg_id()}'> <input type="hidden"
								name="path" value=<c:out value='${msg.getMsg_imgpath()}'/>> <input type="submit"
								name="submit" value='${action}'> <input type="reset"
								value="清除"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</div>
	</main>
</div>
<%@include file="../jspf/footer.jspf"%>


<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<script>
	$('#file').change(function() {

		var file = $('#file')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#demo').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
</script>





</body>

</html>