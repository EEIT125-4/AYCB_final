<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
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
	<section class="breadcrumb-blog set-bg" data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg" style="background-image: url(&quot;/AYCB_final/image/breadcrumb-bg.jpg&quot;);">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>查詢文章</h2>
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
<section class="blog spad">

	<div class="container">
		<div class="row">
			
			<div>${b.title}</div>
			<div>${b.status}</div>
			
			
			<c:forEach var='b' varStatus='bg' items='${bgsearch}'>
				<c:if test="${b.status=='顯示' }">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
						
						<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/pic/${b.picture}" style="background-image: url(${pageContext.request.contextPath}/pic/${b.picture});"></div>
							<div class="blog__item__text">
								
								<h5>${b.title}</h5>
								<div class="proprice">上傳者:${b.member.name}</div>
								<span>瀏覽人次:${b.views}</span>	
								 <span class="thumbsup">按讚次數:${b.thumbs} </span>
								 <span><img src="${pageContext.request.contextPath}/image/icon/calendar.png" alt="">上傳時間: ${b.commentTime}</span>
								 <span><img src="${pageContext.request.contextPath}/image/icon/calendar.png" alt="">修改時間: ${b.fixedtime}</span>
								<a href="${pageContext.request.contextPath}/blog/${b.blogId}">Read More</a>
								<c:if test="${b.member.id eq member.id}">
								<br>
								<a href="${pageContext.request.contextPath}/blog/edit/${b.blogId}">edit</a>
								</c:if>
								
								<c:if test="${b.member.id eq member.id}">
								<br>
								<a href="${pageContext.request.contextPath}/blog/delete/${b.blogId}">刪除</a>
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

<script>


</script>
</body>
</html>