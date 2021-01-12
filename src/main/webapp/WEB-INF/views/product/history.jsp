<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>All You Can Buy</title>
</head>

<%@include file="../jspf/header.jspf"%>
<form action="<c:url value='/member/update' />">
	<div class="historybox">
		<table class="historytb">
			<caption class="ct">最近看過的商品</caption>
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
					<tr>
						<td class="historytd"><img class="historyimg"
							src="${pageContext.request.contextPath}/pic/${history.imagepath}">
						</td>
						<td class="historytd">${history.productcategory}</td>
						<td class="historytd">${history.productname}</td>
						<td class="historytd">${history.productprice}</td>
						<td class="historytd"><a
							href='<c:url value="/cartAdd" />?productno=${history.productno}&count=1'
							onclick="return addCart()"> <img class='historycartimg'
								src='image/bg_cart_b.svg'></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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