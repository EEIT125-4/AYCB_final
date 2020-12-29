<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%  
  String user="";
  boolean editable=false;
  if(session.getAttribute("member")!=null){
  	MemberBean member=(MemberBean)session.getAttribute("member");
  	 user=member.getName();
  	System.out.println("顧客名稱: "+user);
  	editable=true;}
	
%> 

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0  
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>   
<%@include file="../jspf/header.jspf"%> 




<c:choose>
<c:when test="${empty orderList}">
	查無資料<br>
</c:when>
<c:when test="${not empty orderList }">

<fieldset style="margin: auto; position: relative; top: 50px; width: 600px; border: 1px solid transparent;">
 <form action="" method="get">
	<h4>查詢交易歷史清單</h4>
	<br>
  <table style="margin: auto;" border="2" >
    <th style="text-align:center;">訂單編號</th>
    <th style="text-align:center;">顧客姓名</th>
    <th style="text-align:center;">總價</th>
    <th style="text-align:center;">訂購時間</th> 
    <th style="text-align:center;">付款狀態</th>
    <th style="text-align:center;">明細</th>
<!--     <th style="text-align:center;">刪除</th> -->
    <c:forEach var="row" items="${orderList}">
    <!-- row一筆資料 -->
    <tr>
    <td style="text-align:center;">${row.orderNo}</td>
    <td style="text-align:center;">${row.customerId}</td>
    <td style="text-align:center;">${row.totalAmount}</td>
    <td style="text-align:center;">${row.orderDate}</td> 
    <td style="text-align:center;">${row.status}</td>
    <td style="text-align:center;"><a href="<c:url value="/selectOrderItem?selectindex=${row.orderNo}"/>">商品清單</a></td>
<%--     <td style="text-align:center;"><a href="<c:url value="/orderDelete?deleteindex=${row.orderNo}"/>">刪除</a></td> --%>
    </tr>
    </c:forEach>
  </table>
  </form> 
  </fieldset>
    </c:when>
</c:choose>  
  
<%@include file="../jspf/footer.jspf"%>