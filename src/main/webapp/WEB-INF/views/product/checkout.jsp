<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, product.*, product.cartModel.CartItem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>結帳</title>
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

.butt {
	width: auto;
	height: auto;
	margin-top: 0px;
}
.top {
		color: white;
		background: #FF2D2D;
		padding: 14px 10px;
		position: fixed;
		right: 20px;
		bottom: 100px;
		text-align: center;
		border-radius: 50px;
		z-index: 1;
	}
</style>

<% 
   MemberBean member = (MemberBean) session.getAttribute("member");
%>  
 	
<script >

// function paymentTypeChange() {
// 	//#paymentType, #shippingType
// 	var payVal = $("#paymentType").val();
// 	if(payVal.length > 0){
// 		var shipData = $("#paymentType option:selected").attr("data-shippingArray");
// 		if(shipData.length > 0){
// 			$("#shippingType option").addClass("hidden");
// 			$("#shippingType option[value='']").removeClass("hidden");
// 			shipArray = shipData.split(",");
// 			for(i = 0; i < shipArray.length; i++){
// 				$("#shippingType option[value='"+shipArray[i]+"']").removeClass("hidden");
// 			}
// 		}			
// 	}
// 	calculateFee();	//calculate計算  
// }

    function shippingTypeChange() {
//     var width = parseFloat($("#recipientPhone").css("width"));
//     console.log(width);

//     $("#shippingAddress").removeAttr("list");
//     $("#shippingAddress").removeAttr("autocomplete");
//     $("#shippingAddress").removeAttr("placeholder");
//     $("#shippingAddress").attr("readonly", false);
//     $("#shippingAddress").attr("autocomplete", "on");
//       $("#storeButton").css("display", "none");
//     $("#shippingAddress").val("");
<%--     if ($("#shippingType").val() == "<%= ShippingType.SHOP.name()%>") { --%>
//         $("#shippingAddress").attr("placeholder", "請選擇門市");
//         $("#shippingAddress").attr("list", "shopList");
//         $("#shippingAddress").attr("autocomplete", "off");
<%--     } else if ($("#shippingType").val() == "<%= ShippingType.STORE.name()%>") { --%>
//         $("#shippingAddress").attr("readonly", true);
           $("#shippingAddress").attr("placeholder", "請點選下方的按鈕選擇超商");
//         //$("#shippingAddress").css("width", width - 77);
           $("#storeButton").css("display", "inline");
//     } else {
//         $("#shippingAddress").attr("placeholder", "請輸入收件地址");
     }
    
//     calculateFee();
// }	

// function calculateFee(){
// 	var totalAmount = parseFloat($("#totalAmount").text());
// 	var paymentFee = parseFloat($("#paymentType option:selected").attr("data-fee"));
// 	var shippingFee = parseFloat($("#shippingType option:selected").attr("data-fee"));
// 	var total = totalAmount+(isNaN(paymentFee)?0:paymentFee)+(isNaN(shippingFee)?0:shippingFee);
// 	console.log(totalAmount, paymentFee, shippingFee, total);
// 	$("#totalWithFee").text(total);
	
// }

function copyMember(){
	console.log("1111")
	$("#recipientName").val("${sessionScope.member.name}");
	$("#recipientEmail").val("${sessionScope.member.email}");
	$("#recipientPhone").val("${sessionScope.member.phone}");
	$("#shippingAddress").val("${sessionScope.member.address}");
	var store = $("#shippingAddress").val();
	console.log(store)
	var url = "https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=" + store + "&z=16&output=embed&t=";
	$("#myMap").attr("src",url);
			
}

function storeAddressChange(){
	var store = $("#shippingAddress").val();
	console.log(store)
// 	var addr;
//	if(store!=""){
// 		start = store.indexOf("門市-")+3;//數字
// 		addr = store.substring(start);//把門市-後的字串抓出來
// 		alert(addr);
//		alert(store);
//	}
	var url = "https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=" + store + "&z=16&output=embed&t=";
//	alert(url);
	$("#myMap").attr("src",url);
}


</script>
</head>
<%@include file="../jspf/header.jspf"%>

<div id="mytop" style="text-align: center">

<div>
	<ol class="progress_bar">
		<li>購物車</li>
		<li class="active">結帳</li>
		<li>結帳明細</li>
	</ol>
</div>
<br>
<br>
<form id="cartForm" name="checkoutForm" action="<c:url value="/orderInsert"/>" method="get">

<fieldset
	style="margin: auto; position: relative; width: 1300px; border: 1px solid transparent;">
	<h4 style="font-weight: bold; text-align: center">購物清單</h4>
	<br>
	
	<table id="tab" class="table table-hover">
		<thead>
			<tr bgcolor='#F0F0F0'>
				<th style="text-align: center; vertical-align: middle; width: 150px" scope="col">商品</th>
				<th style="text-align: center; vertical-align: middle; width: 150px" scope="col">品牌</th>
				<th style="text-align: center; vertical-align: middle; width: 250px" scope="col">系列</th>				
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
				<td style="text-align: center; vertical-align: middle;"><%=item.getBrandName()%></td>
				<td style="text-align: center; vertical-align: middle;"><%=item.getProductSeries()%></td>
				<td style="text-align: center; vertical-align: middle;"><%=item.getProductName()%></td>
				<td style="text-align: center; vertical-align: middle;">NT$ <fmt:formatNumber value="<%=item.getProductPrice()%>"  pattern="###,###" /></td>
				<td style="text-align: center; vertical-align: middle;"><%=item.getQtyOrdered()%></td>

			</tr>
			<%
				} // for
			%>
			<tr>
				<th
					style="text-align: right; vertical-align: middle; font-size: 20px;"
					colspan="4">總計金額：</th>
				<th
					style="text-align: center; vertical-align: middle; font-size: 18px;">NT$ <fmt:formatNumber value="${totalPrice}"  pattern="###,###" />元</th>
				<th
					style="text-align: center; vertical-align: middle; font-size: 18px;">${totalQtyOrdered}</th>
			</tr>
		</tbody>
		<tfoot>
		<tr bgcolor='#F0F0F0'>
		<td colspan="2" style="text-align: center;vertical-align: middle; font-size: 18px;"><label>付款方式：</label>
							<select id="paymentType" name="paymentType" required
							onclick="">
								<option value="">請選擇...</option>
								<option value="超商付款">超商付款</option>
								<option value="信用卡">信用卡</option>
		</select></td>
		<td colspan="2" style="text-align: left;vertical-align: middle; font-size: 18px;"><label>貨運方式：</label>
							<select id="shippingType" name="shippingType" required
							onchange="shippingTypeChange()">
								<option value="">請選擇...</option>
								<option value="超商取貨">超商取貨</option>
								<option value="宅配到家">宅配到家</option>
								
		</select></td>
		<td colspan="4" style="text-align: center;vertical-align: middle; font-size: 18px;">含物流費共： NT$ <span
							id="totalWithFee"><fmt:formatNumber value="${Shipping}"  pattern="###,###" /></span>元
		</td>
		</tr>
		
			<tr>
				<td colspan="3" style="text-align: center; vertical-align: middle;">
					<fieldset id="recipient" style="border: 1px solid transparent;">
						<legend>
							收件人<a href='javascript:copyMember()' style="color: #CD5C5C">同訂購人</a>
						</legend>
						<label>姓名：</label><br> 
						<input id="recipientName" name="recipientName" required style="width: 100%;"
							value="${param.recipientName}"><br> 
						<label>Email：</label><br>
						<input id="recipientEmail" name="recipientEmail" required
							style="width: 100%;" value="${param.recipientEmail}"><br>
						<label>電話：</label><br> 
						<input id="recipientPhone" name="recipientPhone" required style="width: 100%;"
							value="${param.recipientPhone}"><br> 
						<label>地址：</label><br>
						<input type="search" id="shippingAddress" name="shippingAddress" list="shopList"
							required onchange="storeAddressChange()" style="width: 100%;" value="${param.shippingAddress}">
						<datalist id="shopList">
							<option value="7-ELEVEN北車門市-台北市中正區忠孝西路一段49號B1樓">
							<option value="7-ELEVEN小巨蛋門市-台北市松山區南京東路四段2號">
							<option selected value="7-ELEVEN世運門市-台北市萬華區昆明街81號83號">
							<option value="<%=member.getAddress()%>">
						</datalist>
						<br><br>
						<button type="button" style="display: none;" id="storeButton"
							onclick='goEzShip()'>選擇超商</button>
