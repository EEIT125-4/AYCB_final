<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.model.ProductBean,product.cartModel.CartItem,member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div id="mytop" style="text-align: center">

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
	<FORM style="margin: 0 auto; width:750px;" action="" method="" >
   <TABLE border='1' style="background:#F5EBFF; border-color:rgb( 100, 100, 255); border-style: outset; width:810;">
      <TR >
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員編號：${account}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	顧客姓名：${name}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
      </TR>
       <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	收件人：${receiveName}
         </TD>
      </TR>
       <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	聯絡電話：${phone}
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	出貨地址：${address}
         </TD>
      </TR>    
      <TR>
    	<TD colspan='3'>
         
   <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " >
      
     <TR>
     	<th style="text-align: center; vertical-align: middle; width: 150px" scope="col">商品</th>
		<th style="text-align: center; vertical-align: middle; width: 150px" scope="col">品牌</th>
		<th style="text-align: center; vertical-align: middle; width: 250px" scope="col">系列</th>				
		<th style="text-align: center; vertical-align: middle;" scope="col">價格</th>
		<th style="text-align: center; vertical-align: middle;" scope="col">數量</th>
		<th style="text-align: center; vertical-align: middle;" scope="col">小計</th>
     </TR>
	 		<%
					
     			List<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
 				for (CartItem item : cart) {
 			%>                                    
         <TR > 
        <td style="text-align: center; vertical-align: middle;"><%=item.getProductName()%></td>
        <td style="text-align: center; vertical-align: middle;"><%=item.getBrandName()%></td>
        <td style="text-align: center; vertical-align: middle;"><%=item.getProductSeries()%></td>
        <td style="text-align: center; vertical-align: middle;">NT$ <fmt:formatNumber value="<%=item.getProductPrice()%>"  pattern="###,###" /></td>
        <td style="text-align: center; vertical-align: middle;"><%=item.getQtyOrdered()%></td>
<%--         <td style="text-align: center; vertical-align: middle;">NT$ <fmt:formatNumber value="<%=item.getProductPrice() * item.getQtyOrdered()%>"  pattern="###,###" /></td> --%>
         </TR>
  			<% 
  				}  
 			%> 
        <TR height='16'>
          <TD style="text-align:right;font-size: 11pt;" colspan='5' >合計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;" >
          <fmt:formatNumber value="${totalPrice}" pattern="#,###,###" />元</TD>
                  
        </TR>
        <TR>
          <TD colspan='5' style="text-align:right;font-size: 11pt;" >貨運費：</TD>
          <TD style="text-align:right;font-size: 11pt;" > 50元</TD>
        </TR>
        <TR>
          <TD colspan='5' style="text-align:right;font-size: 11pt;" >總計金額：</TD>
          <TD style="text-align:right;font-size: 11pt;color:#AA0200;" >
          <fmt:formatNumber value="${Shipping}" pattern="#,###,###" />元</TD>
        </TR>
   </TABLE>
          </TD>
      </TR>
 
   </TABLE><P/>

</FORM>
<% 		
// 		session.removeAttribute("cart");
// 		session.removeAttribute("totalPrice");
// 		session.removeAttribute("totalQtyOrdered");
// 		session.removeAttribute("Shipping");
%>
			<br>
			<br>
			<br>

	<a onclick="goTop();"><div class="top">TOP</div></a>
</div>
<%@include file="../jspf/footer.jspf"%>
<script>

function goTop(){
	var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
	$body.animate({
		scrollTop: 0
	}, 200);
}


}
</script>
</body>
</html>