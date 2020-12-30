<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>index</title>



<!-- Css Styles -->


</head>
<%@include file="jspf/header.jspf"%>
<div class="adbox" id="adbox">
	<ul class="adbox_slides">
		<c:forEach var="item" varStatus='vs' items="${list}">

			<li><a href='<c:url value="/Detail" />?no=${item.productno}'><img
					src="${pageContext.request.contextPath}/pic/${item.imagepath}"
					onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
			</a></li>


		</c:forEach>
	</ul>
	<ul class="adbox_dot">
		<c:forEach var="id" varStatus='vs' items="${list}">

			<li id="${id.productno}"></li>

		</c:forEach>
	</ul>
	<div id="prevbtn" class="adbox_btn">
		<i class="fa fa-chevron-left"></i>
	</div>
	<div id="nextbtn" class="adbox_btn">
		<i class="fa fa-chevron-right"></i>
	</div>
</div>



<%@include file="jspf/footer.jspf"%>



<script src="js/Home.js" defer="defer"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	function getAds() {

		var adbox = document.getElementById('adbox');

		$.ajax({
			async : true,
			type : "get",
			url : "${pageContext.request.contextPath}/ads",
			contentType : "application/json; charset=utf-8",
			dataType : "json",

			success : function(data) {

				alert("get result!");
				console.log("轉換前:" + data);
// 				let result = eval(data);
// 				console.log("type:" + typeof (result));
// 				console.log(result);
				console.log("資料數" + data.length);

				for (let i = 0; i < data.length; i++) {

					console.log("result index"+i+":"+data[i].productname);
					

				}

				// 				<c:forEach var="item" varStatus='vs' items="${list}">

				// 				<li><a href='<c:url value="/Detail" />?no=${item.productno}'><img
// 						src="${pageContext.request.contextPath}/pic/${item.imagepath}"
// 						onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
				// 						</a></li>

				// 			</c:forEach>
				// 		</ul>
				// 		<ul class="adbox_dot">
				// 			<c:forEach var="id" varStatus='vs' items="${list}">

				// 				<li id="${id.productno}"></li>

				// 			</c:forEach>

			},
			error : function() {
				alert("fail");
			}

		})

	}

	getAds();
</script>
</body>


</html>