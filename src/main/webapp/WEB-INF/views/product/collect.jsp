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

<script>
	$(document).ready(function() {
		Allstatus();
	});
</script>

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
						<tr id="col${col.productno}">
							<td class="liketd">
								<div class='statusimgbox'>
									<img id='statusimg${col.productno}' class='statusimg'>
								</div> <a id="detaila${col.productno}"
								href='<c:url value="/Detail" />?no=${col.productno}&cate=${col.productcategory}'>
									<img class="likeimg"
									src="${pageContext.request.contextPath}/pic/${col.imagepath}">
							</a>
							</td>
							<td class="liketd">${col.productcategory}</td>
							<td class="liketd">${col.productname}</td>
							<td class="liketd">${col.productprice}</td>
							<td class="liketd"><a id="likecartimg${col.productno}"
								href='<c:url value="/cartAdd" />?productno=${col.productno}&count=1'>
									<img class='likecartimg' src='image/bg_cart_b.svg'>
							</a></td>
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
	function Allstatus() {
		$.ajax({
			type : 'GET',
			url : 'AllStatus',
			dataType : "json",
			success : function(data) {
				for (let i = 0; i < data.Products.length; i++) {
					if (data.Products[i].status == 0) {
						$('#col' + data.Products[i].productno).css('display',
								'none');
					}

					if (data.Products[i].productstatus == 1) {
						$('#statusimg' + data.Products[i].productno).attr(
								'src', 'image/new.gif');
						$('#statusimg' + data.Products[i].productno).css(
								'display', 'block');
					}

					if (data.Products[i].stock == 0) {
						$('#statusimg' + data.Products[i].productno).attr(
								'src', 'image/soldout.gif');
						$('#statusimg' + data.Products[i].productno).css(
								'display', 'block');
						$('#detaila' + data.Products[i].productno).removeAttr(
								'href');
						$('#likecartimg' + data.Products[i].productno).css(
								'cursor', 'not-allowed');
						$('#likecartimg' + data.Products[i].productno)
								.removeAttr('href');
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