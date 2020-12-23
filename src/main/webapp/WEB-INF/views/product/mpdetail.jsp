<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/manager.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/mpdetail.css" TYPE="text/css">
<title>Manager</title>
</head>
<%@include file="../jspf/managerheader.jspf"%>
<div class="contentoutbox">
	<div class="contentbox">
		<div class="title">產品管理</div>
		<div class="mp">
			<div>
				<button class="mpbtn"
					onclick='location.href="${pageContext.request.contextPath}/MProduct"'>
					<div class="mpimgbox">
						<img class="mpimg" src="image/product.png">
					</div>
					<div class="mptext">返回</div>
				</button>
			</div>
		</div>
	</div>
	<div class="rightoutbox">
		<div>
			<form:form method="POST" modelAttribute="ProductBean">
				<div class="rightside">
					<div class="imgbox">
						<a href="#"><img src="image/${ProductBean.productname}.png"></a>
					</div>
				</div>
				<div class="infobox">
					<div class="infoname">
						${ProductBean.productname}
						<form:input type="hidden" path="brandname" />
						<form:input type="hidden" path="productname" />
						<form:input type="hidden" path="producttype" />
					</div>
					<div class="infono">
						商品編號：${ProductBean.brandno}${ProductBean.productno} <input
							type="hidden" name="productno" value="${ProductBean.productno}" />
						<input type="hidden" name="brandno" value="${ProductBean.brandno}" />

					</div>
					<hr>
					<div class="infoseries">
						系列：${ProductBean.productseries}
						<form:input type="hidden" path="productseries" />
					</div>
					<div class="infocate">
						種類：${ProductBean.productcategory}
						<form:input type="hidden" path="productcategory" />
						<form:input type="hidden" path="skintype" />
					</div>
					<hr>
					<div id="infoprice" class="updateprice">NT$：${ProductBean.productprice}</div>
					<div id="updatebox" class="updatebox">
						<form:input class="updatetext" type="text" path="productprice" />
						<input type="submit" class="updatebtn" value="更新">
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<%@include file="../jspf/footer.jspf"%>
</div>
</div>
</div>

</body>
</html>