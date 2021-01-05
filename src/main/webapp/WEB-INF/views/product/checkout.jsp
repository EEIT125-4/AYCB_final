<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, product.*, product.cartModel.CartItem"  %>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0  
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/cart.css" TYPE="text/css">

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
</head>
<%@include file="../jspf/header.jspf"%>
	
	<fieldset style="margin: auto; position: relative; width: 600px; border: 1px solid transparent;">
      <h4 style="font-weight: bold; text-align: center">購物清單</h4>
      <br>
      <table id="tab" class="table table-hover">
      <thead>
         <tr>
            <th style="text-align:center;vertical-align:middle;" scope="col">商品</th>
            <th style="text-align:center;vertical-align:middle;" scope="col">內容</th>
            <th style="text-align:center;vertical-align:middle;" scope="col">價格</th>
            <th style="text-align:center;vertical-align:middle;" scope="col">數量</th>
            
         </tr>
         </thead>
		 <tbody>		
         <%
         // Scriptlet 1: Display the items in shopping cart
         List<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
         for (CartItem item : cart) {
         %>
         
         <tr>
            <td style="text-align:center;vertical-align:middle;" scope="row"><img class="img" src="${pageContext.request.contextPath}/pic/<%=item.getProductImage()%>"></td>
            <td style="text-align:center;vertical-align:middle;"><%= item.getProductName()%></td>
            <td style="text-align:center;vertical-align:middle;">$<%= item.getProductPrice()%></td>
            <td style="text-align:center;vertical-align:middle;"><%= item.getQtyOrdered()%></td>
           
         </tr>
         <%
         } // for
         %>
         <tr>
            <th style="text-align:center;vertical-align:middle;font-size:20px;" colspan="2">總計</th>
            <th style="text-align:center;vertical-align:middle;font-size:18px;">$<%= session.getAttribute("totalPrice")%></th>
            <th style="text-align:center;vertical-align:middle;font-size:18px;"><%= session.getAttribute("totalQtyOrdered")%></th>
         </tr>
         </tbody>
      </table>
      <br>
 	  <div style="text-align: center;" >
      <form name="checkoutForm" action="<c:url value='/orderInsert' />" method="get">
         <input type="hidden" name="todo" value="commit"><!-- hidden隱藏欄位 -->
         <input class="btn btn-dark" type="submit" value="送出訂單">
         
      </form>
      </div>
      </fieldset>
<%@include file="../jspf/footer.jspf"%>