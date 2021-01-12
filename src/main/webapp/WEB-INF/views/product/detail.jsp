<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/inside.js"
	defer="defer"></script>
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/inside.css"
	TYPE="text/css">
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/ProductDetail.css"
	TYPE="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css" />

<title>${Detail.productname}</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentBox">
<!-- 		<div class="leftside"> -->
<!-- 			<div class="condition">條件篩選</div> -->
<!-- 			<div class="category"> -->
<!-- 				<div id="nameb" class="flip">廠商分類</div> -->
<!-- 				<div id="brand" class="panel"> -->
<%-- 					<c:forEach var="brand" varStatus='vs' items="${brand}"> --%>
<%-- 						<c:if test='${vs.first }'> --%>
<%-- 							<c:out value="<ul id='ul1'>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<!-- 						<li class="cateul_li"> -->
<!-- 							<button class="cateul_li_button" -->
<%-- 								onclick="Brandproducts('${brand}',1)">${brand}</button> --%>
<!-- 						</li> -->
<%-- 						<c:if test='${vs.last }'> --%>
<%-- 							<c:out value="</ul>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 				<div id="names" class="flip">系列分類</div> -->
<!-- 				<div id="series" class="panel"> -->
<%-- 					<c:forEach var="series" varStatus='vs' items="${series}"> --%>
<%-- 						<c:if test='${vs.first }'> --%>
<%-- 							<c:out value="<ul id='ul2'>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<!-- 						<li class="cateul_li"> -->
<!-- 							<button class="cateul_li_button" -->
<%-- 								onclick="Seriesproducts('${series}',1)">${series}</button> --%>
<!-- 						</li> -->
<%-- 						<c:if test='${vs.last }'> --%>
<%-- 							<c:out value="</ul>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 				<div id="namec" class="flip">種類分類</div> -->
<!-- 				<div id="cate" class="panel"> -->
<%-- 					<c:forEach var="cate" varStatus='vs' items="${cate}"> --%>
<%-- 						<c:if test='${vs.first }'> --%>
<%-- 							<c:out value="<ul id='ul3'>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<!-- 						<li class="cateul_li"> -->
<!-- 							<button class="cateul_li_button" -->
<%-- 								onclick="Cateproducts('${cate}',1)">${cate}</button> --%>
<!-- 						</li> -->
<%-- 						<c:if test='${vs.last }'> --%>
<%-- 							<c:out value="</ul>" escapeXml='false' /> --%>
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="rightoutbox">
			<div class="rightbox">
				<form name="AddForm"
					action="${pageContext.request.contextPath}/cartAdd" method="get">
					<input type="hidden" name="todo" value="add">
					<div class="rightside">
						<div class="imgbox">
							<a href="#"> <img class="proimg"
								src="${pageContext.request.contextPath}/pic/${Detail.imagepath}"></a>
						</div>
					</div>

					<div class="infobox">

						<div class="infoname">${Detail.productname}</div>
						<div class="infono">商品編號：${Detail.brandno}${Detail.productno}</div>
						<hr>
						<div class="infoseries">系列：${Detail.productseries}</div>
						<div class="infocate">種類：${Detail.productcategory}</div>
						<hr>
						<div class="infoprice">NT$：${Detail.productprice}</div>
						<div>
							<div class="infocount">
								數量 : <select name="count" class="countsel">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>

							</div>
							<br> <br> <br>
							<div>
								<input class="cartbtn"
									type=<%=session.getAttribute("member") != null ? "submit" : "hidden"%>
									value="加入購物車"> <input type="hidden" name="productno"
									value="${Detail.productno}">
								<div class="lineshare">
									<div class="line-it-button" data-lang="zh_Hant"
										data-type="share-a" data-ver="3"
										data-url="http://localhost:8080/AYCB_final/Detail?no=${Detail.productno}"
										data-color="default" data-size="large" data-count="true"
										style="display: none;"></div>
									<script
										src="https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js"
										async="async" defer="defer"></script>
									<div id="fb-root"></div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="maybelike">
				<div class="maybeliketext">你可能也喜歡</div>
				<c:forEach var="ra" items="${racate}">
					<div class="raside">
						<div class="imgbox">
							<a
								href='<c:url value="/Detail" />?no=${ra.productno}&cate=${ra.productcategory}'>
								<img class="raimg"
								src="${pageContext.request.contextPath}/pic/${ra.imagepath}">
							</a>
						</div>
						<div class="raname">${ra.productname}</div>
						<div class="rabuttonbox">
							<div class="raprice">NT$ ${ra.productprice}</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="content">


				<!--                         留言 -->
				<div>
					<c:if test='${not empty member}'>

						<div class="blog__details__comment">
							<h4>Leave A Comment</h4>
							<form id="commentform">

								<div class="col-lg-12 text-center">

									<textarea id="comment" placeholder="Comment"></textarea>
									<button id="postComment" type="button" class="site-btn"
										style="width: fit-content;">Post Comment</button>
								</div>
							</form>
						</div>
					</c:if>

					<c:if test='${ empty member}'>
						<a href="${pageContext.request.contextPath}/member/login">若欲留言請先登入</a>
					</c:if>
				</div>

				<!-- 					留言列 -->
				<div id="board"></div>
			</div>
		</div>
		<%@include file="../jspf/footer.jspf"%>

	</div>






	<!-- 留言功能初始化 -->
	<script>
		var object = "product";
		var pk = $
		{
			Detail.productno
		};
		var path = "${pageContext.request.contextPath}";
		var board = document.getElementById("board");
		var postUrl = path + "/leaveComment?memberid=${member.id}&key=" + pk
				+ "&type=" + object;
		var getUrl = path + "/loadComment?key=" + pk + "&type=" + object;
	</script>

	<script src="${pageContext.request.contextPath}/js/comment.js"
		defer="defer" charset="big5"></script>

	</body>
</html>