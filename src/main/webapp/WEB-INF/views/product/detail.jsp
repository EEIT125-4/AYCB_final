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
			<!-- 		</div> -->
			<!-- 		<div> -->
			<div class="content">
				<hr>
				<div id="post">

					<form:form method="POST" modelAttribute="leave" id="ajaxform"
						name="ajaxform" enctype='multipart/form-data'>
						<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>
						<Fieldset class="discussionbox">
							<div>
								<label>留言類型:</label>
								<form:input path="type" value="product" disabled="true" />
							</div>
							<div>
								<label>會員名稱：</label> <span>${member.name}</span> <input
									type="hidden" id="shangtian" name="mid" value="${member.id}" />
							</div>

			<!--                         留言 -->
			<div>
				<c:if test='${not empty member}'>

					<div class="blog__details__comment">
						<h4>Leave A Comment</h4>
						<form id="commentform">

							<div class="col-lg-12 text-center">

								<textarea id="comment" placeholder="Comment"></textarea>
								<button id="postComment" type="button" class="site-btn"	style="width: fit-content;">Post
									Comment</button>
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
	var pk=${Detail.productno};
	var path="${pageContext.request.contextPath}";
	var board = document.getElementById("board");
	var postUrl=path+"/leaveComment?memberid=${member.id}&key="+pk+"&type="+object;
	var getUrl=path+"/loadComment?key="+pk+"&type="+object;
	

</script>

<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="big5"></script>

</body>
</html>