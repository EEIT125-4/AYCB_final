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
								<input class="cartbtn" type=<%=session.getAttribute("member") != null ? "submit" : "hidden"%> value="加入購物車"> 
								<input type="hidden" name="productno" value="${Detail.productno}">
								<div class="lineshare">
									<div class="line-it-button" data-lang="zh_Hant"
										data-type="share-a" data-ver="3"
										data-url="http://localhost:8080/AYCB_final/Detail?no=${Detail.productno}"
										data-color="default" data-size="large" data-count="true"
										style="display: none;"></div>
									<script src="https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
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
					<li class="toolbar_li"><a class="toolbar_a" href='<c:url value="/car" />'><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="msg">購物車</span></a></li>
					<li class="toolbar_li"><a class="toolbar_a" href="<c:url value='/History' />"><i class="fa fa-clock-o" aria-hidden="true"></i><span class="msg">瀏覽紀錄</span></a></li>
					<li class="toolbar_li"><a class="toolbar_a" href="<c:url value='/Collect' />"><i class="fa fa-heart" aria-hidden="true"></i><span class="msg">收藏清單</span></a></li>
					<li class="toolbar_li"><span id="top" class="top_a"><i class="fa fa-chevron-up" aria-hidden="true"></i><span class="msg">回TOP</span></span></li>
				</ul>
			</div>

			<div class="content">

				<!--  留言 -->
				<div>
					<c:if test='${not empty member}'>
						<div id="content">
							<div id="post">
								<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>
								<FORM
									ACTION="${pageContext.request.contextPath}/comment/CommentController"
									method="Post">
									<Fieldset class="discussionbox">
								</FORM>

								<div>
									<label>會員名稱：</label> <input type="text" id="shangtian"
										name="name" value="${member.name}" disabled>
								</div>

								<div>
									性別: <input type="text" name="gender" value="${member.gender}" disabled>
								</div>

								<div>
									<%!int st = 0;%>
									<label for="status"></label> <input type="hidden" name="status"
										value=<%=st%>> <label for="id"></label> <input
										type="hidden" name="${member.id}"> <label
										for="commentId"></label> <input type="hidden" name="commentId">
									<label for="commentTime"></label> <input type="hidden"
										name="commentTime">
								</div>
								<label for="contentBox"></label>
								<textarea name="content" id="contentBox" class="transition"></textarea>
								<button id="submit" type="button" class="site-btn"
									style="width: fit-content; margin-left: 700px;"
									onclick="postComment()">送出</button>
								<button class="site-btn" style="width: fit-content;"
									clear" type="reset" name="clear">清除</button>
								</Fieldset>
							</div>
							
							<!-- 回覆留言 -->
							<div id="boardreply"></div>
				
				
							<!-- 						<div class="blog__details__comment"> -->
							<!-- 							<h4>Leave A Comment</h4> -->
							<%-- 							<form id="commentform"> --%>

							<!-- 								<div class="col-lg-12 text-center"> -->

							<!-- 									<textarea id="comment" placeholder="Comment"></textarea> -->
							<!-- 									<button id="postComment" type="button" class="site-btn" -->
							<!-- 										style="width: fit-content;">Post Comment</button> -->
							<!-- 								</div> -->
							<%-- 							</form> --%>
							<!-- 						</div> -->
					</c:if>

					<c:if test='${ empty member}'>
						<a href="${pageContext.request.contextPath}/member/login">若欲留言請先登入</a>
					</c:if>
				</div>

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


<script>
var board = document.getElementById("boardreply");
$(document).ready(function(){
		console.log("into postcomment")
	function postComment() {
		$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/leaveComment",
					dataType : "json",
					data : {
						'comment' : $("#comment").val(),
						'memberid' : '${member.id}',
						'type' : "product",
						'key' : "${comment.commentId}"
					},
					success : function(data) {
						console.log(data)
						$("#reply")
								.prepend(
										+"<div class=leavecomment>"
										+ "<li>"
										+ "<div class=picform>"
										+ "<img class=headpic src= '"+ data.imageId +"'alt=Image placeholder>"
										+ "</div>"
										+ "<div>"
										+ "<h3>"+ data.membername +"</h3>"
										+ "<div class=commentdate>"+ data.CommentTime + "</div>"
										+ "<p>" + data.ContentBox + "</p>"
										+ "<p>"
										+ "<a href=# class=reply id=reply>回覆</a>"
										+ "</p>"
										+ "</div>"
										+ "</li>"
										+ "</div>")
					}
			})
	})
})
</script>

<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="big5"></script>

</body>
</html>