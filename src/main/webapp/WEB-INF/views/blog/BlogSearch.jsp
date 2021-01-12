<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<%@include file="../jspf/header.jspf"%>

<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-blog set-bg" data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg" style="background-image: url(&quot;/AYCB_final/image/breadcrumb-bg.jpg&quot;);">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>美誌分享</h2>
			</div>
		</div>
	</div>
	</section>
	
<!-- Breadcrumb Section End -->

<!-- <div class="blog__item__pic set-bg" data-setbg="/AYCB_final/pic/4" style="background-image: url(&quot;/AYCB_final/pic/4&quot;);"></div> -->
<!-- <div class="blog__item__pic set-bg" data-setbg="/AYCB_final/pic/5" style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);"></div> -->


<a class="a1" href="${pageContext.request.contextPath}/blog">
	<button style="width: auto; height: auto; margin-top: 0px;">返回美誌分享</button>
</a>
<section class="blog spad">

	<div class="container">
		<div class="row">
			<c:forEach var='b' varStatus='bg' items='${bg}'>
				<c:if test="${b.status==0 }">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">

							<div class="blog__item__pic set-bg"
								data-setbg="${pageContext.request.contextPath}/pic/${b.picture}"
								style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);"></div>
							<div class="blog__item__text">

								<h5>${b.title}</h5>
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
</html>