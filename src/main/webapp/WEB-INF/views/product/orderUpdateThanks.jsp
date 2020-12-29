<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0  
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<%@include file="../jspf/header.jspf"%>
	<script>
        window.alert("確定修改?");
    </script>
	<% 
	//session.invalidate();
	session.removeAttribute("cart");
	session.removeAttribute("totalQtyOrdered");
	session.removeAttribute("totalPrice");
	response.setHeader("Refresh","2;orderManagement");		
	%>
<%@include file="../jspf/footer.jspf"%>