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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/video.css" />

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
	background-image:
		url('${pageContext.request.contextPath}/image/searchicon.png');
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
</style>

<jsp:useBean id="videolist" class="video.model.Video" scope="session" />

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

<a class="a1" href="#">
	<button style="width: auto; height: auto; margin-top: 0px;"
		onclick="alert('更新影片')">更新影片</button>
</a>
<div style="text-align: center;">

<c:forEach var='category' varStatus='vs' items='${categorys}'>
	<button class='tagbtn' type="button">${category}</button>	
	<c:if test='${vs.count%5 == 0 }'>
	<br>							
	</c:if>		
</c:forEach>


</div>

<form>
	<input type="text" name="search" placeholder="查詢影片....">
</form>

<!--social media icons -->
<div class="row">
	<!-- video start -->

	<section class="blog spad container"
		style="background-image: url(${pageContext.request.contextPath}/image/background.jpg);background-size: cover;">
		<!-- 		   <div class="container">			 -->
		<div class="row">
			<c:forEach var='v' varStatus='vs' items='${videolist}'>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<a
							href='${pageContext.request.contextPath}/video/videoWatch?videoID=${v.videoId}'>
							<div class="blog__item__pic set-bg" data-setbg="${v.coverUrl}">
							</div>
						</a>
						<%-- 					<img src="" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'> --%>


						<%-- 							<iframe width="360" height="270" src="${v.url}" frameborder="0" --%>
						<!-- 								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" -->
						<!-- 								allowfullscreen></iframe> -->




						<div class="blog__item__text" style="border-style: double;">
							<span>上傳日期<img
								src="${pageContext.request.contextPath}/image/icon/calendar.png"
								alt=""> ${v.commentTime}
							</span>
							<h5>${v.title}</h5>
							<div class="picform">
								<img class='headpic'
									src='${pageContext.request.contextPath}/pic/${v.member.iconid}'>
							</div>
							<div class="proprice">上傳者:${v.member.name}</div>
							<div class="cart">

								<i class="fa fa-thumbs-o-up fa-1g">${v.thumbsup}</i> <i
									class="fa fa-thumbs-o-down fa-1g">${v.thumbsdown}</i>
									
									<i class="fa fa-eye" aria-hidden="true">${v.viewCount}</i>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- video end -->

	<!-- 	social media icons -->
	<!-- Kevin 既然沒有效果就不要show -->
	<!-- 	<div class="stickyicon-list" style="font-size:30px"> -->
	<!-- 		<a href="#facebook" class="facebook"> <i class="fa fa-facebook"></i> -->
	<!-- 		</a> <a -->
	<!-- 			href="http://twitter.com/home/?status=https://www.removal.idv.tw/article.php" -->
	<!-- 			class="twitter"> <i class="fa fa-twitter"></i> -->
	<!-- 		</a> <a href="#google" class="google"> <i class="fa fa-google"></i></a> <a -->
	<!-- 			href="#youtube" class="youtube"> <i class="fa fa-youtube"></i> -->
	<!-- 		</a> -->
	<!-- 	</div> -->
</div>



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


<script>

//往下捲載入更多影片
$(window).scroll(function () {

    if ($(window).scrollTop() >= $(document).height() - $(window).height() && flag <= 10) {
    	
    	
        console.log("增加內容");
        for (let i = 0; i < 3; i++) {
            flag += 1;
            $('.row').append(
            "<div class='col-lg-4 col-md-6 col-sm-6'>"
			+"<div class='blog__item'>"
			+"<a href='${pageContext.request.contextPath}/video/videoWatch?videoID="+data+"'>"
			+"<div class='blog__item__pic set-bg' data-setbg='${v.coverUrl}'>"
			+"</div>"
			
				
				
			</a>
			<%-- 					<img src="" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'> --%>


			<%-- 							<iframe width="360" height="270" src="${v.url}" frameborder="0" --%>
			<!-- 								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" -->
			<!-- 								allowfullscreen></iframe> -->




			<div class="blog__item__text" style="border-style: double;">
				<span>上傳日期<img
					src="${pageContext.request.contextPath}/image/icon/calendar.png"
					alt=""> ${v.commentTime}
				</span>
				<h5>${v.title}</h5>
				<div class="picform">
					<img class='headpic'
						src='${pageContext.request.contextPath}/pic/${v.member.iconid}'>
				</div>
				<div class="proprice">上傳者:${v.member.name}</div>
				<div class="cart">

					<i class="fa fa-thumbs-o-up fa-1g">${v.thumbsup}</i> <i
						class="fa fa-thumbs-o-down fa-1g">${v.thumbsdown}</i>
						
						<i class="fa fa-eye" aria-hidden="true">${v.viewCount}</i>
				</div>
			</div>
		</div>
	</div>"		
            		
            		
            		
            		
            

            );
        }



        // 	$.ajax({

        // 		type:"GET",
        // 		url:"StoreGetClassStoreAjax",
        // 		data:{
        // 			....
        // 			'offset':flag
        // 		},
        // 		datatype:'json',
        // 		success:function (data){
        // 			for(var i = 0; i < data.length;i++){
        // 				context +=
        // 					產生內容
        // 		}
        // 			flag += 3;  一次產生3筆
        // 			$("#ajax").html(context);


        // 		}
        // })
    }
});



</script>

</body>
</html>