<!-- 						<input type="submit" style="display: none;" value="確定結帳"> -->
					</fieldset>
				</td>
				<td colspan="3" style="text-align: center;"><iframe id="myMap"
						width='800' height='500'
						src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北市萬華區昆明街81號83號&z=16&output=embed&t='></iframe>
				</td>
			</tr>
		</tfoot>
	</table>
	<br>
	<div style="text-align: center;">		
			<input class="btn btn-dark" type="submit" value="送出訂單" >		
	</div>
	<br><br>
</fieldset>
</form>

<form method="post" action="http://map.ezship.com.tw/ezship_map_web.jsp" id="ezForm">
		            <input type="hidden" name="suID"  value="test@vgb.com"> <!-- 業主在 ezShip 使用的帳號, 這裡可以隨便寫 -->
		            <input type="hidden" name="processID" value="VGB201804230000005"> <!-- 購物網站自行產生之訂單編號, 這裡可以隨便寫 -->
		            <input type="hidden" name="stCate"  value=""> <!-- 取件門市通路代號 -->            
		            <input type="hidden" name="stCode"  value=""> <!-- 取件門市代號 -->            
		            <input type="hidden" name="rtURL" id="rtURL" value=""><!-- 回傳路徑及程式名稱 -->
		            <input type="hidden" id="webPara" name="webPara" value=""><!-- 我們網站所需的原Form Data。ezShip會將原值回傳，供我們網站帶回畫面用 -->
