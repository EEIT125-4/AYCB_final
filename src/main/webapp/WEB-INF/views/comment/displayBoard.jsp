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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css" />
<link href="${pageContext.request.contextPath}/css/editor.css"
	rel="stylesheet">

<title>留言板</title>
<%@include file="../jspf/header.jspf"%>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<div>

	<!--判斷有無登入 -->
	<c:if test='${ empty member}'>
		<a href="${pageContext.request.contextPath}/member/login"> <%
 	String message = "Warning Info ...";
 out.println("<SCRIPT LANGUAGE='JavaScript'>");
 out.println("<!--");
 out.println("alert('" + "若欲留言請先登入" + "')");
 out.println("window.navigate('${pageContext.request.contextPath}/member/login')");
 out.println("//-->");
 out.println("</SCRIPT>");
 %>


		</a>
	</c:if>
	<!--留言佈告欄 -->
	<c:if test='${not empty member}'>
		<div id="content">
			<div id="post">
				<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>
				<FORM
					ACTION="${pageContext.request.contextPath}/comment/CommentController"
					method="Post">
					<Fieldset class="discussionbox">
				</FORM>

				<div>
					<label>會員名稱：</label> <input type="text" id="shangtian" name="name"
						value="${member.name}">
				</div>

				<div>
					性別: <input type="text" name="gender" value="${member.gender}">
				</div>

				<div>
					<!-- 		Age:<label for="age">(between 0 and 100):</label> <input type="number" -->
					<!-- 			id="age" name="age" min="0" max="100"> -->
					<%!int st = 0;%>

					<label for="status"></label> <input type="hidden" name="status"
						value=<%=st%>> <label for="id"></label> <input
						type="hidden" name="${member.id}"> <label for="commentId"></label>
					<input type="hidden" name="commentId"> <label
						for="commentTime"></label> <input type="hidden" name="commentTime">
				</div>
				<label for="contentBox"></label>
				<textarea name="content" id="contentBox" class="transition"></textarea>
				<button id="submit" type="button" class="site-btn"
					style="width: fit-content; margin-left: 700px;"
					onclick="postComment()">送出</button>
				<button class="site-btn" style="width: fit-content;"
					clear" type="reset" name="clear">清除</button>
				</Fieldset>
			</div>
		</div>
</div>

<!-- 留言回覆 -->
<div id="boardreply">123</div>

<!-- 留言回覆 -->
<!-- <div id="reply">123</div> -->

</c:if>


<script>
	var board = document.getElementById("boardreply");
	$(document).ready(function(){
			console.log("into postcomment")
		function postComment() {
			$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/leaveComment",
						dataType : "json",
						data : {
							'comment' : $("#comment").val(),
							'memberid' : '${member.id}',
							'type' : "product",
							'key' : "${comment.commentId}"
						},
						success : function(data) {
							console.log(data)
							$("#reply")
									.prepend(
											+"<div class=leavecomment>"
											+ "<li>"
											+ "<div class=picform>"
											+ "<img class=headpic src= '"+ data.imageId +"'alt=Image placeholder>"
											+ "</div>"
											+ "<div>"
											+ "<h3>"+ data.membername +"</h3>"
											+ "<div class=commentdate>"+ data.CommentTime + "</div>"
											+ "<p>" + data.ContentBox + "</p>"
											+ "<p>"
											+ "<a href=# class=reply id=reply>回覆</a>"
											+ "</p>"
											+ "</div>"
											+ "</li>"
											+ "</div>")
						}
				})
		})
	})
				
</script>
</body>
<%-- <%@include file="../jspf/footer.jspf"%> --%>
</html>


<!-- 回覆留言樣板 -->
<!-- <div class="leavecomment"> -->
<!-- 	<li> -->
<!-- 		<div class="picform"> -->
<!-- 			<img class="headpic" -->
<%-- 				src="${pageContext.request.contextPath}/image/pic.jpg" --%>
<!-- 				alt="Image placeholder"> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<h3>John Doe</h3> -->
<!-- 			<div class="commentdate">April 12, 2020 at 1:21am</div> -->
<!-- 			<p>請問一下有沒有賣雅漾保濕舒壓潤膚乳液，加強保濕的，還有沒有買一送一?</p> -->
<!-- 			<p> -->
<!-- 				<a href="#" class="reply">回覆</a> -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 	</li> -->
<!-- </div> -->


<!-- 巢狀回覆script -->
<!--  // 	var board = document.getElementById("reply");
// 	$(document)
// 			.ready(
// 					function() {
// 						//     $("#reply").click(function() { 
// 						$
// 								.ajax({
// 									type : "POST", //傳送方式
// 									url : "${pageContext.request.contextPath}/leaveComment",
// 									//             ?memberid=${member.id}&key=${comment.commentId}&type=blog", //傳送目的地
// 									dataType : "json", //資料格式(從後面傳到前面)
// 									data : { //傳送資料
// 										'comment' : $("#comment").val(), //表單欄位 ID nickname
// 										'memberid' : '${member.id}',
// 										'type' : "product",
// 										'key' : "${comment.commentId}"
// 									},
// 									success : function(data) {
// 										console.log(data)
// 										$("#reply")

// 												.prepend(

// 														+"<textarea class=replycomment>"
// 																+ "</textarea>"
// 																)
// 									}
// 								})
// 					})
-->