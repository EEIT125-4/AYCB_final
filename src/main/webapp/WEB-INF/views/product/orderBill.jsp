<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.model.ProductBean,product.cartModel.CartItem,member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/cart.css" TYPE="text/css">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>結帳明細</title>
<style>
.progress_bar {
	display: flex;
	justify-content: center;
}

.progress_bar li {
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	background-image: linear-gradient(9deg, #B22222, #DB7093);
	color: #fff;
	width: 105px;
	height: 105px;
	border-radius: 50%;
	position: relative;
	box-shadow: 0px 0px 0px 4px #fff;
}

.progress_bar li+li {
	margin-left: 100px;
}

.progress_bar li+li:before {
	content: '';
	position: absolute;
	width: 100px;
	height: 5px;
	background-color: #DB7093;
	top: 0;
	bottom: 0;
	left: -100px;
	margin: auto;
	box-shadow: 0px 0px 0px 2px #fff;
}

.progress_bar li.active ~li {
	background-image: linear-gradient(9deg, #999, #ccc);
}

.progress_bar li.active ~li:before {
	background-color: #999;
}

.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}
.top {
		color: white;
		background: #FF2D2D;
		padding: 14px 10px;
		position: fixed;
		right: 20px;
		bottom: 100px;
		text-align: center;
		border-radius: 50px;
		z-index: 1;
	}
	
</style>
</head>
<%@include file="../jspf/header.jspf"%>
<div id="mytop" style="text-align: center">

 	<% 
 		MemberBean member = (MemberBean) session.getAttribute("member");
 	%>  

<div>
	<ol class="progress_bar">
		<li >購物車</li>
		<li>結帳</li>
		<li class="active">結帳明細</li>
	</ol>
</div>
<br><br>


			<br>
			<br>
			<br>

	<a onclick="goTop();"><div class="top">TOP</div></a>
</div>
<%@include file="../jspf/footer.jspf"%>
<script>

function goTop(){
	var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
	$body.animate({
		scrollTop: 0
	}, 200);
}

function checkQty(e){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", '<c:url value="/setQtyAjax" />?id='+e+"&Qty="+$("#"+e).val()
			, true);
	xhr.send();
	xhr.onload = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			Swal.fire({
				  icon: 'success',
				  title: '修改成功',
				  showConfirmButton: false,
				  timer: 1500
				})
		}else{
			//alert("fail")
		}
	
	console.log($("#"+e).val())
	}
}
</script>
</body>
</html>