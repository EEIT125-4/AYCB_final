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
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>影音分享</title>
</head>

<%@include file="../jspf/header.jspf"%>


<jsp:useBean id="videolist" class="comment.model.Video" scope="session" />

	<!-- Page Preloder -->
<!-- 	<div id="preloder"> -->
<!-- 		<div class="loader"></div> -->
<!-- 	</div> -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-blog set-bg"
		data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>影音分享</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<!-- Blog Section Begin -->
	<a class="a1"
		href="${pageContext.request.contextPath}/video/empty">
		<h3>我要上傳影片</h3>
	</a>
	<div class="search-container" style="text-align: right">
		<form action="/#"></form>
		<input type="text" placeholder="查詢影片...." name="search">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</div>

	<section class="blog spad">
		<div class="container">
			<div class="row">

				<c:forEach var='v' varStatus='vs' items='${videolist}'>

					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic set-bg">
								<iframe width="360" height="270" src="${v.url}" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
							<div class="blog__item__text">
								<span><img src="image/icon/calendar.png" alt="">
									${v.commentTime} </span>
								<h5>${v.title}</h5>
								<div class="proprice">上傳者:${v.member.name}</div>

								<span class="cart">點讚 <i style="font-size: 24px"
									class="fa">&#xf087;</i>

								</span> <span class="thumbsup">${v.thumbsup}</span>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>

<%@include file="../jspf/footer.jspf"%>
	<!-- Blog Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>