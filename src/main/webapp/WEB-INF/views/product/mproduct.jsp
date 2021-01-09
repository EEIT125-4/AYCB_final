<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link REL=STYLESHEET HREF="css/inside.css" TYPE="text/css">
<link REL=STYLESHEET HREF="css/mproduct.css" TYPE="text/css">
<title>Manager</title>
</head>
<body>
	<%@include file="../jspf/managerheader.jspf"%>
	<div class="contentoutbox">
		<div class="contentbox">
			<div class="title">產品管理</div>
			<div class="branddiv">
				請選擇廠商: <select id='brand' class="brandsel">
					<option>請選擇廠商</option>
				</select>
			</div>
			<div id='detail' class="detail">${Brands}</div>
			<div class="mp">
				<div class="mpbox">
					<div>
						<button class="mpbtn"
							onclick='location.href="${pageContext.request.contextPath}/Mpadd"'>
							<div class="mpimgbox">
								<img class="mpimg" src="image/add.png">
							</div>
							<div class="mptext">新增</div>
						</button>
					</div>
					<div>
						<button class="mpbtn"
							onclick='location.href="${pageContext.request.contextPath}/Manager"'>
							<div class="mpimgbox">
								<img class="mpimg" src="image/product.png">
							</div>
							<div class="mptext">返回</div>
						</button>
					</div>
				</div>
			</div>
			<div id="area" class="mpcontent"></div>
		</div>
	</div>
	<%-- 	<input id="Products" type="hidden" value="${Products}" /> --%>
	<%-- 	<input id="Pages" type="hidden" value="${Pages}" /> --%>
	<%-- 	<input id="TotalPages" type="hidden" value="${TotalPages}" /> --%>
	<script>
		var selectElement = document.getElementById('brand');
		var area = document.getElementById('area');
		var detail = document.getElementById('detail');
		var xhr = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		var companyData = [];
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var brands = JSON.parse(xhr.responseText);
				for (var i = 0; i < brands.length; i++) {
					var brand = [ brands[i] ];
					companyData.push(brand);
				}
				for (var i = 0; i < companyData.length; i++) {
					var option = new Option(companyData[i]);
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
		xhr.open("GET", "<c:url value='/Brands' />", true);
		xhr.send();
		selectElement.onchange = function() {
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					display(xhr2.responseText);
				}
			}
			var brandname = selectElement.options[selectElement.selectedIndex].value;
			xhr2.open("GET", "<c:url value='/GetProductsByBrand' />"
					+ "?brandname=" + brandname, true);
			xhr2.send();
// 						var pageNo = document.getElementById('pageNo').value;
// 						xhr3.open("GET", "<c:url value='/GetgetProductsPage' />"
// 								+ "?pageNo=" + pageNo, true);
// 						xhr3.send();
		}
		function display(responseText) {
			var product = JSON.parse(responseText);
			var content = "<div>";
			for (var i = 0; i < product.length; i++) {
				content += "<div class='rightside'>"
						+ "<div class='imgbox'>"
						+ "<a href='<c:url value="/Mpupdate" />?no="
						+ product[i].productno
						+ "'>"
						+ "<img class='proimg' src='${pageContext.request.contextPath}/pic/"+product[i].imagepath+"'></a></div>"
						+ "<div class='proname'>"
						+ product[i].productname
						+ "</div>"
						+ "<div class='buttonbox'>"
						+ "<div class='proprice'>NT$"
						+ product[i].productprice
						+ "</div>"
						+ "<div class='cart'>"
						+ "<a id='del' class='cart_a' href='<c:url value="/Delete" />?no="
						+ product[i].productno
						+ "'>"
						+ "<i class='fa fa-trash fa-2x cartimg' aria-hidden='true'></i>"
						+ "</a>" + "</div>" + "</div>" + "</div>";
			}
// 						content += "<div class='page'>" + "<ul class='page_ul'>"
// 								+ "<li class='page_ul_li'>"
// 								+ "<a class='page_ul_li_a' href='<c:url value="/GetBrandPage" />?pageNo=" + Pages-1 + "'>"
// 								+ "<i class='fa fa-angle-double-left' aria-hidden='true'></i>"
// 								+ "</a>" + "</li>";
// 						for (var i = 1; i < TotalPages; i++) {
// 							content += "<li class='page_ul_li'>"
// 									+ "<a id='pageNo' class='page_ul_li_a' href='<c:url value="/GetBrandPage" />?pageNo=" + i + "'>" 
// 									+ i
// 									+"</a>" + "</li>";
// 						}
// 						content += "<li class='page_ul_li'>"
// 								+ "<a class='page_ul_li_a' href='<c:url value="/GetBrandPage" />?pageNo=" + Pages+1 + "'>"
// 								+ "<i class='fa fa-angle-double-right' aria-hidden='true'></i>"
// 								+ "</a>" + "</li>" + "</ul>" + "</div>";
// 						content += "</div>";
			area.innerHTML = content;
			var brandname = selectElement.options[selectElement.selectedIndex].value;
			if (brandname == "") {
				detail.innerHTML = "";
			} else {
				detail.innerHTML = brandname + " 目前共有 " + product.length
						+ " 種產品";
			}
		}
		
		
		
		$(document).ready(function() {
		      $.ajax({
		        url : "/Brands",//後臺請求的資料，用的是PHP
		        dataType : "json",//資料格式
		        type : "get",//請求方式
		        async : false,//是否非同步請求
		        success : function(data) {  //如果請求成功，返回資料。
		        var html = "";
		        for(var i=0;i<data.length;i++){  //遍歷data陣列
		            var ls = data[i];  
		            html +="<span>測試："+ls.name+"</span>";
		          }
		          $("#area").html(html); //在html頁面id=test的標籤裡顯示html內容
		        },
		      })
		    })
		
		
	</script>
<%@include file="../jspf/footer.jspf"%>
</body>
</html>