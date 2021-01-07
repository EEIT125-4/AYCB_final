<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="${pageContext.request.contextPath}/js/main.js"></script>

<title>ALL YOU CAN BUY</title>



<!-- Css Styles -->



<%@include file="jspf/header.jspf"%>
<%-- <c:set var="projectPath" value="${pageContext.request.contextPath}" scope="application" /> --%>
<%-- <c:out value=projectpath/> --%>
<div >

<div class="adbox" id="adbox">
	<ul class="adbox_slides" id="slides">

	</ul>
	<ul class="adbox_dot" id="dots">
	
	</ul>
	<div id="prevbtn" class="adbox_btn">
		<i class="fa fa-chevron-left"></i>
	</div>
	<div id="nextbtn" class="adbox_btn">
		<i class="fa fa-chevron-right"></i>
	</div>
</div>
</div>

<%@include file="jspf/footer.jspf"%>
</body>



<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	function getAds() {

		var adbox = document.getElementById('adbox');

		$.ajax({
			
//Kevin:async預設是非同步=true,但因為我們需要動態取得圖片,故要等controller將資料帶回來之後才進行,所以這邊用false,其他地方不建議 			
			async : false,
			type : "get",
			url : "${pageContext.request.contextPath}/ads",
			contentType : "application/json; charset=utf-8",
			dataType : "json",

			success : function(data) {

// 				alert("get result!(輪播加工中,要手動輸入/index才會有資料,之後要改ajax動態產生)");
				console.log("轉換前:" + data);

				console.log("資料數" + data.length);
				
				
				
				$('#slides').empty();
// 				$('#slides').width=200*data.length
				$('#dots').empty();
				
				
				for (let i = 0; i < data.length; i++) {
					console.log("data:" + i + data[i]);
					$('#slides').append(							
					"<li><a href='${pageContext.request.contextPath}/Detail/?no="+data[i].productno+"'>"
					+"<img src="+"${pageContext.request.contextPath}/pic/"+data[i].imagepath
					
					+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' " 
					+" ></a></li>"
					);
					
					$('#dots').append("<li id="+data[i].productno+"></li>");
			
				}												
				
			},
			error : function() {
				alert("fail");
			}

		})

	}

	getAds();
</script>
<script src="js/Home.js" defer="defer"></script>



</html>