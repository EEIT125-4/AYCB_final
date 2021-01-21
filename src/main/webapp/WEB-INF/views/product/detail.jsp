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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/ProductDetail.css"
	TYPE="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css" />

<script>
	$(document).ready(function() {
		Collectcheck();
	});
</script>

<title>${Detail.productname}</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentBox">
		<div class="detailbox">
			<div class="pddetail">
				<form name="AddForm"
					action="${pageContext.request.contextPath}/cartAdd" method="get">
					<input type="hidden" name="todo" value="add">
					<div class="detailimg">
						<div class="detailimgbox">
							<a href="#"> <img class="pdimg"
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
							<div class="infostock">還剩${Detail.stock}件</div>
							<div class="infobtnbox">
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
				<div>
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
			</div>
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

			<!--                         留言 -->
					<div style="width: 100%; text-align: center; background: pink;margin-bottom: 100px;min-height: 300px;">
						<c:if test='${not empty member}'>
							<div>
								<h4>留言區</h4>
							</div>

							<textarea class="comment" rows=10 placeholder="請輸入留言"></textarea>
							<div class="btnarea" style="margin-left: 50%; display: none;">
								<button class='resetBtn' type='button' style="width: fit-content; background: #111111; display: inline-block; font-size: 14px; color: #ffffff;">取消</button>
								<button class="postComment" type="button" value='${pageContext.request.contextPath}/leaveComment?key=${Detail.productno}&type=product'
									style="width: fit-content; background: #111111; display: inline-block; font-size: 14px; color: #ffffff;">送出留言</button>

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
		<%-- 		<%@include file="../jspf/footer.jspf"%> --%>
	</div>
</div>



<script>
$(function(){
    $("#top").click(function(){
        jQuery("html,body").animate({
            scrollTop:0
        },1000);
    });
});


<!-- 留言功能初始化 -->
	var object = "product";
	var pk = ${Detail.productno};
	var path = "${pageContext.request.contextPath}";
	var board = document.getElementById("board");

	var getUrl = path + "/loadComment?key=" + pk + "&type=" + object;
	
	var commentCount=0;
	// 初始化結尾
</script>




<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="utf-8"></script>

</body>
</html>