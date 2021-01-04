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
<meta name="description" content="blog">
<meta name="keywords" content="blog, article, share, write">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>美誌分享</title>

</head>

<%@include file="../jspf/header.jspf"%>



	<!-- Page Preloder -->
<!-- 	<div id="preloder"> -->
<!-- 		<div class="loader"></div> -->
<!-- 	</div> -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-blog set-bg"
		data-setbg="${pageContext.request.contextPath}/image/blog_backgroundjpg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>美誌分享</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<a class="a1" href="${pageContext.request.contextPath}/blog/empty">
		<h3>我要上傳文章</h3>
	</a>
		<!-- Blog Section Begin -->
		<section class="blog spad">
			<div class="container">
				<div class="row">
				<c:forEach var='b' varStatus='bg' items='${blog}'>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
						
						<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/pic/${b.picture}" style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);"></div>
							<div class="blog__item__text">
								<span><img src="image/icon/calendar.png" alt=""> ${b.commentTime}</span>
								<h5>${b.title}</h5>
								<div class="proprice">上傳者:${b.member.name}</div>
								<span>瀏覽人次:${b.views}</span>	
								 <span class="thumbsup">按讚次數:${b.thumbs} </span>
								<a href="${pageContext.request.contextPath}/blog/${b.blogId}">Read More</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<%@include file="../jspf/footer.jspf"%>


	<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>


</html>