<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/add.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/mpadd.css" TYPE="text/css">
<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/managerheader.jspf"%>
	<div class="contentoutbox">
		<div class="contentbox">
			<div id="add" class="addcontent">
				<div class="addbox">
					<div>
						<form:form method="POST" modelAttribute="ProductBean">
							<fieldset class="addfs">
								<legend class="addtitle">新增</legend>
								<div class="adddiv">
									<label class="addlab">廠牌名稱:</label>
									<form:input path="brandname" type="text" class="addinput" />
								</div>
								<div class="adddiv">
									<label class="addlab">產品類型:</label>
									<form:select class="addsel" path="producttype">
										<form:option value="保養品">保養品</form:option>
										<form:option value="彩妝">彩妝</form:option>
									</form:select>
								</div>
								<div class="adddiv">
									<label class="addlab">產品名稱:</label>
									<form:input type="text" path="productname" class="addinput" />
								</div>
								<div class="adddiv">
									<label class="addlab">產品系列:</label>
									<form:input type="text" path="productseries" class="addinput" />
								</div>
								<div class="adddiv">
									<label class="addlab">產品種類:</label>
									<form:input type="text" path="productcategory" class="addinput" />
								</div>
								<div class="adddiv">
									<label class="addlab">產品價格:</label>
									<form:input type="text" path="productprice" class="addinput" />
								</div>
								<!-- 								<div class="adddiv"> -->
								<!-- 									<label class="addlab">產品圖片:</label> -->
								<%-- 									<form:input type="file" path="productimg" /> --%>
								<!-- 								</div> -->
								<div class="adddiv">
									<input type="submit" value="新增" class="addbtn">
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>