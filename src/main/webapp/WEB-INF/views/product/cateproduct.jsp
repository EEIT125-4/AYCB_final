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
<script src="js/inside.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">

<script>
	function addCart() {
		if (confirm("加入購物車? ")) {
			return true;
		} else {
			return false;
		}
	}
</script>

<title>All You Can Buy</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentbox">
		<div class="leftside">
			<div class="condition">條件篩選</div>
			<div class="category">
				<div class="catediv">
					廠商分類<a id="a1" class="catea" href="#" onclick="show1()">+</a>
				</div>
				<c:forEach var="brand" varStatus='vs' items="${brand}">
					<c:if test='${vs.first }'>
						<c:out value="<ul id='ul1' class='cateul'>" escapeXml='false' />
					</c:if>
					<li class="cateul_li"><a class="cateul_li_a"
						href='<c:url value="/Brand" />?brand=${brand}'>${brand}</a></li>
					<c:if test='${vs.last }'>
						<c:out value="</ul>" escapeXml='false' />
					</c:if>
				</c:forEach>
				<div class="catediv">
					系列分類<a id="a2" class="catea" href="#" onclick="show2()">+</a>
				</div>
				<c:forEach var="series" varStatus='vs' items="${series}">
					<c:if test='${vs.first }'>
						<c:out value="<ul id='ul2' class='cateul'>" escapeXml='false' />
					</c:if>
					<li class="cateul_li"><a class="cateul_li_a"
						href='<c:url value="/Series" />?series=${series}'>${series}</a></li>
					<c:if test='${vs.last }'>
						<c:out value="</ul>" escapeXml='false' />
					</c:if>
				</c:forEach>
				<div class="catediv">
					種類分類<a id="a3" class="catea" href="#" onclick="show3()">+</a>
				</div>
				<c:forEach var="cate" varStatus='vs' items="${cate}">
					<c:if test='${vs.first }'>
						<c:out value="<ul id='ul3' class='cateul'>" escapeXml='false' />
					</c:if>
					<li class="cateul_li"><a class="cateul_li_a"
						href='<c:url value="/Cate" />?cate=${cate}'>${cate}</a></li>
					<c:if test='${vs.last }'>
						<c:out value="</ul>" escapeXml='false' />
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="rightoutbox">
			<c:forEach var="pro" items="${Products}">
				<div class="rightside">
					<div class="imgbox">
						<!-- 						<div class="like"><a class="like_a" href=""><i class="fa fa-heart nopadding"></i></a></div> -->
						<a href='<c:url value="/Detail" />?no=${pro.productno}&cate=${pro.productcategory}'>
						<img class="proimg" src="${pageContext.request.contextPath}/pic/${pro.imagepath}">
						</a>
					</div>
					<div class="proname">${pro.productname}</div>
					<div class="buttonbox">
						<div class="proprice">NT$ ${pro.productprice}</div>
						<div class="cart">
							<%
								if (login) {
							%>
							<a
								href="<c:url value='/cartAdd?productno=${pro.productno}&count=1' />"
								onclick="return addCart()"> <img class="cartimg"
								src="image/bg_cart_b.svg">
							</a>
							<%
								} else {
							%>
							<a href="${pageContext.request.contextPath}/member/login">
							<img class="cartimg" src="image/bg_cart_b.svg">
							</a>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="page">
				<ul class="page_ul">
					<%-- 					<c:forEach var="cate" varStatus='vs' items="${OneCate}"> --%>
					<%-- 						<c:if test='${vs.first }'> --%>
					<!-- 							<li class="page_ul_li"><a class="page_ul_li_a" -->
					<%-- 								href='<c:url value="/Cate" />?cate=${cate}&pageNo=${Pages - 1}'><i --%>
					<!-- 									class="fa fa-angle-double-left" aria-hidden="true"></i></a></li> -->
					<%-- 						</c:if> --%>
					<%-- 					</c:forEach> --%>
					<c:forEach var='i' begin='1' end='${TotalPages}'>
						<c:forEach var="cate" varStatus='vs' items="${OneCate}">
							<c:if test='${vs.first }'>
								<li class="page_ul_li"><a class="page_ul_li_a"
									href='<c:url value="/Cate" />?cate=${cate}&pageNo=${i}'>${i}</a></li>
							</c:if>
						</c:forEach>
					</c:forEach>
					<%-- 					<c:forEach var="cate" varStatus='vs' items="${OneCate}"> --%>
					<%-- 						<c:if test='${vs.first }'> --%>
					<!-- 							<li class="page_ul_li"><a class="page_ul_li_a" -->
					<%-- 								href='<c:url value="/Cate" />?cate=${cate}&pageNo=${Pages + 1}'><i --%>
					<!-- 									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li> -->
					<%-- 						</c:if> --%>
					<%-- 					</c:forEach> --%>
				</ul>
			</div>
		</div>

	</div>
</div>

<%@include file="../jspf/footer.jspf"%>
</body>
</html>