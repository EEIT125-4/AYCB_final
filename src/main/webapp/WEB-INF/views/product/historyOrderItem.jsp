<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
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
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">

<title>訂單查詢</title>
   
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
 <link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">  
	  
<style>
.img{
    width: 80px;
    height: 80px;
}

.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}


	
</style>



<%@include file="../jspf/header.jspf"%>

<div id="mytop">
<c:choose>
	<c:when test="${empty itemList}">
	查無資料
	<br>
	</c:when>
	<c:when test="${not empty itemList }">

	<form action="<c:url value='/orderManagement' />" method="get">
		<fieldset style="margin: auto; position: relative; width: 1200px; border: 1px solid transparent;">
				<h4 style="font-weight:bold;text-align:center">查詢訂單明細</h4>
				<br>
			<table id="myDataTable" class="table table-hover" class="row" >
        		<thead>
				<tr>
<!-- 				<th style="text-align:center;" scope="col">訂單編號</th> -->
					<th style="text-align:center;vertical-align:middle;" scope="col">商品編號</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">商品圖片</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">品牌</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">商品系列</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">商品名稱</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">商品單價</th>
					<th style="text-align:center;vertical-align:middle;" scope="col">商品數量</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${itemList}">
						<!-- row一筆資料 -->
						<tr>
<%-- 						<td style="text-align: center;">${row.fkOrderNo}</td> --%>
							<td style="text-align:center;vertical-align:middle;"  scope="row">${row.productNo}</td>
							<td style="text-align:center;vertical-align:middle;"><img class="img" src="${pageContext.request.contextPath}/pic/${row.productImg}"></td>
							<td style="text-align:center;vertical-align:middle;">${row.brandName}</td>
							<td style="text-align:center;vertical-align:middle;">${row.productSeries}</td>
							<td style="text-align:center;vertical-align:middle;">${row.productName}</td>
							<td style="text-align:center;vertical-align:middle;">NT$ <fmt:formatNumber value="${row.productPrice}"  pattern="###,###" /></td>
							<td style="text-align:center;vertical-align:middle;">${row.quantity}</td>
						</tr>
						
					</c:forEach>
					</tbody>
				</table>
				<br> 
				<div style="text-align: center;">
				<input class="btn btn-dark" type="submit" value="回上頁">
				</div>
				<br>				
		</fieldset>
	  </form>
	</c:when>
</c:choose>

<br>
<br>
<br>
</div>
	
<%@include file="../jspf/footer.jspf"%>

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>

<script type="text/javascript">



var table=document.getElementById("myDataTable");

        $(function () {

            $("#myDataTable").DataTable({
                searching: true, 
                columnDefs: [{
//                     targets: [10],
                    orderable: true,
                }]
            });
        });
        
</script>
</body>
</html>