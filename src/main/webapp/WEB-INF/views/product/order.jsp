<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.cartModel.CartItem,member.*"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>購物車</title>
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
</style>
</head>
<%@include file="../jspf/header.jspf"%>


<!-- <div style="position: relative; left: 30px; width: 150px;"> -->
 	<% 
 		MemberBean member = (MemberBean) session.getAttribute("member");
 	%>  

<!--   	<span style="border-bottom: 2px solid gray; width: 150px;">  -->
<%-- 	<strong><h5><%=member.getName() +  "   "%>您好!</h5></strong></span><br> <A style="color: black;" href="<c:url value='orderManagement' />"><h5>查詢歷史清單</h5></A>  --%>
<!--  </div>  -->
<div>
	<ol class="progress_bar">
		<li class="active">購物車</li>
		<li>結帳</li>
		<li>結帳明細</li>
	</ol>
</div>
<br><br>
<div class='shopingcart'>
	<fieldset
		style="float: auto; margin: auto; position: relative; width: 1200px; border: 1px solid transparent;">

		<h4 style="font-weight: bold; text-align: center">您購物車中的商品</h4>
		<br>

		<%
			// Check whether the shopping cart is empty.
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart != null && cart.size() > 0) {
			System.out.printf("the cartItem", cart.size());
		%>


		<table id="tab" class="table table-hover" class="row">
			<thead>
				<tr>
					<th style="text-align: center; vertical-align: middle;" scope="col">商品</th>
					<th style="text-align: center; vertical-align: middle;" scope="col">內容</th>
					<th style="text-align: center; vertical-align: middle;" scope="col">價格</th>
					<th style="text-align: center; vertical-align: middle;" scope="col">數量</th>
					<th style="text-align: center; vertical-align: middle;" scope="col">&nbsp;</th>
					<!-- 空行 -->
				</tr>
			</thead>
			<tbody>
				<%
					// display the shopping cart.
				for (int i = 0; i < cart.size(); i++) {
					CartItem aCartItem = cart.get(i); //list的寫法
				%>
				<tr>

					<%-- 					<form name="removeForm" action="${pageContext.request.contextPath}/cartRemove" method="get"> --%>
					<!-- 						<input type="hidden" name="todo" value="remove"> -->
					<!-- 移除商品 -->
					<%-- 						<input type="hidden" name="cartIndex" value="<%=i%>"> --%>
					<td style="text-align: center; vertical-align: middle;" scope="row"><img
						class="img"
						src="${pageContext.request.contextPath}/pic/<%=aCartItem.getProductImage()%>"></td>
					<td style="text-align: center; vertical-align: middle;"><%=aCartItem.getProductName()%></td>
					<td style="text-align: center; vertical-align: middle;">NT$<%=aCartItem.getProductPrice()%></td>
<%-- 					<td style="text-align: center; vertical-align: middle;"><%=aCartItem.getQtyOrdered()%></td> --%>
					
					<td style="text-align: center; vertical-align: middle;">	
								<input type="number" 
								onchange="checkQuantity(this)" name="quantity" 
								min="1" max="10"
								value="<%=aCartItem.getQtyOrdered()%>" style="width: 3em">
					</td>
					
					<td style="text-align: center; vertical-align: middle;">
						<!-- 						<input style="margin-bottom: 6px;" type="button" value="追蹤"> -->
						<%-- 						<img class="" src="${pageContext.request.contextPath}/image/icon/heart.png"> --%>
						<!-- 						<br> --> <!-- 						<input type="submit" value="刪除"> -->
						<a href="${pageContext.request.contextPath}/cartRemove/<%=i%>"><img
							class=""
							src="${pageContext.request.contextPath}/image/icon/trash.png"></a>
					</td>
					<!-- 					</form> -->
				</tr>
				<%
					} // for loop
				%>
				
			</tbody>
		</table>

		<br>

		<div style="text-align: center;">
			<form id="butt" name="shoppingForm"
				action="${pageContext.request.contextPath}/shopping" method="get">
				<button id="butt" class="btn btn-dark" type="submit" name="todo"
					value="shop">繼續購物</button>
				<button id="butt" class="btn btn-dark" type="submit" name="todo"
					value="checkout">結帳</button>
			</form>
		</div>
		<br>
	</fieldset>
</div>
<div style="width: 1000px; height: 2000px;text-align: center;">
	<%
		} else {
	%>

	<h4 style="text-align: center">目前無商品加入</h4>

	<%
		System.out.println(request.getContextPath());
	String path = request.getContextPath() + "/AllProducts";
	response.setHeader("Refresh", "5;" + path);

	}
	%>
</div>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>