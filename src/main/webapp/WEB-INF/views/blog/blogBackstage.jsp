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

<title>網誌後台</title>
<%@include file="../jspf/header.jspf"%>


		<div>
		<h1>網誌後台</h1>
		<table>
		    <thead>
            <tr>
                <th>id</th>
                <th>上傳時間</th>
                <th>修改時間</th>
                <th>狀態列</th>
                <th>標題</th>
                <th>上傳會員</th>
                 <th>點讚次數</th>
                  <th>觀看次數</th>
                   <th>分類</th>
            </tr>
        </thead>
		<c:forEach var='b' varStatus='bg' items='${blogs}'>
		<tr>
		
		<td>${b.blogId}</td>
		<td>${b.commentTime}</td>
		<td>${b.fixedtime}</td>
		<td>
<%-- 		${b.status} --%>
			<select>
				<option value="0">顯示</option>
				<option value="1">審核中</option>
				<option value="2">維護中</option>
				<option value="3">用戶刪除</option>
			</select>
			
		</td>
		<td>${b.title}</td>
		<td>${b.member.name}</td>
		<td>${b.thumbs}</td>
		<td>${b.views}</td>	
		</tr>
		
		</c:forEach>
		</table>
		</div>
		
		
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
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>


</html>