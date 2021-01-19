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

<!-- Breadcrumb Section End -->
<section>
	<div class="updateform">

		<form:form method="POST" modelAttribute="video"
			enctype='multipart/form-data'>
			<fieldset>
				<legend class="title">影片上傳</legend>

				<p>
					<label class="t1" for="">上傳者:</label>
					<input type="text" value="${member.name}" readonly >
						<input type='hidden' value='${member.id}' name='memberId'/>
				</p>



				<p>
					<label for="" class="t1">影片標題:</label>
					<form:input type="text" path="title" value="${title}" />

				</p>
				
						<p>上傳圖片:
						<input id="imageFile" type="file" name="imageFile" accept="image/*">
						</p>
					
						<p>圖片預覽:
						<img id="imageDemo" style="width: auto;height: auto;" src="${video.coverUrl}" onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">

					
						</p>

			

				<p>上傳影片:
					<input id="videoFile" type="file"  name="videoFile" accept="video/*">
					
				</p>
				<p>
				<iframe id="videoDemo"  width="360" height="270" src="/AYCB_final/video/20210102173707705_eason.mp4" frameborder="0"
								allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
				
				
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

<!-- 圖片預覽 -->
<script src="${pageContext.request.contextPath}/js/preview.js"></script>
<script>
// 	var link_area = document.getElementById('link');
// 	var file_area = document.getElementById('file');

// 	function refresh() {

// 		let choice = document.getElementById("option");
// 		let result = choice.value;
// 		console.log("value=" + result);

// 		if (choice.value == 1) {
// 			link_area.style.display = "block";
// 			file_area.style.display = "none";

// 		} else {
// 			link_area.style.display = "none";
// 			file_area.style.display = "block";

// 		}

// 	}
</script>

</body>
</html>