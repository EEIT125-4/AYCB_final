<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String user = "";
boolean editable = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	user = member.getName();
	System.out.println("顧客名稱: " + user);
	editable = true;
}
%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<%@include file="../jspf/header.jspf"%>


<c:choose>
	<c:when test="${empty itemList}">
	查無資料
	<br>
	</c:when>
	<c:when test="${not empty itemList }">

		<fieldset
			style="margin: auto; position: relative; top: 50px; width: 400px; border: 1px solid transparent;">
			<form action="<c:url value='/orderManagement' />" method="get">
				<h4>查詢訂單明細檔</h4>
				<br>
				<table style="margin: auto;" border="2">
<!-- 					<th>訂單編號</th> -->
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>商品單價</th>
					<th>商品數量</th>

					<c:forEach var="row" items="${itemList}">
						<!-- row一筆資料 -->
						<tr>
<%-- 							<td style="text-align: center;">${row.fkOrderNo}</td> --%>
							<td style="text-align: center;">${row.productNo}</td>
							<td style="text-align: center;">${row.productName}</td>
							<td style="text-align: center;">${row.productPrice}</td>
							<td style="text-align: center;">${row.quantity}</td>
						</tr>
					</c:forEach>
				</table>
				<br> 
				<div style="text-align: center;">
				<input  type="submit" value="回上頁">
				</div>
			</form>
		</fieldset>
	</c:when>
</c:choose>

<%@include file="../jspf/footer.jspf"%>