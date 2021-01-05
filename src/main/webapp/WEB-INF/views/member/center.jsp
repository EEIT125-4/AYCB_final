<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/inside.js" defer="defer"></script>
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/inside.css" TYPE="text/css">
<title>All You Can Buy</title>
</head>
<%@include file="../jspf/header.jspf"%>
<div class="contentoutbox">
	<div class="contentbox">
		<div class="leftside">
			<div class="condition">會員中心</div>
			<div class="category">
				<div class="catediv">
					<a id="a1" href="update" >修改會員資料</a>
				</div>
				
				<div class="catediv">
					訂單查詢<a id="a2" class="catea" href="#"></a>
				</div>
				
				<div class="catediv">
					活動查詢<a id="a3" class="catea" href="#" ></a>
				</div>
				
				<div class="catediv">
					訊息查詢<a id="a4" class="catea" href="#" ></a>
				</div>
				
			
			</div>
		</div>
		<div class="rightoutbox">
			
			
		</div>
		<%@include file="../jspf/footer.jspf"%>
	</div>
</div>

</body>
</html>