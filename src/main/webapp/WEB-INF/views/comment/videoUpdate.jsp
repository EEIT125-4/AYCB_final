<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css">

<title>更新影片</title>


</head>

<!-- Breadcrumb Section Begin -->

<%@include file="../jspf/header.jspf"%>

<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg2.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>影片更新</h2>
			</div>
		</div>
	</div>
</section>


<!-- Breadcrumb Section End -->
<div class="row" style="float: right">
	<!-- video start -->
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
								<span><img
									src="${pageContext.request.contextPath}/image/icon/calendar.png"
									alt=""> ${v.commentTime} </span>
								<h5>${v.title}</h5>
								<div class="proprice">上傳者:${v.member.name}</div>

								<div class="cart">
									點讚 <i style="font-size: 24px" class="fa">&#xf087;</i>
								</div>
								<span class="thumbsup">${v.thumbsup}</span>
								
								<button style="width: auto; height: auto; margin-top: 0px;"
									name="update">更新</button>
					
								<button style="width: auto; height: auto; margin-top: 0px;"
										name="delete">刪除</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- video end -->

	<%@include file="../jspf/footer.jspf"%>
	<!-- Blog Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<!-- video Js Plugins -->
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
</html>