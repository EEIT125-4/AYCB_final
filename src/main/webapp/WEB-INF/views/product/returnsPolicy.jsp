<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,product.*,product.model.ProductBean,product.cartModel.CartItem,member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	boolean login = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	login = true;
}
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">     
        <title>退換貨原則</title>  
        <style>			
    		ol{
    			color: red;
    		}	
    		ol li{
    			color: black;
    		}
        </style>
    </head>
    <%@include file="../jspf/header.jspf"%>
	<body>
		<div style="margin:0px auto;" class=container>
		<hr>
		<div style="width: 800px;font-size: 18px;" class="">		
			<div class="inside">
				<ol>【接受換貨的原則】
					<li>送達之商品與訂購商品不符。</li>
					<li>收到商品七天以內。</li>
					<li>商品未使用的情況下。</li>
					<li>請於收貨當天立即告知。</li>
				</ol>
				<ol>【不接受換貨的原則】
					<li>須保留商品上之吊牌、標籤…等包裝之完整。</li>
					<li>超過七天鑑賞期。</li>
					<li>個人觀感問題(例如不喜歡的顏色,不喜歡用等等)</li>
				</ol>
				<ol>【換貨處理程序】
					<li>請在收到商品七天內，電洽本店02-2514-9191</li>
					<li>商品包裝必須完整，所以商品上的標籤、吊牌不可拆掉，寄回給本店。</li>
					<li>請先將訂貨人姓名、電話、地址、換貨相關事宜 等資料mail通知</li>
					<li>將貨品寄至台北市松山區復興北路99號14樓</li>
				</ol>
			</div>
		</div>
		<br><br><br><br><br><br>
	</div>
	
	<%@include file="../jspf/footer.jspf"%>	
	</body>
</html>