</form>	
	
	<a onclick="goTop();"><div class="top">TOP</div></a>
</div>	
<%@include file="../jspf/footer.jspf"%>	        
<script>

	function goTop(){
		var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
		$body.animate({
			scrollTop: 0
		}, 200);
	}
	
	window.onload = function() {
		
	var store = $("#shippingAddress").val();
	console.log(store)
	var url = "https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=" + store + "&z=16&output=embed&t=";
	$("#myMap").attr("src",url);
	
	};
	
	$(initValue);
	function initValue() {
	<% if(request.getParameter("paymentType")!=null){%>
				$("#paymentType").val('<%=request.getParameter("paymentType")%>');
				//paymentTypeChange();
			<%}%>
			
			<% if(request.getParameter("shippingType")!=null){%>
				$("#shippingType").val('<%=request.getParameter("shippingType")%>');
				//shippingTypeChange();
				$("#shippingAddress").val('<%=request.getParameter("shippingAddress")%>');
			<%}%>
	}
//localhost
//192.168.196.130
    function goEzShip() {
        $("#recipientName").val($("#recipientName").val().trim());//抓取輸入項的值，並且把字串2旁的空白刪除  trim刪除空白
        $("#recipientEmail").val($("#recipientEmail").val().trim());
        $("#recipientPhone").val($("#recipientPhone").val().trim());
        $("#shippingAddress").val($("#shippingAddress").val().trim());
        //alert("recipientName"+$("#recipientName").val())
        var protocol = "<%=request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/"))%>";
        var ipAddress = "<%= java.net.InetAddress.getLocalHost().getHostAddress()%>";
        var url = protocol + "://localhost:" + location.port + "<%=request.getContextPath()%>/ezshipBack";
        $("#rtURL").val(url);
        
        $("#webPara").val($("#cartForm").serialize());		//serialize(),將cartForm內所有name屬性的資料序列化
		//alert(url);
        //alert($("#webPara").val());
		//alert($("#cartForm").serialize());		
        $("#ezForm").submit();
    }


</script>

</body>
</html>