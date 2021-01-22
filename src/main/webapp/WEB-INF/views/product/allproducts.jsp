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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/inside.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">

<script>
	function addCart(i) {
		$.ajax({
			async : true,
			type : 'GET',
			url : 'addCart',
			data : {
				"productno":i,
				"count":1
			},
			dataType : "json",
			success : function(data) {
				Swal.fire({
					  icon: 'success',
					  title: '加入購物車',
					  showConfirmButton: false,
					  timer: 1500
					})								
			}
		});
	}
	
	$(document).ready(function() {
		Allproducts();
		Allstatus();
	});
</script>

<title>All You Can Buy</title>
</head>

<%@include file="../jspf/header.jspf"%>
<div class="wrapper">
	<div class="contentoutbox">
		<div class="contentbox">
			<div id="menu" class="leftside">
				<div class="condition">條件篩選</div>
				<div class="category">
					<div id="nameb" class="flip">廠商分類</div>
					<div id="brand" class="panel">
						<c:forEach var="brand" varStatus='vs' items="${brand}">
							<c:if test='${vs.first }'>
								<c:out value="<ul id='ul1'>" escapeXml='false' />
							</c:if>
							<li class="cateul_li">
								<button class="cateul_li_button"
									onclick="Brandproducts('${brand}', 1)">${brand}</button>
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
							<li class="cateul_li">
								<button class="cateul_li_button"
									onclick="Seriesproducts('${series}', 1)">${series}</button>
							</li>
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
							<li class="cateul_li">
								<button class="cateul_li_button"
									onclick="Cateproducts('${cate}', 1)">${cate}</button>
							</li>
							<c:if test='${vs.last }'>
								<c:out value="</ul>" escapeXml='false' />
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="modebox">
				顯示方式: 
				<input id="standard" class="modebtn" type="radio" name="mode" checked><img class="modeimg" src="image/standard.png">標準 
				<input id="list" class="modebtn" type="radio" name="mode"><img class="modeimg" src="image/list.png">序列
			</div>
			<div class="searchbox">
				<input id="keyword" class="searchinput" type="text">
				<button class="searchbtn" onclick="Keywordproducts(1)">
					<img src="${pageContext.request.contextPath}/image/icon/search.png"
						alt="">
				</button>
			</div>
			<div id="standardarea" class="standardarea"></div>
			<div id="listarea" class="listarea" style="display: none;"></div>
			<div id="pagearea" class="page"></div>
			<div class="toolbar">
				<ul class="toolbar_ul">
					<li class="toolbar_li"><a class="toolbar_a"
						href='<c:url value="/car" />'><i class="fa fa-shopping-cart"
							aria-hidden="true"></i><span class="msg">購物車</span></a></li>
					<li class="toolbar_li"><a class="toolbar_a"
						href="<c:url value='/History' />"><i class="fa fa-clock-o"
							aria-hidden="true"></i><span class="msg">瀏覽紀錄</span></a></li>
					<li class="toolbar_li"><a class="toolbar_a"
						href="<c:url value='/Collect' />"><i class="fa fa-heart"
							aria-hidden="true"></i><span class="msg">收藏清單</span></a></li>
					<li class="toolbar_li"><span id="top" class="top_a"><i
							class="fa fa-chevron-up" aria-hidden="true"></i><span class="msg">回TOP</span></span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
