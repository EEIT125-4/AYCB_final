<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>]
<%@ page import="product.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0  
    response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<%@include file="../jspf/header.jspf"%>

 <%  
  String user="";
  boolean editable=false;
  if(session.getAttribute("member")!=null){
  	MemberBean member=(MemberBean)session.getAttribute("member");
  	 user=member.getName();
  	System.out.println("顧客名稱: "+user);
  	editable=true;}
	
%> 

<c:choose>
<c:when test="${empty pickOrder}">
	查無資料<br>
</c:when>
<c:when test="${not empty pickOrder }">

<fieldset style="margin: auto;position: relative;top: 200px;width: 300px;border-radius: 15px;font-weight: 300;font-size: large">
	<legend style="font-weight: 600;font-size: x-large;text-align: center;">訂單修改</legend>
	<form  action="<c:url value="/orderUpdate"/>" method="get">
        <div>  
            <label class="t1" for="">訂單編號:</label>
            <input type="text" name="orderNo" value="${pickOrder.orderNo}"  readonly>   
        </div>
        <div>   
            <label for="" class="t1">顧客姓名:</label>
            <input type="text" name="customerId" value="${pickOrder.customerId}"  readonly>     
        </div>
<!--         <div> -->
<!--             <label for="" class="t1">訂購時間:</label> -->
<%--             <input type="text" name="orderTime" value="${pickOrder.orderTime}" style="background-color: gray;" readonly> --%>
<!--         </div> -->
        <div>
            <label for="" class="t1">總價:</label>
            <input type="text" name="price" value="${pickOrder.price}">
        </div>
        <div>
            <label for="" class="t1">總數量:</label>
            <input type="text" name="quantity" value="${pickOrder.quantity}" autofocus>
        </div>
        <div>
            <label class="t1">付款狀態:</label><select name="status">
            <option selected>${pickOrder.status}</option>
            <option >------------</option>
            <option >付款成功</option>
            <option >付款失敗</option>
           	</select>
        </div>
        <hr>
        <div style="text-align: center;" >
        <input type="submit"  value="送出">
        </div>
    </form>
    
	</fieldset>
    </c:when>
</c:choose>  	
	
<%@include file="../jspf/footer.jspf"%>