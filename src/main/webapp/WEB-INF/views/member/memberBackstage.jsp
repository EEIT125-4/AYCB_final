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

<title>會員後台管理</title>
<%@include file="../jspf/header.jspf"%>




    <table class="table">
        <thead class="thead-light">
          <tr>
            <th scope="col">會員ID</th>
            
            <th scope="col">名稱</th>
            <th scope="col">帳號</th>
            <th scope="col">信箱</th>
            <th scope="col">手機</th>
            <th scope="col">生日</th>
            <th scope="col">地址</th>
          </tr>
        </thead>
        <tbody>
        
        <c:forEach  items='${memberBackstage}'>
          <tr>
            <th scope="row"></th>
            <td>${member.account}</td>
            <td>${member.name}</td>
            <td>kk</td>
            <td>kk</td>
            <td>ff</td>
            <td>123</td>
        </c:forEach>
       
        
          </tr>
        </tbody>
      </table>




















<c:if test="${not empty member }">

</c:if>

<section></section>

<%@include file="../jspf/footer.jspf"%>

<script>
	function refreshData() {

		console.log("更新Data")

		$.ajax({

			type : 'post',
			url : "forgot",
			datatype : "text",
			data : {
				"email" : email
			},
			//		      		contentType : "application/json;charset=utf-8",

			success : function(data) {

				if (data == "ok") {
// 					swal("密碼重置", "已寄送新密碼至您信箱", "success")

				} else {

// 					swal("發生錯誤", "寄送過程發生錯誤,請稍後再試或撥打客服電話", "error")

				}

			},
			error : function() {
				swal("更新資料失敗","controller error","error");

			}
		})

	}
</script>
</body>

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