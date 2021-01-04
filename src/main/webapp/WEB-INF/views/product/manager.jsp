<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="js/inside.js" defer="defer"></script>
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/manager.css" TYPE="text/css">
<title>Manager</title>
</head>
<%@include file="../jspf/managerheader.jspf"%>
<div class="contentoutbox">
	<div class="contentbox">
		<div class="back">
			<div class="title">後臺管理</div>
			<div class="format">
				<input class="mbtn" type="button" value="會員"
					onclick='location.href="#"'> <input class="mbtn"
					type="button" value="商品"
					onclick='location.href="${pageContext.request.contextPath}/MProduct"'>
				<input class="mbtn" type="button" value="訂單"
					onclick='location.href="${pageContext.request.contextPath}/orderManager"'>
			</div>
			<div class="format">
				<input class="mbtn" type="button" value="訊息"
					onclick='location.href="#"'> <input class="mbtn"
					type="button" value="活動" onclick='location.href="#"'> <input
					class="mbtn" type="button" value="留言板" onclick='location.href="#"'>
			</div>
		</div>
		<%@include file="../jspf/footer.jspf"%>
	</div>
</div>

</body>
</html>