<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/comment.css" />
<title>留言板</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file="../jspf/footer.jspf"%>
<%@include file="../jspf/commentSide.jspf"%>
<div id="content">
	<div id="post" style="margin-top: 60px;">

		<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>

		<form:form method="POST" modelAttribute="comment" enctype='multipart/form-data'>
			<%-- 		<FORM ACTION="${pageContext.request.contextPath}/comment/CommentController" --%>
<!-- 			method="Post"> -->
			<Fieldset class="discussionbox">
				<div>
					<label>會員名稱：</label>
					<form:input type="text" path="member" id="shangtian" name="name"
						disabled="true" value="${member.name}" />
				</div>

				<div>
					<label>性別:</label>
					<input type="text"  value="${member.gender}"
						disabled='disabled' />
				</div>

				<!-- 				<div> -->
				<!-- 					Gender: <input type="radio" id="male" name="gender" value="男"> -->
				<!-- 					<label for="male"> Male</label> <input type="radio" id="female" -->
				<!-- 						name="gender" value="女"> <label for="female">Female</label> -->
				<!-- 					<input type="radio" id="other" name="gender" value="其他" -->
				<!-- 						checked="checked"> <label for="other">Other</label><BR> -->
				<!-- 				</div> -->


				<div>
					Age:<label for="age">(between 0 and 100):</label> <input
						type="number" id="age" name="age" min="0" max="100">
					<%!int st = 0;%>

					<label for="status"></label> <input type="hidden" name="status"
						value=<%=st%>> <label for="id"></label><input
						type="hidden" name="${member.id}"> <label for="commentId"></label><input
						type="hidden" name="commentId"> <label for="commentTime"></label><input
						type="hidden" name="commentTime">
				</div>
				<label for="contentBox"></label>
				<textarea name="content" id="contentBox" class="transition"></textarea>

				<INPUT id="postBt" type="submit" name="submit" value="發表留言" /> <INPUT
					id="clear" type="reset" name="clear" value="清除" />
			</Fieldset>
			</form:form>
	</div>

</div>
</html>
