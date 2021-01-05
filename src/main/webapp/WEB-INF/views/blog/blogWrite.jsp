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
<title>Blog撰寫</title>



<%@include file="../jspf/header.jspf"%>
	
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-blog set-bg"
		data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg3.jpg">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>Blog撰寫</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<div id="tab-demo">
		<ul class="tab-title">
			<li><a href="#tab01">文章目錄</a></li>
			<li><a href="#tab02">影音目錄</a></li>
		</ul>
		<div id="tab01" class="tab-inner">
			<p>文章標題列表</p>
		</div>
		<div id="tab02" class="tab-inner">
			<p>影音標題列表</p>
		</div>

	</div>
	<%@include file="../jspf/footer.jspf"%>
</body>
	<script>
		$(function() {
			var $li = $('ul.tab-title li');
			$($li.eq(0).addClass('active').find('a').attr('href')).siblings(
					'.tab-inner').hide();

			$li.click(function() {
				$($(this).find('a').attr('href')).show().siblings('.tab-inner')
						.hide();
				$(this).addClass('active').siblings('.active').removeClass(
						'active');
			});
		});
	</script>
	<!-- Js Plugins -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>	 --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>	 --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>	 --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>	 --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>
</html>