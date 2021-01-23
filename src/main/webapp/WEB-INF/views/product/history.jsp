<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,product.*,product.model.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<%
	boolean login = false;
	if (session.getAttribute("member") != null) {
		MemberBean member = (MemberBean) session.getAttribute("member");
		login = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link REL=STYLESHEET HREF="css/history.css" TYPE="text/css">

<script>
	$(document).ready(function() {
		Allstatus();
	});
</script>

<title>All You Can Buy</title>
</head>

<%@include file="../jspf/header.jspf"%>
<form action="<c:url value='/member/update' />">
	<div class="historybox">
		<table class="historytb">
			<div class="ct">最近看過的商品</div>
			<div class="count">${recordlist.size()}/10 (最多紀錄10筆)</div>
			<c:if test='${not empty recordlist}'>
			<thead>
				<tr>
					<th class="historyth">圖片</th>
					<th class="historyth">商品種類</th>
					<th class="historyth">品名</th>
					<th class="historyth">價格</th>
					<th class="historyth">購買</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="history" items="${recordlist}">
					<tr id="record${history.productno}">
						<td class="historytd">
							<div class='statusimgbox'><img id='statusimg${history.productno}' class='statusimg'></div>
							<a id="detaila${history.productno}" href='<c:url value="/Detail" />?no=${history.productno}&cate=${history.productcategory}'>
							<img class="historyimg" src="${pageContext.request.contextPath}/pic/${history.imagepath}"></a>
						</td>
						<td class="historytd">${history.productcategory}</td>
						<td class="historytd">${history.productname}</td>
						<td class="historytd">${history.productprice}</td>
						<td class="historytd">
							<a id="historycartimg${history.productno}" href='<c:url value="/cartAdd" />?productno=${history.productno}&count=1'> 
							<img class='historycartimg' src='image/bg_cart_b.svg'></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</c:if>
			</table>
			<c:if test='${ empty recordlist}'>
			<div class="nolist">
				<b>目前無瀏覽紀錄</b>
			</div>
			</c:if>
	</div>
	<div class="backbtn">
		<input class="btn btn-dark" type="submit" value="回會員中心">
	</div>
</form>
<script>
	function Allstatus() {
		$.ajax({
			type : 'GET',
			url : 'AllStatus',
			dataType : "json",
			success : function(data) {
				for (let i = 0; i < data.Products.length; i++) {
					if(data.Products[i].status == 0) {
						$('#record' + data.Products[i].productno).css('display', 'none');
					}
	
					if(data.Products[i].productstatus == 1) {
						$('#statusimg' + data.Products[i].productno).attr('src', 'image/new.gif');
						$('#statusimg' + data.Products[i].productno).css('display', 'block');
					} 
					
					if(data.Products[i].stock == 0) {
						$('#statusimg' + data.Products[i].productno).attr('src', 'image/soldout.gif');
						$('#statusimg' + data.Products[i].productno).css('display', 'block');
						$('#detaila' + data.Products[i].productno).removeAttr('href');
						$('#historycartimg' + data.Products[i].productno).css('cursor', 'not-allowed');
						$('#historycartimg' + data.Products[i].productno).removeAttr('href');
					}
					
	 				if(data.Products[i].productstatus == 3) {
						$('#statusimg' + data.Products[i].productno).attr('src', 'image/sellhot.gif');
						$('#statusimg' + data.Products[i].productno).css('display', 'block');
					}
				}
			}
		});
	}
</script>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>