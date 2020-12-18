<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/add.js" defer="defer"></script>
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/mproduct.css" TYPE="text/css">
<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/managerheader.jspf"%>
	<div class="contentoutbox">
		<div class="contentbox">
			<div class="mp">
				<div class="mpbox">
					<button class="mpbtn" onclick="addshow()">
						<div class="mpimgbox">
							<img class="mpimg" src="image/add.png">
						</div>
						<div class="mptext">新增</div>
					</button>
				</div>
				<div class="mpbox">
					<button class="mpbtn">
						<div class="mpimgbox">
							<img class="mpimg" src="image/update.png">
						</div>
						<div class="mptext">更新</div>
					</button>
				</div>
				<div class="mpbox">
					<button class="mpbtn">
						<div class="mpimgbox">
							<img class="mpimg" src="image/del.png">
						</div>
						<div class="mptext">刪除</div>
					</button>
				</div>
			</div>
			<div id="add" class="addcontent">
				<div class="addbox">
					<div>
						<form:form method="POST" action="${pageContext.request.contextPath}/Add" modelAttribute="ProductBean" enctype="multipart/form-data">
							<fieldset class="addfs">
								<legend class="addtitle">新增</legend>
								<div class="adddiv">
									<label class="addlab">廠牌名稱:</label> <input type="text"
										name="brandname" class="addinput">
								</div>
								<div class="adddiv">
									<label class="addlab">產品類型:</label> <select class="addsel"
										name="producttype">
										<option>保養品</option>
										<option>彩妝</option>
									</select>
								</div>
								<div class="adddiv">
									<label class="addlab">產品名稱:</label> <input type="text"
										name="productname" class="addinput">
								</div>
								<div class="adddiv">
									<label class="addlab">產品系列:</label> <input type="text"
										name="productseries" class="addinput">
								</div>
								<div class="adddiv">
									<label class="addlab">產品種類:</label> <input type="text"
										name="productcategory" class="addinput">
								</div>
								<div class="adddiv">
									<label class="addlab">產品價格:</label> <input type="text"
										name="productprice" class="addinput">
								</div>
<!-- 								<div class="adddiv"> -->
<!-- 									<label class="addlab">產品圖片:</label> <input type="file" -->
<!-- 										name="productimg"> -->
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