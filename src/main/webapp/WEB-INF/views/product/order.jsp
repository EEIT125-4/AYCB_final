

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
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/cart.css" TYPE="text/css">
<title>購物車</title>
</head>
<%@include file="../jspf/header.jspf"%>
<div style="text-align: center">
<!-- <div style="position: relative; left: 30px; width: 150px;"> -->
 	<% 
 		MemberBean member = (MemberBean) session.getAttribute("member");
 	%> 

  	<span style="border-bottom: 2px solid gray; width: 150px;"> 
	<strong><h5><%=member.getName() +  "   "%>您好!</h5></strong></span><br> 
	<A style="color: black;" href="<c:url value='orderManagement' />"><h5>查詢歷史清單</h5></A> 
 </div> 

<div class='shopingcart'>
<fieldset style="float: auto; margin: auto; position: relative; width: 500px; border: 1px solid transparent;">
	
	<h4><strong>您購物車中的商品</strong></h4>
	<br>

			<%
				// Check whether the shopping cart is empty.
			List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
			if (theCart != null && theCart.size() > 0) {
				System.out.printf("the cartItem", theCart.size());
			%>


			<table id="tab" border="2" cellspacing="0" cellpadding="5">
				<tr>
					<th>商品</th>
					<th>內容</th>
					<th>價格</th>
					<th>數量</th>
					<th>&nbsp;</th>
					<!-- 空行 -->
				</tr>
				<%
					// display the shopping cart.
				for (int i = 0; i < theCart.size(); i++) {
					CartItem aCartItem = theCart.get(i); //list的寫法
				%>
				<tr>
					<!-- 每一筆都是獨立的FORM -->
					<form name="removeForm" action="${pageContext.request.contextPath}/cartRemove" method="get">
						<input type="hidden" name="todo" value="remove">
						<!-- 移除商品 -->
						<input type="hidden" name="cartIndex" value="<%=i%>">
						<td align="right"><img class="img" src="${pageContext.request.contextPath}/pic/1"></td>
						<td align="left"><%=aCartItem.getProductName()%></td>
						<td align="right" valign="middle">$<%=aCartItem.getProductPrice() %></td>
						<td align="right"><%=aCartItem.getQtyOrdered()%></td>
						<td><input style="margin-bottom: 6px;" type="button" value="追蹤"><br>
						<input type="submit" value="刪除"></td>
					</form>
				</tr>
				<%
					} // for loop
				%>
			</table>
			
			<br>
		
			<div style="text-align: center;">
				<form id="butt" name="shoppingForm" action="${pageContext.request.contextPath}/shopping"
					method="get">
					<button id="butt" type="submit" name="todo" value="shop">繼續購物</button>
					<button id="butt" type="submit" name="todo" value="checkout">結帳</button>
				</form>
			</div>
			<br>
		</fieldset>
		</div>
			<div>
			<%
				} else {
			%>
			<h4>目前無商品加入</h4>

				<%		
				System.out.println(request.getContextPath());
				String path=request.getContextPath()+"/AllProducts";
						response.setHeader("Refresh", "2;"+path);
					
					}
				%>
			</div>

<%@include file="../jspf/footer.jspf"%>
</body>
</html>