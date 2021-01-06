<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, product.*, product.cartModel.CartItem"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0  
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/cart.css" TYPE="text/css">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>購物車</title>
<style>
.progress_bar {
	display: flex;
	justify-content: center;
}

.progress_bar li {
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	background-image: linear-gradient(9deg, #B22222, #DB7093);
	color: #fff;
	width: 105px;
	height: 105px;
	border-radius: 50%;
	position: relative;
	box-shadow: 0px 0px 0px 4px #fff;
}

.progress_bar li+li {
	margin-left: 100px;
}

.progress_bar li+li:before {
	content: '';
	position: absolute;
	width: 100px;
	height: 5px;
	background-color: #DB7093;
	top: 0;
	bottom: 0;
	left: -100px;
	margin: auto;
	box-shadow: 0px 0px 0px 2px #fff;
}

.progress_bar li.active ~li {
	background-image: linear-gradient(9deg, #999, #ccc);
}

.progress_bar li.active ~li:before {
	background-color: #999;
}

#storeButton, #recipient input[type=submit] {
	background-color: DodgerBlue;
	color: white;
	border: 1px solid #ddd;
	border-radius: 5px;
	cursor: pointer;
	padding: 5px 10px;
	font-size: 15px;
	font-weight: bold;
}
</style>
<script>
function copyMember(){
	$("#recipientName").val("${sessionScope.member.name}");
	$("#recipientEmail").val("${sessionScope.member.email}");
	$("#recipientPhone").val("${sessionScope.member.phone}");
	$("#shippingAddress").val("${sessionScope.member.address}");
			
}

function storeAddressChange(){
	var store = $("#shippingAddress").val();
	console.log(store)
	var addr;
	if(store!=""){
		start = store.indexOf("門市-")+3;//數字
		addr = store.substring(start);//把門市-後的字串抓出來
		//alert(addr);
	}
	var url = "https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=" + addr + "&z=16&output=embed&t=";
	//alert(url);
	$("#myMap").attr("src",url);
}
</script>
</head>
<%@include file="../jspf/header.jspf"%>

 	<% 
 		MemberBean member = (MemberBean) session.getAttribute("member");
 	%>  

<div>
	<ol class="progress_bar">
		<li>購物車</li>
		<li class="active">結帳</li>
		<li>結帳明細</li>
	</ol>
</div>
<br>
<br>
<fieldset
	style="margin: auto; position: relative; width: 1200px; border: 1px solid transparent;">
	<h4 style="font-weight: bold; text-align: center">購物清單</h4>
	<br>
	<table id="tab" class="table table-hover">
		<thead>
			<tr>
				<th style="text-align: center; vertical-align: middle;" scope="col">商品</th>
				<th style="text-align: center; vertical-align: middle;" scope="col">內容</th>
				<th style="text-align: center; vertical-align: middle;" scope="col">價格</th>
				<th style="text-align: center; vertical-align: middle;" scope="col">數量</th>

			</tr>
		</thead>
		<tbody>
			<%
				// Scriptlet 1: Display the items in shopping cart
			List<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
			for (CartItem item : cart) {
			%>

			<tr>
				<td style="text-align: center; vertical-align: middle;" scope="row"><img
					class="img"
					src="${pageContext.request.contextPath}/pic/<%=item.getProductImage()%>"></td>
				<td style="text-align: center; vertical-align: middle;"><%=item.getProductName()%></td>
				<td style="text-align: center; vertical-align: middle;">NT$<%=item.getProductPrice()%></td>
				<td style="text-align: center; vertical-align: middle;"><%=item.getQtyOrdered()%></td>

			</tr>
			<%
				} // for
			%>
			<tr>
				<th
					style="text-align: center; vertical-align: middle; font-size: 20px;"
					colspan="2">總計</th>
				<th
					style="text-align: center; vertical-align: middle; font-size: 18px;">NT$<%=session.getAttribute("totalPrice")%></th>
				<th
					style="text-align: center; vertical-align: middle; font-size: 18px;"><%=session.getAttribute("totalQtyOrdered")%></th>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" style="text-align: center; vertical-align: middle;">
					<fieldset id="recipient">
						<legend>
							收件人<a href='javascript:copyMember()' style="color: #CD5C5C">同訂購人</a>
						</legend>
						<label>姓名：</label><br> 
						<input id="recipientName" name="recipientName" required style="width: 100%;"
							value=""><br> 
						<label>Email：</label><br>
						<input id="recipientEmail" name="recipientEmail" required
							style="width: 100%;" value=""><br>
						<label>電話：</label><br> 
						<input id="recipientPhone" name="recipientPhone" required style="width: 100%;"
							value=""><br> 
						<label>地址：</label><br>
						<input type="search" id="shippingAddress" name="shippingAddress" list="shopList"
							required onchange="storeAddressChange()" style="width: 100%;" value="">
						<datalist id="shopList">
							<option value="北車門市-台北市中正區忠孝西路一段49號B1樓">
							<option value="小巨蛋門市-台北市松山區南京東路四段2號">
							<option value="世運門市-台北市萬華區昆明街81號83號">
						</datalist>
						<br><br>
						<button type="button" style="display: none;" id="storeButton"
							onclick='goEzShip()'>選擇超商</button>
						<input type="submit" style="display: none;" value="確定結帳">
					</fieldset>
				</td>
				<td colspan="2" style="text-align: center;"><iframe id="myMap"
						width='550' height='400'
						src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北市中正區忠孝西路一段49號B1樓&z=16&output=embed&t='></iframe>
				</td>
			</tr>
		</tfoot>
	</table>
	<br>
	<div style="text-align: center;">
		<form name="checkoutForm" action="<c:url value='/orderInsert' />"
			method="get">
			<input type="hidden" name="todo" value="commit">
			<!-- hidden隱藏欄位 -->
			<input class="btn btn-dark" type="submit" value="送出訂單">

		</form>
	</div>
</fieldset>
<%@include file="../jspf/footer.jspf"%>