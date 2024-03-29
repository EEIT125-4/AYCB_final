<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	boolean login = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	login = true;
}
%>

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
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="${pageContext.request.contextPath}/css/inside.css"
	rel="stylesheet">

<title>文章收藏</title>
</head>
<%@include file="../jspf/header.jspf"%>

<style>
.button1 {
	display: inline-block;
	border-radius: 4px;
	background-color: #B15BFF;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button1 span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button1 span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button1:hover span {
	padding-right: 25px;
}

.button1:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>我的收藏</h2>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
<a class="a1" href="${pageContext.request.contextPath}/blog">
	<button class="button1"
		style="vertical-align: middle; margin-left: 30px; margin-top: 10px">
		<span>返回美誌分享</span>
	</button>
</a>

<%-- <a class="a1" href="${pageContext.request.contextPath}/blog"> --%>
<!-- 	<button class=button1;>返回美誌分享</button> -->
<!-- </a> -->

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<c:forEach var='b' varStatus='bg' items='${collect}'>
				<c:if test="${b.status=='顯示' }">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic set-bg"
								data-setbg="${pageContext.request.contextPath}/pic/${b.picture}"
								style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);">
							</div>
							<div class="blog__item__text">
								<a href="${pageContext.request.contextPath}/blog/${b.blogId}"><h5>${b.title}</h5></a>
								<div class="proprice">上傳者:${b.member.name}</div>
								<span>瀏覽人次:${b.views}</span> <span class="thumbsup">按讚次數:${b.thumbs}
								</span> <span><img
									src="${pageContext.request.contextPath}/image/icon/calendar.png"
									alt="">上傳時間: ${b.commentTime}</span> <span><img
									src="${pageContext.request.contextPath}/image/icon/calendar.png"
									alt="">修改時間: ${b.fixedtime}</span> <a
									href="${pageContext.request.contextPath}/blog/${b.blogId}">Read
									More</a>
								<c:if test="${b.member.id eq member.id}">
									<br>
									<a
										href="${pageContext.request.contextPath}/blog/edit/${b.blogId}">edit</a>
								</c:if>

								<c:if test="${b.member.id eq member.id}">
									<br>
									<a
										href="${pageContext.request.contextPath}/blog/delete/${b.blogId}">刪除</a>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</section>
<%@include file="../jspf/footer.jspf"%>
</body>



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

</html>