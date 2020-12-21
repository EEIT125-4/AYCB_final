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
		<div class="rightoutbox">
			<div>
				<form:form method="POST" modelAttribute="ProductBean">
					<div class="rightside">
						<div class="imgbox">
							<a href="#"><img src="image/${ProductBean.productname}.png"></a>
						</div>
					</div>

					<div class="infobox">
						<div>
							商品編號： ${ProductBean.productno}

							<form:input type="text" path="productno" />

						</div>
						<hr>
						missing area 
						<input type="text" name="pno" value='${ProductBean.productno}' /> 
							<input type="text" name="bno" value='${ProductBean.brandno}' /> 
							<input type="text" name="st" value='${ProductBean.skintype}' />
						<hr>

						<div class="infobrandno">
							廠編：${ProductBean.brandno}
							<form:input type="hidden" path="brandno" />
						</div>

						<div class="infobrandno">
							廠名：${ProductBean.brandname}
							<form:input type="hidden" path="brandname" />
						</div>
						<hr>

						<div class="infotype">
							${ProductBean.producttype}
							<form:input type="hidden" path="producttype" />
						</div>


						<div class="infoname">
							${ProductBean.productname}
							<form:input type="hidden" path="productname" />
						</div>

						<div class="infoseries">
							系列：${ProductBean.productseries}
							<form:input type="text" path="productseries" />
						</div>

						<div class="infocate">
							種類：${ProductBean.productcategory}
							<form:input type="text" path="productcategory" />
						</div>



						<div class="infoskinnytype">
							種類：${ProductBean.skintype}
							<form:input type="text" path="skintype" />
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


</body>
</html>