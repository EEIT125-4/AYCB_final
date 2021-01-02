<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/comment.css" />

<title>留言內容確認</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file="../jspf/commentSide.jspf"%>

<c:set var="video" value="${comment}" />
<c:set var="member" value="${rs.member}"/>
<c:set var="commentId" value="${rs.commentId}" />
<c:set var="commentTime" value="${rs.commentTime}" />
<c:set var="content" value="${rs.contentBox}" />

<jsp:useBean id="comment" class="comment.model.CommentBean" scope="session" />

<form action="${pageContext.request.contextPath}/comment/CommentController" method="post">
	<fieldset class="confirmbox">
		<legend>
			<h2>留言內容如下:</h2>
		</legend>
		<table>
			<tr>
				<td style="width: 100px;">姓名:</td>
				<td><input type="text" name="name" value="${member.name}"></td>
			</tr>
			<tr>
				<td>性別:</td>
				<td><input type="text" name="gender" value="${member.gender}"></td>
			</tr>
			<tr>
				<td>年齡:</td>
				<td><input type="text" name="age" ></td>
			</tr>
			<tr>
				<td>留言內容:</td>
				<td><textarea name="content" >${content}</textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="hidden" name="commentTime" value="${commentTime}"/>
			</tr>						
			<tr>
				<td>member id</td>
				<td><input type="text" name="id" value="${member.id}"/>
			</tr>
			<tr>
				<td>comment id</td>
				<td><input type="text" name="commentId" value="${commentId}"/>
			</tr>
			<tr>
				<td></td>
				<td><input type="hidden" name="status" value="0"/>
			</tr>

		</table>
		<div>
			<input type="submit" name="confirm" value="確認">
		</div>
	</fieldset>
</form>
</body>

</html>
