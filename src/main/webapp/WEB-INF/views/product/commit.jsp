<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%@include file="../jspf/header.jspf"%>

<%
MemberBean member = (MemberBean) session.getAttribute("member");
// session.removeAttribute("cart");
// session.removeAttribute("totalPrice");
// session.removeAttribute("totalQtyOrdered");
String path=request.getContextPath()+"/orderManagement";
response.setHeader("Refresh", "10;"+path);
%>

<CENTER>
${form}
 	<h3>親愛的會員 ${member.name} 您好：
 	 <br>感謝您的訂購<br> 期待您再度光臨 !! 
	</h3> <br> 

</CENTER>
<%@include file="../jspf/footer.jspf"%>
