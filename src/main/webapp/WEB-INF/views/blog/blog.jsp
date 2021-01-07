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
<%@include file="../jspf/header.jspf"%>


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
	<c:if test="${not empty member }">
	<a class="a1" href="${pageContext.request.contextPath}/blog/edit">
		<h3>我要上傳文章</h3>	
	</a>
	</c:if>
		<!-- Blog Section Begin -->
		<section class="blog spad">
		
			<div class="container">
				<div class="row">
				<c:forEach var='b' varStatus='bg' items='${blog}'>
				<c:if test="${b.status==0 }">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="blog__item">
						
						<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/pic/${b.picture}" style="background-image: url(&quot;img/blog/blog-1.jpg&quot;);"></div>
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
								<a href="${pageContext.request.contextPath}/blog/delete/${b.blogId}">假刪除</a>
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
// function deleteBlog() {

// // 	var adbox = document.getElementById('adbox');

// 	$.ajax({
		
// //Kevin:async預設是非同步=true,但因為我們需要動態取得圖片,故要等controller將資料帶回來之後才進行,所以這邊用false,其他地方不建議 			
// 		async : false,
// 		type : "get",
// 		url : "${pageContext.request.contextPath}/delete",
// 		contentType : "application/json; charset=utf-8",
// 		dataType : "json",

// 		success : function(data) {

// //				alert("get result!(輪播加工中,要手動輸入/index才會有資料,之後要改ajax動態產生)");
// 			console.log("轉換前:" + data);

// 			console.log("資料數" + data.length);
			
			
			
// 			$('#slides').empty();
// //				$('#slides').width=200*data.length
// 			$('#dots').empty();
			
			
// 			for (let i = 0; i < data.length; i++) {
// 				console.log("data:" + i + data[i]);
// 				$('#slides').append(							
// 				"<li><a href='${pageContext.request.contextPath}/Detail/?no="+data[i].productno+"'>"
// 				+"<img src="+"${pageContext.request.contextPath}/pic/"+data[i].imagepath
				
// 				+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' " 
// 				+" ></a></li>"
// 				);
				
// 				$('#dots').append("<li id="+data[i].productno+"></li>");
		
// 			}												
			
// 		},
// 		error : function() {
// 			alert("fail");
// 		}

// 	})

// }

// getAds();


</script>
 

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