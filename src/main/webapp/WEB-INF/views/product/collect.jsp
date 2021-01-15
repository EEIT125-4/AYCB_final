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
<link REL=STYLESHEET HREF="css/collect.css" TYPE="text/css">

<title>All You Can Buy</title>
</head>

<%@include file="../jspf/header.jspf"%>
<form action="<c:url value='/member/update' />">
	<div class="likebox">
		<table class="liketb">
			<caption class="ct">收藏清單</caption>
			<c:if test='${not empty collection}'>
			<thead>
				<tr>
					<th class="liketh">圖片</th>
					<th class="liketh">商品種類</th>
					<th class="liketh">品名</th>
					<th class="liketh">價格</th>
					<th class="liketh">購買</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="col" items="${collection}">
					<tr>
						<td class="liketd"><img class="likeimg"
							src="${pageContext.request.contextPath}/pic/${col.imagepath}">
						</td>
						<td class="liketd">${col.productcategory}</td>
						<td class="liketd">${col.productname}</td>
						<td class="liketd">${col.productprice}</td>
						<td class="liketd"><a
							href='<c:url value="/cartAdd" />?productno=${col.productno}&count=1'
							onclick="return addCart()"> <img class='likecartimg'
								src='image/bg_cart_b.svg'></a></td>
					</tr>
				</c:forEach>
			</tbody>
			</c:if>
			</table>
			<c:if test='${ empty collection}'>
			<div class="nolist">
				<b>目前無收藏紀錄</b>
			</div>
			</c:if>
	</div>
	<div class="backbtn">
		<input class="btn btn-dark" type="submit" value="回會員中心">
	</div>
</form>
<script>
	function addCart() {
		if (confirm("加入購物車? ")) {
			return true;
		} else {
			return false;
		}
	}
</script>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>