function Allproducts(i) {
	CK();
	Allstatus();
	$.ajax({
		async : false,
		type : 'GET',
		url : "AllProducts",
		data : {"pageNo":i},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p1"+data.Products[i].productno+"' class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div id='like"+data.Products[i].productno+"' class='like'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='likebtn"+data.Products[i].productno+"' class='like_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='heart"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='statusimgbox'><img id='statusimg"+data.Products[i].productno+"' class='statusimg'></div>"
						+  "<a id='detaila"+data.Products[i].productno+"'href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' onclick='addCart("+data.Products[i].productno+")' src='image/bg_cart_b.svg'>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' src='image/bg_cart_b.svg'>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#standardarea").html(content);
			
			var page = "<ul class='page_ul'>"
				for (let i = 1; i <= data.TotalPages; i++) {
					page += "<li class='page_ul_li'>"
						 +  "<button class='page_ul_li_button' type='submit' onclick='Allproducts("+i+")'>"+i+"</button></li>";
				}
				page += "</ul>";
				$("#pagearea").html(page);
				
		}
	});
	$.ajax({
		async : false,
		type : 'GET',
		url : "AllProducts",
		data : {"pageNo":i},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p2"+data.Products[i].productno+"' class='listbox'>"
					    +  "<div class='listimgbox'>"
						+  "<a id='listdetaila"+data.Products[i].productno+"' href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='listproimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div id='love"+data.Products[i].productno+"' class='listlike'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='lovebtn"+data.Products[i].productno+"' class='listlike_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='star"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='liststatusimgbox'><img id='liststatusimg"+data.Products[i].productno+"' class='liststatusimg'></div>"
						+  "<div class='listinfobox'><div class='listproname'>"+data.Products[i].productname+"</div>"
						+  "<div class='listproname'>系列 : "+data.Products[i].productseries+"</div>"
						+  "<div class='listproname'>種類 : "+data.Products[i].productcategory+"</div>"							
						+  "</div><div class='listbuttonbox'>"
						+  "<div class='listproprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='listcart'>"
						+  "<%if (login) {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%} else {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#listarea").html(content);
				
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Allproducts("+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);	
		}
	});
}

function Brandproducts(brand, i) {
	CK();
	Allstatus();
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
				content += "<div id='p1"+data.Products[i].productno+"' class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div id='like"+data.Products[i].productno+"' class='like'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='likebtn"+data.Products[i].productno+"' class='like_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='heart"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='statusimgbox'><img id='statusimg"+data.Products[i].productno+"' class='statusimg'></div>"
						+  "<a id='detaila"+data.Products[i].productno+"'href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' onclick='addCart("+data.Products[i].productno+")' src='image/bg_cart_b.svg'>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' src='image/bg_cart_b.svg'>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#standardarea").html(content);
			
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Brandproducts("+'"'+data.OneBrand+'"'+","+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	
	});
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
				content += "<div id='p2"+data.Products[i].productno+"' class='listbox'>"
					    +  "<div class='listimgbox'>"
						+  "<a href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='listproimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div id='love"+data.Products[i].productno+"' class='listlike'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='lovebtn"+data.Products[i].productno+"' class='listlike_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='star"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='liststatusimgbox'><img id='liststatusimg"+data.Products[i].productno+"' class='liststatusimg'></div>"
						+  "<div class='listinfobox'><div class='listproname'>"+data.Products[i].productname+"</div>"
						+  "<div class='listproname'>系列 : "+data.Products[i].productseries+"</div>"
						+  "<div class='listproname'>種類 : "+data.Products[i].productcategory+"</div>"							
						+  "</div><div class='listbuttonbox'>"
						+  "<div class='listproprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='listcart'>"
						+  "<%if (login) {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%} else {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#listarea").html(content);
				
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

