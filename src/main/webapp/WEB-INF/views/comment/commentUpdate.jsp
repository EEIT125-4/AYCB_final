<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%@include file="../jspf/header.jspf"%>


<c:set var="rs" value="${comment}" />
<c:set var="member" value="${rs.member}" />
<c:set var="commentId" value="${rs.commentId}" />
<c:set var="commentTime" value="${rs.commentTime}" />
<c:set var="content" value="${rs.contentBox}" />


<link rel="stylesheet" href="../css/comment.css" />
<title>更新留言</title>
<jsp:useBean id="comment" class="comment.model.CommentBean" scope="session" />

<fieldset class="updateform">
	<legend class="title">編輯留言</legend>
	<form
		action="${pageContext.request.contextPath}/comment/CommentController"
		method="post">
		<p>
			<label class="t1" for="">名稱:</label> <input type="text" name="name"
				value="${member.name}">
		</p>
		<p>
			<label for="" class="t1">性別:</label> <input type="text" name="gender"
				value="${member.gender}">
		</p>
		<p>
			<label for="" class="t1">年齡:</label> <input type="text" name="age">
		</p>
		<p>
			<label for="" class="t1"></label> <input type="hidden"
				name="commentTime" value="${commentTime}">
		</p>
		<p>
			<label for="" class="t1">留言內文:</label>
			<textarea name="content">${content}</textarea>

		</p>
		<p>
			<label class="t1"></label> <input type="hidden" name="status"
				value="0">
		</p>

		<p>
			<label class="t1"></label> <input type="hidden" name="id"
				value="${member.id}">
		</p>
		<p>
			<label class="t1"></label> <input type="hidden" name="commentId"
				value="${commentId}">
		</p>
		<input type="submit" name="confirmupdate" value="送出"> 
		<input type='reset' name='name' value='還原'><br>
	</form>

</fieldset>
<%@include file="../jspf/footer.jspf"%>

