<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%@include file="../jspf/commentSide.jspf"%>
<div id="content">
	<div id="post" style="margin-top: 60px;">

		<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>

		<FORM
			ACTION="${pageContext.request.contextPath}/comment/CommentController"
			method="Post">
			<Fieldset class="discussionbox">
				<div>
					<label>會員名稱：</label> <input type="text" id="shangtian" name="name"
						value="${member.name}" placeholder="請點擊改變">
				</div>

				<div>
					性別: <input type="text" name="gender" value="${member.gender}">
				</div>

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
		</FORM>
	</div>
</div>

<div class="leavecomment">
	<li>
		<div class="picform">
			<img class="headpic"
				src="${pageContext.request.contextPath}/image/pic.jpg"
				alt="Image placeholder">
		</div>
		<div>
			<h3>John Doe</h3>
			<div class="commentdate">April 12, 2020 at 1:21am</div>
			<p>請問一下有沒有賣雅漾保濕舒壓潤膚乳液，加強保濕的，還有沒有買一送一?</p>
			<p>
				<a href="#" class="reply">回覆</a>
			</p>
		</div>
	</li>
</div>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>