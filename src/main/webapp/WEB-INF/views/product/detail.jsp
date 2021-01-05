<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<<<<<<< HEAD
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
=======
>>>>>>> parent of b635b29... 1/5 Julia
=======
>>>>>>> parent of b635b29... 1/5 Julia
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="js/inside.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/ProductDetail.css" TYPE="text/css">
<title>All You Can Buy</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentBox" style="min-height: 1300px;">

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
<<<<<<< HEAD
<<<<<<< HEAD

			<form name="AddForm"
				action="${pageContext.request.contextPath}/cartAdd" method="get">
				<input type="hidden" name="todo" value="add">
				<div class="rightside">
					<div class="imgbox">
						<a href="#"> <img
							src="${pageContext.request.contextPath}/pic/${Detail.imagepath}"></a>
=======
			<form name="AddForm" action="${pageContext.request.contextPath}/cartAdd" method="get">
				<input type="hidden" name="todo" value="add">
				<div class="rightside">
					<div class="imgbox">
						<a href="#"><img src="image/${Detail.productname}.png"></a>
>>>>>>> parent of b635b29... 1/5 Julia
=======
			<form name="AddForm" action="${pageContext.request.contextPath}/cartAdd" method="get">
				<input type="hidden" name="todo" value="add">
				<div class="rightside">
					<div class="imgbox">
						<a href="#"><img src="image/${Detail.productname}.png"></a>
>>>>>>> parent of b635b29... 1/5 Julia
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
<<<<<<< HEAD
<<<<<<< HEAD
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
						<div class="infobtn">
							<input class="cartbtn" type="submit" value="加入購物車"> <input
								type="hidden" name="productno" value="${Detail.productno}">
						</div>
						<div class="lineshare">
							<div class="line-it-button" data-lang="zh_Hant"
								data-type="share-a" data-ver="3"
								data-url="http://localhost:8080/AYCB/Detail?no=${Detail.productno}"
								data-color="default" data-size="large" data-count="true"
								style="display: none;"></div>
							<script
								src="https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js"
								async="async" defer="defer"></script>
							<div id="fb-root"></div>
=======
=======
>>>>>>> parent of b635b29... 1/5 Julia
							數量 :
							<div class="selbox">
								<select name="count" class="countsel">
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
							<div class="infobtn">
								<input class="btn" type="submit" value="加入購物車"> <input
									type="hidden" name="productno" value="${Detail.productno}">
							</div>
<<<<<<< HEAD
>>>>>>> parent of b635b29... 1/5 Julia
=======
>>>>>>> parent of b635b29... 1/5 Julia
						</div>
					</div>
				</div>
			</form>
		</div>
<<<<<<< HEAD
<<<<<<< HEAD

		<div class="content">##################</div>

		<div class="content">
			<div id="post" style="margin-top: 60px;">

				<H1 class="board" style="border-radius: 10px" ALIGN="CENTER">留言佈告欄</H1>


				<form:form method="POST" modelAttribute="leave" id="ajaxform"
					name="ajaxform" enctype='multipart/form-data'>
					<Fieldset class="discussionbox">
						<div>
							<label>留言類型:</label>
							<form:input path="type" value="product" disabled="true" />
						</div>
						<div>
							<label>會員名稱：</label> <span>${member.name}</span> <input
								type="hidden" id="shangtian" name="mid" value="${member.id}" />


						</div>

						<div>
							<label>性別:</label> <span>${member.gender}</span>
						</div>


						<div>
							Age:<label for="age">(between 0 and 100):</label> <input
								type="number" id="age" name="age" min="0" max="100">
							<%!int st = 0;%>

							<label for="status"></label>
							<%-- 					<form:input type="hidden" path="status" value=<%=st%>/>					 --%>
							<!-- 					<label for="commentId"></label> -->
							<!-- 					<input type="hidden" name="commentId">  -->
							<!-- 					<label for="commentTime"></label> -->
							<!-- 					<input type="hidden" name="commentTime"> -->
						</div>
						<div>
							<label for="contentBox"></label>
							<form:textarea path="contentBox" id="contentBox"
								class="transition" />

							<!-- 				<INPUT id="postBt" type="submit" name="submit" onclick="leavecomment" -->
							<!-- 					value="發表留言" />  -->
						</div>
						<div>
							<span>
								<button id="postBt" type="button">發表留言</button> <!-- 				 onclick="leavecomment()" -->
								<button id="clear" type="reset">清除</button>
							</span>
						</div>
					</Fieldset>

				</form:form>

			</div>
		</div>

	</div>
	<%@include file="../jspf/footer.jspf"%>

</div>






<!-- 長出留言 -->
<script>
	var productno = $
	{
		Detail.productno
	};
	$(document).ready(function() {

		console.log("productno=" + productno);

		$("#postBt").on("click", function() {
			leavecomment();

		});

		function leavecomment() {
			alert("btn click");

			$.ajax({

				type : "post",
				url : "${pageContext.request.contextPath}/leaveComment",
				// 			contentType: "application/json; charset=utf-8",
				dataType : "text",
				data : $("#ajaxform").serialize(),
				success : function(data) {

					alert("leave comment!" + data);
					console.log("leave comment");
					console.log(data);
					console.log(typeof (data));

					// 				display();

				},
				error : function() {
					alert("留言失敗,請重新留言");
				}
			})

		}

		function display() {

			$('#productno').empty();
			$('#productno').append();

		}
	});
	// 				"<option value='' disabled='' selected='' hidden=''>留言訊息</option>"
	// 						+ "<option value=''>All</option>");

	// 		for (let i = 0; i < data.length; i++) {
	// 			console.log("data:" + i + data[i]);
	// 			$('#productno').append(
	// 					"<option value="+data[i]+">" + data[i]
	// 							+ "</option>");
</script>
=======
		<%@include file="../jspf/footer.jspf"%>
	</div>
</div>
</div>
>>>>>>> parent of b635b29... 1/5 Julia
=======
		<%@include file="../jspf/footer.jspf"%>
	</div>
</div>
</div>
>>>>>>> parent of b635b29... 1/5 Julia
</body>
</html>