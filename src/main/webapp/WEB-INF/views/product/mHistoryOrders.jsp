<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<c:when test="${empty AllOrders}">
	查無資料<br>
</c:when>
<c:when test="${not empty AllOrders }">

<fieldset style="margin: auto; position: relative; top: 50px; width: 800px; border: 1px solid transparent;">
 <form action="<c:url value='/Manager' />" method="get">
	<h4 style="font-weight: bold; text-align: center">查詢歷史訂單</h4>
	<br>
  <table class="table table-hover" class="row">
  <thead>
  <tr>
    <th style="text-align:center;vertical-align:middle;" scope="col">訂單編號</th>
    <th style="text-align:center;vertical-align:middle;" scope="col">顧客姓名</th>
    <th style="text-align:center;vertical-align:middle;" scope="col">總價</th>
    <th style="text-align:center;vertical-align:middle;" scope="col">訂購時間</th> 
    <th style="text-align:center;vertical-align:middle;" scope="col">訂單狀態</th>
    <th style="text-align:center;vertical-align:middle;" scope="col">明細</th>
    <th style="text-align:center;vertical-align:middle;" scope="col">取消訂單</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${AllOrders}">
    <!-- row一筆資料 -->
    <tr>
    <td style="text-align:center;vertical-align:middle;" scope="row">${row.orderNo}</td>
    <td style="text-align:center;vertical-align:middle;">${row.customerId}</td>
    <td style="text-align:center;vertical-align:middle;">${row.totalAmount}</td>
    <td style="text-align:center;vertical-align:middle;">${row.orderDate}</td> 
    <td style="text-align:center;vertical-align:middle;"><select name="status">
            <option selected>${row.status}</option>
            <option >------------</option>
            <option >已出貨</option>
            <option >訂單完成</option>
           	</select></td>
    <td style="text-align:center;vertical-align:middle;"><a href="<c:url value="/managerSelectOrderItem?selectindex=${row.orderNo}"/>">商品清單</a></td>
    <td style="text-align:center;vertical-align:middle;"><a href="<c:url value="/managerOrderDelete?deleteindex=${row.orderNo}"/>">取消</a></td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
  <br>
				<div style="text-align: center;">
					<input class="btn btn-dark" type="submit" value="回後台">
				</div>
  </form> 
  </fieldset>
    </c:when>
</c:choose>  
  
<%@include file="../jspf/footer.jspf"%>