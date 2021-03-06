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
function addCart(){
	if(confirm("加入購物車? ")){
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
				<div id="nameb" class="flip">廠商分類</div>
				<div id="brand" class="panel">
					<c:forEach var="brand" varStatus='vs' items="${brand}">
						<c:if test='${vs.first }'>
							<c:out value="<ul id='ul1'>" escapeXml='false' />
						</c:if>
						<li class="cateul_li">
						<button class="cateul_li_a" onclick="Brandproducts('${brand}',1)">${brand}</button>
						</li>
						<c:if test='${vs.last }'>
							<c:out value="</ul>" escapeXml='false' />
						</c:if>
					</c:forEach>
				</div>
				<div id="names" class="flip">系列分類</div>
				<div id="series" class="panel">
					<c:forEach var="series" varStatus='vs' items="${series}">
						<c:if test='${vs.first }'>
							<c:out value="<ul id='ul2'>" escapeXml='false' />
						</c:if>
						<li class="cateul_li"><a class="cateul_li_a"
							href='<c:url value="/Series" />?series=${series}'>${series}</a></li>
						<c:if test='${vs.last }'>
							<c:out value="</ul>" escapeXml='false' />
						</c:if>
					</c:forEach>
				</div>
				<div id="namec" class="flip">種類分類</div>
				<div id="cate" class="panel">
					<c:forEach var="cate" varStatus='vs' items="${cate}">
						<c:if test='${vs.first }'>
							<c:out value="<ul id='ul3'>" escapeXml='false' />
						</c:if>
						<li class="cateul_li"><a class="cateul_li_a"
							href='<c:url value="/Cate" />?cate=${cate}'>${cate}</a></li>
						<c:if test='${vs.last }'>
							<c:out value="</ul>" escapeXml='false' />
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="proarea" class="rightoutbox"></div>
		<div id="pagearea" class="page"></div>
	</div>
</div>
<script>
function Brandproducts(brand, i) {
	$.ajax({
		async : false,
		type : 'GET',
		url : "Brand",
		data : {
			"pageNo":i,
			"brand":brand
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div class='like'>"
						+  "<button class='like_button' onclick='collect(${member.id}, ${pro.productno})'>"
						+  "<i id='heart' class='fa fa-heart-o'></i></button></div>"
						+  "<a href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<a href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='cartimg' src='image/bg_cart_b.svg'></a>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='cartimg' src='image/bg_cart_b.svg'></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#proarea").html(content);
			
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Brandproducts("+'"'+data.OneBrand+'"'+","+i+")'>"+i+"</button></li>";
				
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	});
}
</script>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>