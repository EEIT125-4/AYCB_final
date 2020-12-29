<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="js/Home.js" defer="defer"></script>
<title>index</title>
</head>
<%@include file="jspf/header.jspf"%>
<div class="adbox">
	<ul class="adbox_slides">
		<c:forEach var="item" varStatus='vs' items="${list}">
		
		<li><a href='<c:url value="/Detail" />?no=${item.productno}'><img src="image/${item.productname}.png"></a></li>
		
					
				</c:forEach>
	</ul>
	<ul class="adbox_dot">
	<c:forEach var="id" varStatus='vs' items="${list}">
	
		<li id="${id.productno}"></li>
		
		</c:forEach>
	</ul>
	<div id="prevbtn" class="adbox_btn">
		<i class="fa fa-chevron-left"></i>
	</div>
	<div id="nextbtn" class="adbox_btn">
		<i class="fa fa-chevron-right"></i>
	</div>
</div>
<%@include file="jspf/footer.jspf"%>
</body>
</html>