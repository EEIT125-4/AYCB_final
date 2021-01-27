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
<!-- <link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css"> -->

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="${pageContext.request.contextPath}/css/inside.css"
	rel="stylesheet">

<script>
	$(document).ready(function() {
		CK();
	});
</script>

<title>美誌分享</title>
</head>
<%@include file="../jspf/header.jspf"%>

<style>
/* 我要上傳 * 調整button的size/
/* .uploadbutton { */
/* 	width: auto; */
/* 	height: auto; */
/* 	margin-top: 10px; */
/* 	margin-left: 200px; */
/* } */

/* 文章上傳 */
.button1 {
	display: inline-block;
	border-radius: 4px;
	background-color: #B15BFF;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 20px;
	width: 150px;
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

/* 各種查詢按鈕 */
.btn-group .button {
	background-color: white;
	border: 2px solid #BE77FF;
	color: black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	float: left;
	border-radius: 10px;
}

.btn-group .button:not(:last-child) {
	border-right: none; /* Prevent double borders */
}

.btn-group .button:hover {
	background-color: #BE77FF;
}
/* 各種查詢按鈕 end*/
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>美誌分享</h2>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
<c:if test="${not empty member }">
	<a class="a1" href="${pageContext.request.contextPath}/blog/edit">
		<button class="button1"
			style="vertical-align: middle; margin-left: 30px; margin-top: 10px">
			<span>上傳文章 </span>
		</button>
	</a>
</c:if>

<c:if test="${empty member }">
	<button
		style="vertical-align: middle; margin-left: 120px; margin-top: 10px; border: white; background-color: white; color: white;">
		<span>上傳文章 </span>
	</button>

</c:if>

<div class="btn-group"
	style="margin-top: 30px; margin-left: 50px; margin-top: 20px;">
	<form action="<c:url value='/SelectSearchBar' />" method="GET">
		<button class="button" name="mask" value="面膜">面膜</button>
		<button class="button" name="iso" value="隔離乳">隔離乳</button>
		<button class="button" name="serum" value="精華">精華</button>
		<button class="button" name="you" value="玻尿酸">玻尿酸</button>

		<button class="button" name="bio" value="碧兒泉">碧兒泉</button>
		<button class="button" name="olay" value="Olay">Olay</button>
		<button class="button" name="origin" value="品木宣言">品木宣言</button>
		<button class="button" name="dr" value="森田藥妝">森田藥妝</button>

		<button class="button" name="moist" value="保濕">保濕</button>
		<button class="button" name="care" value="保養">保養</button>
		<button class="button" name="skin" value="護膚">護膚</button>
	</form>
</div>



<div class="search-container">
	<c:if test="${not empty member }">
		<a class="a1" href="${pageContext.request.contextPath}/blog/allCollect">
			<button class="button1"
				style="vertical-align: middle; margin-left: 30px; margin-top: 10px">
				<span>我的收藏 </span>
			</button>
		</a>
	</c:if>

	<form action="<c:url value='/SelectSearchBar' />" method="GET"
		name="search" style="margin-left: 1200px; margin-top: 10px;">
		<input type="text" placeholder="查詢文章...." name="search">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>
</div>
<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<c:forEach var='b' varStatus='bg' items='${blog}'>
				<c:if test="${b.status=='顯示' }">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic set-bg"
								data-setbg="${pageContext.request.contextPath}/pic/${b.picture}"
								style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);">
								<!-- heart收藏 -->
								<div id="like1" class="like" style="display: block;">
									<button id="likebtn${b.blogId}" class="like_button"
										onclick="Collect(${member.id},${b.blogId})"
										style="border: none; font-size: 25px;">
										<i id="heart${b.blogId}" class="fa fa-heart-o"></i>
									</button>
								</div>
								<!-- heart收藏 end-->
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

<script>
function Collect(mid, blogId) {
	$.ajax({
		type : 'GET',
		url : 'storage',
		data : {
			"mid" : mid,
			"bid" : blogId
		},
		dataType : "json",
		success : function(data) {
			if (data) {
				swal.fire("收藏成功", "", "success");
				$('#heart' + blogId).attr('class', 'fa fa-heart');
// 				$('#like' + blogId).css('display', 'block');
// 				$('#likebtn' + blogId).css('border', 'none');
			} else {
				swal.fire("取消收藏", "", "error");
				$('#heart' + blogId).attr('class', 'fa fa-heart-o');
// 				$('#like' + blogId).css('display', 'none');
// 				$('#like' + blogId).removeAttr("style");
// 				$('#likebtn' + blogId).css('border', '2px solid gray');
				
			}
		}
	});
}

function CK() {
	$.ajax({
		type : 'GET',
		url : 'storagectcheck',
		dataType : "json",
		success : function(data) {
			for (let i = 0; i < data.No.length; i++) {
				$('#heart' + data.No[i]).attr('class', 'fa fa-heart');

			}
		}
	});
};
</script>


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

<!-- heart收藏 -->



</html>