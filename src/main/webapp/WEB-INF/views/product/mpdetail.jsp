<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/inside.js" defer="defer"></script>
<script src="js/manager.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/mpdetail.css" TYPE="text/css">
<title>Manager</title>
</head>
<%@include file="../jspf/managerheader.jspf"%>
<div class="contentoutbox">
	<div class="contentbox">
		<div class="rightoutbox">
			<div>
				<form name="UpdateForm" action="" method="POST">
					<div class="rightside">
						<div class="imgbox">
							<a href="#"><img src="image/${Detail.productname}.png"></a>
						</div>
					</div>
					<div class="infobox">
						<div class="infoname">${Detail.productname}</div>
						<div class="infono">商品編號：${Detail.brandno}${Detail.productno}</div>
						<hr>
						<div class="infoseries">系列：${Detail.productseries}</div>
						<div class="infocate">種類：${Detail.productcategory}</div>
						<hr>
						<div id="infoprice" class="infoprice">NT$：${Detail.productprice}</div>
						<div id="updatebox" class="updatebox">
							<input class="updatetext" type="text" name="productprice">
							<input type="submit" class="updatebtn" value="更新">
						</div>
						<div></div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="../jspf/footer.jspf"%>
	</div>
</div>
</div>

</body>
</html>