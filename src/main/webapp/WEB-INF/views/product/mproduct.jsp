<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/add.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/mproduct.css" TYPE="text/css">
<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/managerheader.jspf"%>
	<div class="contentoutbox">
		<div class="contentbox">
			<div class="title">產品管理</div>
			<div class="mp">
				<div class="mpbox">
					<button class="mpbtn"
						onclick='location.href="${pageContext.request.contextPath}/Mpadd"'>
						<div class="mpimgbox">
							<img class="mpimg" src="image/add.png">
						</div>
						<div class="mptext">新增</div>
					</button>
				</div>
			</div>
			<div class="mpcontent">
				<div>
					<c:forEach var="pro" items="${Products}">
						<div class="rightside">
							<div class="imgbox">
								<a href='<c:url value="/Mpupdate" />?no=${pro.productno}'><img
									class="proimg" src="image/${pro.productname}.png"></a>
							</div>
							<div class="proname">${pro.productname}</div>
							<div class="buttonbox">
								<div class="proprice">NT$ ${pro.productprice}</div>
								<div class="cart">
									<a class="cart_a "
										href='<c:url value="/Delete" />?no=${pro.productno}'> <i
										class="fa fa-trash fa-2x cartimg" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="page">
					<ul class="page_ul">
						<li class="page_ul_li"><a class="page_ul_li_a"
							href='<c:url value="/Mallp" />?page=${Pages - 1}'> <i
								class="fa fa-angle-double-left" aria-hidden="true"></i>
						</a></li>
						<c:forEach var='i' begin='1' end='${TotalPages}'>
							<li class="page_ul_li"><a class="page_ul_li_a"
								href='<c:url value="/Mallp" />?page=${i}'>${i}</a></li>
						</c:forEach>
						<li class="page_ul_li"><a class="page_ul_li_a"
							href='<c:url value="/Mallp" />?page=${Pages + 1}'><i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>