function Seriesproducts(series, i) {
	CK();
	Allstatus();
	$.ajax({
		async : false,
		type : 'GET',
		url : "Series",
		data : {
			"pageNo":i,
			"series":series
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p1"+data.Products[i].productno+"' class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div id='like"+data.Products[i].productno+"' class='like'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='likebtn"+data.Products[i].productno+"' class='like_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='heart"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='statusimgbox'><img id='statusimg"+data.Products[i].productno+"' class='statusimg'></div>"
						+  "<a id='detaila"+data.Products[i].productno+"'href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' onclick='addCart("+data.Products[i].productno+")' src='image/bg_cart_b.svg'>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' src='image/bg_cart_b.svg'>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#standardarea").html(content);
			
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Seriesproducts("+'"'+data.OneSeries+'"'+","+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	
	});
	$.ajax({
		async : false,
		type : 'GET',
		url : "Series",
		data : {
			"pageNo":i,
			"series":series
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p2"+data.Products[i].productno+"' class='listbox'>"
					    +  "<div class='listimgbox'>"
						+  "<a href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='listproimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div id='love"+data.Products[i].productno+"' class='listlike'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='lovebtn"+data.Products[i].productno+"' class='listlike_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='star"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='liststatusimgbox'><img id='liststatusimg"+data.Products[i].productno+"' class='liststatusimg'></div>"
						+  "<div class='listinfobox'><div class='listproname'>"+data.Products[i].productname+"</div>"
						+  "<div class='listproname'>系列 : "+data.Products[i].productseries+"</div>"
						+  "<div class='listproname'>種類 : "+data.Products[i].productcategory+"</div>"							
						+  "</div><div class='listbuttonbox'>"
						+  "<div class='listproprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='listcart'>"
						+  "<%if (login) {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%} else {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#listarea").html(content);
				
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Seriesproducts("+'"'+data.OneSeries+'"'+","+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	});
}

function Cateproducts(cate, i) {
	CK();
	Allstatus();
	$.ajax({
		async : false,
		type : 'GET',
		url : "Cate",
		data : {
			"pageNo":i,
			"cate":cate
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p1"+data.Products[i].productno+"' class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div id='like"+data.Products[i].productno+"' class='like'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='likebtn"+data.Products[i].productno+"' class='like_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='heart"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='statusimgbox'><img id='statusimg"+data.Products[i].productno+"' class='statusimg'></div>"
						+  "<a id='detaila"+data.Products[i].productno+"'href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' onclick='addCart("+data.Products[i].productno+")' src='image/bg_cart_b.svg'>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' src='image/bg_cart_b.svg'>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#standardarea").html(content);

			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 + "<button class='page_ul_li_button' type='submit' onclick='Cateproducts("+'"'+data.OneCate+'"'+","+i+")'>" + i + "</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	});
	$.ajax({
		async : false,
		type : 'GET',
		url : "Cate",
		data : {
			"pageNo":i,
			"cate":cate
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p2"+data.Products[i].productno+"' class='listbox'>"
					    +  "<div class='listimgbox'>"
						+  "<a href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='listproimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div id='love"+data.Products[i].productno+"' class='listlike'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='lovebtn"+data.Products[i].productno+"' class='listlike_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='star"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='liststatusimgbox'><img id='liststatusimg"+data.Products[i].productno+"' class='liststatusimg'></div>"
						+  "<div class='listinfobox'><div class='listproname'>"+data.Products[i].productname+"</div>"
						+  "<div class='listproname'>系列 : "+data.Products[i].productseries+"</div>"
						+  "<div class='listproname'>種類 : "+data.Products[i].productcategory+"</div>"							
						+  "</div><div class='listbuttonbox'>"
						+  "<div class='listproprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='listcart'>"
						+  "<%if (login) {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%} else {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#listarea").html(content);
				
			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 +  "<button class='page_ul_li_button' type='submit' onclick='Cateproducts("+'"'+data.OneCate+'"'+","+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}	
	});
}

function Keywordproducts(i) {
	CK();
	Allstatus();
	var keyword = $("#keyword").val();
	$.ajax({
		async : false,
		type : 'GET',
		url : "Keyword",
		data : {
			"pageNo":i,
			"keyword":keyword
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p1"+data.Products[i].productno+"' class='rightside'>"
						+  "<div class='imgbox'>"
						+  "<div id='like"+data.Products[i].productno+"' class='like'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='likebtn"+data.Products[i].productno+"' class='like_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='heart"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='statusimgbox'><img id='statusimg"+data.Products[i].productno+"' class='statusimg'></div>"
						+  "<a id='detaila"+data.Products[i].productno+"'href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div class='proname'>"+data.Products[i].productname+"</div>"
						+  "<div class='buttonbox'>"
						+  "<div class='proprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='cart'>"
						+  "<%if (login) {%>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' onclick='addCart("+data.Products[i].productno+")' src='image/bg_cart_b.svg'>"
						+  "<%} else {%>"
						+  "<a href='${pageContext.request.contextPath}/member/login'>"
						+  "<img id='cartimg"+data.Products[i].productno+"' class='cartimg' src='image/bg_cart_b.svg'>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#standardarea").html(content);

			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
				page += "<li class='page_ul_li'>"
					 + "<button class='page_ul_li_button' type='submit' onclick='Keywordproducts("+i+")'>"+i+"</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	});
	$.ajax({
		async : false,
		type : 'GET',
		url : "Keyword",
		data : {
			"pageNo":i,
			"keyword":keyword
		},
		dataType : "json",
		success : function(data) {
			var content = "";
			for (let i = 0; i < data.Products.length; i++) {
				content += "<div id='p2"+data.Products[i].productno+"' class='listbox'>"
				    	+  "<div class='listimgbox'>"
						+  "<a href='<c:url value="/Detail" />?no="+data.Products[i].productno+"&cate="+data.Products[i].productcategory+"'>"
						+  "<img class='listproimg' src='${pageContext.request.contextPath}/pic/"+data.Products[i].imagepath+"'></a></div>"
						+  "<div id='love"+data.Products[i].productno+"' class='listlike'>"
						+  "<%if (session.getAttribute("member") != null) {%>"
						+  "<button id='lovebtn"+data.Products[i].productno+"' class='listlike_button' onclick='Collect("+${member.id}+","+data.Products[i].productno+")'>"
						+  "<i id='star"+data.Products[i].productno+"' class='fa fa-heart-o'></i></button>"
						+  "<%}%>"
						+  "</div>"
						+  "<div class='liststatusimgbox'><img id='liststatusimg"+data.Products[i].productno+"' class='liststatusimg'></div>"
						+  "<div class='listinfobox'><div class='listproname'>"+data.Products[i].productname+"</div>"
						+  "<div class='listproname'>系列 : "+data.Products[i].productseries+"</div>"
						+  "<div class='listproname'>種類 : "+data.Products[i].productcategory+"</div>"							
						+  "</div><div class='listbuttonbox'>"
						+  "<div class='listproprice'>NT$"+data.Products[i].productprice+"</div>"
						+  "<div class='listcart'>"
						+  "<%if (login) {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='<c:url value="/cartAdd" />?productno="+data.Products[i].productno+"&count=1' onclick='return addCart()'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%} else {%>"
						+  "<a id='listcart_a"+data.Products[i].productno+"' class='listcart_a' href='${pageContext.request.contextPath}/member/login'>"
						+  "<img class='listcartimg' src='image/bg_cart_b.svg'><div class='listcarttext'>加入購物車</div></a>"
						+  "<%}%>"
						+  "</div></div></div>";
			}
			$("#listarea").html(content);

			var page = "<ul class='page_ul'>"
			for (let i = 1; i <= data.TotalPages; i++) {
			page += "<li class='page_ul_li'>"
			 	 + "<button class='page_ul_li_button' type='submit' onclick='Keywordproducts("
			 	 + i + ")'>" + i + "</button></li>";
			}
			page += "</ul>";
			$("#pagearea").html(page);
		}
	});
}

function Collect(mid, pid) {
	$.ajax({
		type : 'GET',
		url : 'Collect',
		data : {
			"mid" : mid,
			"pid" : pid
		},
		dataType : "json",
		success : function(data) {
			if (data) {
				swal.fire("收藏成功", "", "success");
				$('#heart' + pid).attr('class', 'fa fa-heart');
				$('#like' + pid).css('display', 'block');
				$('#likebtn' + pid).css('border', 'none');
				$('#star' + pid).attr('class', 'fa fa-heart');
				$('#love' + pid).css('display', 'block');
				$('#lovebtn' + pid).css('border', 'none');
			} else {
				swal.fire("取消收藏", "", "error");
				$('#heart' + pid).attr('class', 'fa fa-heart-o');
				$('#like' + pid).css('display', 'none');
				$('#like' + pid).removeAttr("style");
				$('#likebtn' + pid).css('border', '2px solid gray');
				$('#star' + pid).attr('class', 'fa fa-heart-o');
				$('#love' + pid).css('display', 'none');
				$('#love' + pid).removeAttr("style");
				$('#lovebtn' + pid).css('border', '2px solid gray');
			}
		}
	});
}

function CK() {
	$.ajax({
		type : 'GET',
		url : 'Collectcheck',
		dataType : "json",
		success : function(data) {
			for (let i = 0; i < data.No.length; i++) {
				$('#heart' + data.No[i]).attr('class', 'fa fa-heart');
				$('#like' + data.No[i]).css('display', 'block');
				$('#likebtn' + data.No[i]).css('border', 'none');
				$('#star' + data.No[i]).attr('class', 'fa fa-heart');
				$('#love' + data.No[i]).css('display', 'block');
				$('#lovebtn' + data.No[i]).css('border', 'none');
			}
		}
	});
};

$(function() {
	$("#standard").click(function() {
		$('#standardarea').show();
		$('#listarea').hide();
	});
});

$(function() {
	$("#list").click(function() {
		$('#standardarea').hide();
		$('#listarea').show();
	});
});

$(function() {
	$("#menu").scroll(function() {
		$("#menu").animate({
			scrollTop : 0
		}, 1000);
	});
});

$(function() {
	$("#top").click(function() {
		$("html,body").animate({
			scrollTop : 0
		}, 1000);
	});
});

function Allstatus() {
	$.ajax({
		type : 'GET',
		url : 'AllStatus',
		dataType : "json",
		success : function(data) {
			for (let i = 0; i < data.Products.length; i++) {
				if(data.Products[i].status == 0) {
					$('#p1' + data.Products[i].productno).css('display', 'none');
					$('#p2' + data.Products[i].productno).css('display', 'none');
				} else {
					$('#p1' + data.Products[i].productno).css('display', 'block');
					$('#p2' + data.Products[i].productno).css('display', 'block');
				}
				
				if(data.Products[i].productstatus == 1) {
					$('#statusimg' + data.Products[i].productno).attr('src', 'image/new.gif');
					$('#statusimg' + data.Products[i].productno).css('display', 'block');
					$('#liststatusimg' + data.Products[i].productno).attr('src', 'image/new.gif');
					$('#liststatusimg' + data.Products[i].productno).css('display', 'block');
				} 
				
				if(data.Products[i].productstatus == 2) {
					$('#statusimg' + data.Products[i].productno).attr('src', 'image/soldout.gif');
					$('#statusimg' + data.Products[i].productno).css('display', 'block');
					$('#detaila' + data.Products[i].productno).removeAttr('href');
					$('#cartimg' + data.Products[i].productno).css('cursor', 'not-allowed');
					$('#cartimg' + data.Products[i].productno).removeAttr('onclick');
					
					$('#liststatusimg' + data.Products[i].productno).attr('src', 'image/soldout.gif');
					$('#liststatusimg' + data.Products[i].productno).css('display', 'block');
					$('#listdetaila' + data.Products[i].productno).removeAttr('href');
					$('#listcart_a' + data.Products[i].productno).css('cursor', 'not-allowed');
					$('#listcart_a' + data.Products[i].productno).removeAttr('href');
				}
				
				if(data.Products[i].productstatus == 3) {
					$('#statusimg' + data.Products[i].productno).attr('src', 'image/sellhot.gif');
					$('#statusimg' + data.Products[i].productno).css('display', 'block');
					$('#liststatusimg' + data.Products[i].productno).attr('src', 'image/sellhot.gif');
					$('#liststatusimg' + data.Products[i].productno).css('display', 'block');
				}
			}
		}
	});
}

</script>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>