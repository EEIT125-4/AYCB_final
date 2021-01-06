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

<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>

<title>Manager</title>
</head>
<body>
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
			<div id="add" class="addcontent">
				<div class="addbox">
					<div>
						<form:form id="addform" method='POST' modelAttribute="ProductBean"
							enctype="multipart/form-data" data-toggle="validator">
							<fieldset class="addfs">
								<legend class="addtitle">新增</legend>
								<div class="form-group adddiv">
									<label class="addlab">廠牌名稱:</label>
									<form:input id="brandname" path="brandname" type="text" class="form-control" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品類型:</label>
									<form:select class="form-control" path="producttype" required="required">
										<form:option id="producttype" value=""></form:option>
										<form:option value="保養品">保養品</form:option>
										<form:option value="彩妝">彩妝</form:option>
									</form:select>
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品名稱:</label>
									<form:input id="productname" type="text" path="productname" class="form-control" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品系列:</label>
									<form:input id="productseries" type="text" path="productseries" class="form-control" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品種類:</label>
									<form:input id="productcategory" type="text" path="productcategory" class="form-control" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品價格:</label>
									<form:input id="productprice" type="text" path="productprice" class="form-control" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div class="form-group adddiv">
									<label class="addlab">產品圖片:</label>
									<form:input id="productimage" type="file" path="productimage" class="mpfile" required="required" />
									<div class="help-block with-errors errortext"></div>
								</div>
								<div>
									<div class="adddiv">
										<input id="addbtn" type="submit" value="新增" class="addbtn">
									</div>
									<div class="adddiv">
										<input id="databtn" type="button" value="帶入資料" class="databtn">
									</div>
								</div>
							</fieldset>
						</form:form>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../jspf/footer.jspf"%>
</body>
</html>