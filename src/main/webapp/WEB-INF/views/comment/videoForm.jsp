<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css">
<meta charset="UTF-8">
<title>上傳影片</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file="../jspf/footer.jspf"%>
<%-- ${member} --%>
<style>
.center {
	width: 500px;
	margin-left: 500px;
}
</style>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg"
	data-setbg="/AYCB/image/breadcrumb-bg2.jpg"
	style="background-image: url(&quot;/AYCB/image/breadcrumb-bg2.jpg&quot;);">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>影片上傳</h2>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<div class='center' style='position: relative; top: 200px;'>
	<form:form method="POST" modelAttribute="video" enctype='multipart/form-data'>
		<fieldset class="updateform">
			<legend class="title">影片上傳</legend>
			<p>
				<label class="t1" for="">上傳者:</label>
				<form:input type="text" path="member" value="${member.name}"
					disabled='true' />
			</p>
			<p>
				<label for="" class="t1">影片標題:</label> <input type="text"
					name="title" value="${title}">
			</p>
			<p>
				<label for="" class="t1">上傳影片的網址:</label> <input type="text"
					name="url" value="${url}"
					placeholder="例:https://www.youtube.com/embed/36jbdUTUwxU">
			</p>
			<p>
				<input type="hidden" name="commentTime" value="${commentTime}">
			</p>

			<p>
				<input type="hidden" name="status" value="0">
			</p>

			<p>
				<input type="hidden" name="id" value="${id}">
			</p>
			<p>
				<input type="hidden" name="videoId" value="${videoId}">
			</p>
			<input type="submit" name="confirmupdate" value="送出">

		</fieldset>
	</form:form>
</div>
</body>
=======
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

<title>上傳影片</title>


</head>

<!-- Breadcrumb Section Begin -->

<%@include file="../jspf/header.jspf"%>

<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg2.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>影片上傳</h2>
			</div>
		</div>
	</div>
</section>
<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<h2>影片上傳</h2> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- Breadcrumb Section End -->
<section>
	<div class="updateform">

		<form:form method="POST" modelAttribute="video"
			enctype='multipart/form-data'>
			<fieldset>
				<legend class="title">影片上傳</legend>

				<p>
					<label class="t1" for="">上傳者:</label>
					<form:input type="text" path="member" value="${member.name}"
						disabled='true' />
				</p>
				<p>
					<label for="" class="t1">影片標題:</label>
					<form:input type="text" path="title" value="${title}" />

				</p>
				<p>
					<label for="" class="t1">上傳網址:</label>
					<form:input type="text" path="url" value="${url}" placeholder="https://www.youtube.com/embed/gacTr733e5U"/>

				</p>


				<p>
					<form:input type="hidden" path="status" value="0" />
				</p>

				<p>
					<form:input type="hidden" path="videoId" value="${videoId}" />
				</p>
				<p>
					<input id="file" type="file" name="file" />
				</p>

				<input type="submit" name="confirmupdate" value="送出">


			</fieldset>


		</form:form>
	</div>
</section>


<%@include file="../jspf/footer.jspf"%>


<!-- Blog Section End -->

<!-- Js Plugins -->
<!-- 	Kevin:這裡非常奇怪,header已經載入過的js失效,且必須在body末端加入才有效?? -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
>>>>>>> Stashed changes
</html>