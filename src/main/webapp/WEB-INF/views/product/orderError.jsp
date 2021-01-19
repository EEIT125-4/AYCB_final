<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.model.ProductBean,product.cartModel.CartItem,member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	boolean login = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	login = true;
}
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>發生例外</title>
<link rel='stylesheet' href='css/styles.css'  type="text/css" />

</head>
<%@include file="../jspf/header.jspf"%>
<body>
   <section>
      <div class="jumbotron">
         <div class="container">
            <h2 style="font-weight: bold; text-align: center; vertical-align: middle;">抱歉, 這個頁面無法取得</h2>
         </div>
      </div>
   </section>
   <section >
      <div style="font-weight: bold; text-align: center; vertical-align: middle;" class="container">
      <img class='cartimg' src='${pageContext.request.contextPath}/image/cat.jpg'><br>
      <br><br>
      	<div class="container" id="text" style="text-align: left; width: 800px;">
           <h4>請求網址: ${url}</h4>
           <h4>例外類型: ${exception}</h4>
        </div>
      </div>
      <br><br>
      <div class="container" style="text-align: center;">
           <p>
             <a href="<spring:url value='/car' />"  class='btn btn-primary' style="font-size: 18px;">返回</a>
           </p>
      </div>
   </section>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>