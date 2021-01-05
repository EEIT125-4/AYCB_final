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
<meta name="keywords" content="skincare, skin, cure, green">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/comment.css" />

<!-- social media -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<title>影音分享</title>
</head>

<%@include file="../jspf/header.jspf"%>
<style>
input[type=text] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image:url('${pageContext.request.contextPath}/image/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
	margin-left: 200px;
}

input[type=text]:focus {
	width: 100%;
}

/* social media */
.fa {
	padding: 20px;
	font-size: 30px;
	width: 50px;
	text-align: center;
	text-decoration: none;
	margin: 5px 2px;
}

.fa:hover {
	opacity: 0.7;
}

.fa-facebook {
	background: #3B5998;
	color: white;
	border-radius: 12px;
	left: 50px;
	width: 30%;
	float: right;
}

.fa-twitter {
	background: #55ACEE;
	color: white;
	border-radius: 12px;
	width: 30%;
	float: right;
}

.fa-google {
	background: #dd4b39;
	color: white;
	border-radius: 12px;
	width: 30%;
	float: right;
}

.fa-youtube {
	background: #bb0000;
	color: white;
	border-radius: 12px;
	width: 30%;
	float: right;
}
</style>

<jsp:useBean id="videolist" class="comment.model.Video" scope="session" />

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
<a class="a1" href="${pageContext.request.contextPath}/video/empty">
	<button style="width: auto; height: auto; margin-top: 0px;">上傳影片</button>
</a>
<a class="a1" href="${pageContext.request.contextPath}/video/update" >
	<button style="width: auto; height: auto; margin-top: 0px;"onclick="alert('更新影片')">更新影片</button>
</a>

<form>
	<input type="text" name="search" placeholder="查詢影片....">
</form>

<!--social media icons -->
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
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- video end -->
	<div>
		<a href="#" class="fa fa-facebook" style="width: auto; height: auto; margin-top: 0px;"></a>
		<a href="#" class="fa fa-google" style="width: auto; height: auto; margin-top: 0px;"></a>
		<a href="http://twitter.com/home/?status=https://www.removal.idv.tw/article.php"
			class="fa fa-twitter" style="width: auto; height: auto; margin-top: 0px;"></a> 
		<a href="#" class="fa fa-youtube" style="width: auto; height: auto; margin-top: 0px;"></a>
	</div>
</div>
<!--social media icons end-->

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