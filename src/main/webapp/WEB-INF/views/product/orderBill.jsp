<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.model.ProductBean,product.cartModel.CartItem,member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/cart.css" TYPE="text/css">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>結帳明細</title>
<style>
.progress_bar {
	display: flex;
	justify-content: center;
}

.progress_bar li {
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	background-image: linear-gradient(9deg, #B22222, #DB7093);
	color: #fff;
	width: 105px;
	height: 105px;
	border-radius: 50%;
	position: relative;
	box-shadow: 0px 0px 0px 4px #fff;
}

.progress_bar li+li {
	margin-left: 100px;
}

.progress_bar li+li:before {
	content: '';
	position: absolute;
	width: 100px;
	height: 5px;
	background-color: #DB7093;
	top: 0;
	bottom: 0;
	left: -100px;
	margin: auto;
	box-shadow: 0px 0px 0px 2px #fff;
}

.progress_bar li.active ~li {
	background-image: linear-gradient(9deg, #999, #ccc);
}

.progress_bar li.active ~li:before {
	background-color: #999;
}

.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}
.top {
		color: white;
		background: #FF2D2D;
		padding: 14px 10px;
		position: fixed;
		right: 20px;
		bottom: 100px;
		text-align: center;
		border-radius: 50px;
		z-index: 1;
	}
	
</style>
</head>
<%@include file="../jspf/header.jspf"%>
<div id="mytop" style="text-align: center" class="container">

 	<% 
 		MemberBean member = (MemberBean) session.getAttribute("member");
 	%>  

<div>
	<ol class="progress_bar">
		<li >購物車</li>
		<li>結帳</li>
		<li class="active">結帳明細</li>
	</ol>
</div>
<br><br>

   <TABLE border='2' class="table table-bordered" style="margin: 0 auto; border-style: ridge; width:1000px;">
      <TR class="table-success">
         <TD colspan='1' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	會員編號：${account}
         </TD>
         <TD colspan='3' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	顧客姓名：${name}
         </TD>
         <TD colspan='2' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
      </TR>
       <TR class="table-success">
         <TD colspan='6' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	收件人：${receiveName}
         </TD>
      </TR>
       <TR class="table-success">
         <TD colspan='6' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	聯絡電話：${phone}
         </TD>
      </TR>
      <TR class="table-success">
         <TD colspan='6' style="text-align:left; border-style: ridge;font-size: 15pt;">
         	出貨地址：${address}
         </TD>
      </TR>    
<!--       <TR> -->
<!--     	<TD colspan='3'> -->
         
<!--    <TABLE border='1' class="" style="width:800px; " > -->
      
     <TR class="table-secondary">
     	<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">商品</th>
		<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">品牌</th>
		<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">系列</th>				
		<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">價格</th>
		<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">數量</th>
		<th style="text-align: center; vertical-align: middle;font-size: 15pt;" scope="col">小計</th>
     </TR>
	 		<%
					
      			List<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
   				for (CartItem item : cart) { 
 			%>                                     
      <TR class="table-warning">  
        <td style="text-align: left; vertical-align: middle;font-size: 13pt;"><%=item.getProductName()%></td>
        <td style="text-align: center; vertical-align: middle;font-size: 13pt;"><%=item.getBrandName()%></td>
        <td style="text-align: center; vertical-align: middle;font-size: 13pt;"><%=item.getProductSeries()%></td>
        <td style="text-align: center; vertical-align: middle;font-size: 13pt;">NT$ <fmt:formatNumber value="<%=item.getProductPrice()%>"  pattern="###,###" /></td>
        <td style="text-align: center; vertical-align: middle;font-size: 13pt;"><%=item.getQtyOrdered()%></td>
        <td style="text-align: center; vertical-align: middle;font-size: 13pt;">NT$ <fmt:formatNumber value="<%=item.getProductPrice() * item.getQtyOrdered()%>"  pattern="###,###" /></td>
      </TR> 
  			<% 
   				}   
 			%> 
        <TR height='25' class="table-warning">
          <TD style="text-align:right;font-size: 13pt;" colspan='5' >合計金額：</TD>
          <TD style="text-align:right;font-size: 13pt;" >
          <fmt:formatNumber value="${totalPrice}" pattern="#,###,###" />元</TD>
               
        </TR>
        <TR class="table-warning">
          <TD colspan='5' style="text-align:right;font-size: 13pt;" >貨運費：</TD>
          <TD style="text-align:right;font-size: 13pt;" > 50元</TD>
        </TR>
        <TR class="table-warning">
          <TD colspan='5' style="text-align:right;font-size: 15pt;" >總計金額：</TD>
          <TD style="text-align:right;font-size: 15pt;color:#AA0200;" >
          <fmt:formatNumber value="${Shipping}" pattern="#,###,###" />元</TD>
        </TR>
<!--    </TABLE> -->
<!--           </TD> -->
<!--       </TR> -->
 
   </TABLE>
   <br>
			<p>
             <a href="<spring:url value='/All' />"  class='btn btn-dark' style="font-size: 18px;">結束</a>
           </p>

<% 		
		session.removeAttribute("cart");
		session.removeAttribute("totalPrice");
		session.removeAttribute("totalQtyOrdered");
		session.removeAttribute("Shipping");
		session.removeAttribute("phone");
		session.removeAttribute("address");
		session.removeAttribute("email");
		session.removeAttribute("receiveName");
		
%>
			<br>
			<br>
			<br>

	
</div>
<%-- <%@include file="../jspf/footer.jspf"%> --%>
<script>


</script>
</body>
</html>