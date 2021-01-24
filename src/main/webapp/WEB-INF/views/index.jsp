<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	boolean login = false;
if (session.getAttribute("member") != null) {
	MemberBean member = (MemberBean) session.getAttribute("member");
	login = true;
}
%>

<!DOCTYPE html>
<html>
<style>
.adblock:hover {
	border: red outset 3px;
}

.adimg {
	width: 200px;
	height: 200px;
	/*     border:2px green dashed; */
}

.adimg:hover {
	transform: scale(1.5, 1.5);
	/*             border:2px red dashed; */
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script>
	$(document).ready(function() {
		Topfive();
		Allstatus();
	});
</script>

<title>ALL YOU CAN BUY</title>

<!-- Css Styles -->

<%@include file="jspf/header.jspf"%>
<%-- <c:set var="projectPath" value="${pageContext.request.contextPath}" scope="application" /> --%>
<%-- <c:out value=projectpath/> --%>
<body>
<div class="wrapper">

	<!-- <div class="adbox" id="adbox"> -->
	<!-- 	<ul class="adbox_slides" id="slides"> -->

	<!-- 	</ul> -->
	<!-- 	<ul class="adbox_dot" id="dots"> -->

	<!-- 	</ul> -->
	<!-- 	<div id="prevbtn" class="adbox_btn"> -->
	<!-- 		<i class="fa fa-chevron-left"></i> -->
	<!-- 	</div> -->
	<!-- 	<div id="nextbtn" class="adbox_btn"> -->
	<!-- 		<i class="fa fa-chevron-right"></i> -->
	<!-- 	</div> -->
	<!-- </div> -->

	<div class="adbox">
		<ul class="adbox_slides"  id="adbox_slides">
			<li><img src="image/BIOTHERM0122.jpg"></li>
			<li><img src="image/olay-banner .jpg"></li>
			<li><img src="image/l_occitane0122.jpg"></li>
		</ul>
		<ul class="adbox_dot">
			<li id="1"></li>
			<li id="2"></li>
			<li id="3"></li>
		</ul>
		<div id="prevbtn" class="adbox_btn">
			<i class="fa fa-chevron-left"></i>
		</div>
		<div id="nextbtn" class="adbox_btn">
			<i class="fa fa-chevron-right"></i>
		</div>
		</div>

		<div class="line"></div>
		<div id="sellhot" class="sellhot">
		</div>


		<!-- Product Section End -->

		<!-- <div> -->
		<!--         <span> <button id="inside_ads" type="button" value="200" data-toggle="modal" data-target="#dialog2" style="width: 100px;height: 50px;" -->
		<!--                 onclick="allowClose()">顯示廣告 -->
		<!--             </button></span> -->
		<!--         <span> -->
		<!--             <button  type="button" style="width: 100px;height: 50px;" id="pop_btn">彈出視窗</button> -->
		<!--         </span> -->
		<!--     </div> -->

		<!-- 	Kevin:設定成無法直接關閉:data-backdrop="static" data-keyboard="false" -->
		<!--  <div class="modal fade" id="dialog2" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true" -->
		<!--         data-backdrop="static" data-keyboard="false"> -->
		<!--         <div class="modal-dialog" role="document"> -->
		<!--             <div class="modal-content"> -->
		<!--                 <div class="modal-header"> -->
		<!--                     <span> -->
		<!--                         <h5 class="modal-title" id="modalTitle">廣告TITLE</h5> -->
		<!--                     </span> -->
		<!--                     <span id="adText"> -->
		<!--                         <fieldset></fieldset> -->
		<!--                     </span> -->
		<!-- 再x秒後可關閉廣告 -->
		<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button> -->
		<!--                 </div style="text-align:center"> -->
		<!--                 <div class="modal-body" id="ads_content"> -->

		<!--                 </div> -->

		<!--                 <div class="modal-footer"> -->
		<!--                     <button id="close_btn" type="button" style="width: 100px;display: none;" class="btn btn-secondary" -->
		<!--                         data-dismiss="modal">Close</button> -->

		<!--                 </div> -->
		<!--             </div> -->
		<!--         </div> -->

		<!--     </div> -->
		<!--     <div> -->
		<!--   <iframe src=/AYCB_final/image/20210115100211669_b10.jpg width="300px" height="300px"></iframe> -->

		<!-- 	    </div> -->
		<!-- </div> -->
	</div>

	<%@include file="jspf/footer.jspf"%>
</body>



<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	function getAds() {
		var adbox = document.getElementById('adbox');
		$.ajax({
			//Kevin:async預設是非同步=true,但因為我們需要動態取得圖片,故要等controller將資料帶回來之後才進行,所以這邊用false,其他地方不建議 			
			async : false,
			type : "get",
			url : "${pageContext.request.contextPath}/ads",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				// alert("get result!(輪播加工中,要手動輸入/index才會有資料,之後要改ajax動態產生)");
				console.log("轉換前:" + data);
				console.log("資料數" + data.length)
				$('#slides').empty();
				// 				$('#slides').width=200*data.length
				$('#dots').empty();
					for (let i = 0; i < data.length; i++) {
					console.log("data:" + i + data[i]);
					$('#slides').append("<li><a href='${pageContext.request.contextPath}/Detail/?no="+data[i].productno+"&cate="+data[i].productcategory+"'>"
					+ "<img class='adimg' src="+"${pageContext.request.contextPath}/pic/"+data[i].imagepath
					+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' "+" ></a></li>");
					$('#dots').append("<li id="+data[i].productno+"></li>");
					}
			},
			error : function() {
				alert("fail");
			}
		})
	}
	getAds();

	//IMAGE RESIZE
	$(window).bind("load", function() {
		$('#adbox_slides img').each(function() {
			var maxWidth = 1540;
			var maxHeight = 800;
			var ratio = 0;
			var width = $(this).width();
			var height = $(this).height();
			if (width > maxWidth) {
				ratio = maxWidth / width;
				$(this).css("width", maxWidth);
				$(this).css("height", height * ratio);
				height = height * ratio;
			}
			var width = $(this).width();
			var height = $(this).height();
			if (height > maxHeight) {
				ratio = maxHeight / height;
				$(this).css("height", maxHeight);
				$(this).css("width", width * ratio);
				width = width * ratio;
			}
		});
	});
	
	function addCart(i) {
		$.ajax({
			async : true,
			type : 'GET',
			url : 'addCart',
			data : {
				"productno":i,
				"count":1
			},
			dataType : "json",
			success : function(data) {
				Swal.fire({
					  icon: 'success',
					  title: '加入購物車',
					  showConfirmButton: false,
					  timer: 1500
				})								
			}
		});
	}
	
	function Topfive() {
		$.ajax({
			type : 'GET',
			url : 'TopFive',
			dataType : "json",
			success : function(data) {
				var top = "";
				var bot = "";
				var content = "<div class='sellhottext'><img class='textimg' src='image/sellhotpro.gif'></div>";
				for(let i = 0; i<data.length; i++) {
					if(i <= 1){
						top += "<div class='topbox'><div class='toprank'>"+(i+1)+"</div><div><img src='image/top5bar1.png'></div>"
							+  "<div class='topimgbox'>"
							+  "<div class='topstatusimgbox'><img id='topstatusimg"+data[i].productno+"' class='topstatusimg'></div>"
							+  "<a id='topdetail"+data[i].productno+"' href='<c:url value="/Detail" />?no="+data[i].productno+"&cate="+data[i].productcategory+"'>"
							+  "<img class='topimg' src='${pageContext.request.contextPath}/pic/"+data[i].imagepath+"'></a></div>"
							+  "<div class='topinfo'>"
							+  "<div class='brandinfo'>"+data[i].brandname+"</div>"
							+  "<div class='proinfo'>"+data[i].productname+"</div>"
							+  "<div class='seriesinfo'>"+data[i].productseries+"</div>"
							+  "<div class='cateinfo'>"+data[i].productcategory+"</div>"
							+  "<div class='dealbox'>"
							+  "<div class='priceinfo'>NT$ "+data[i].productprice+"</div>"
							+  "<%if (login) {%>"
							+  "<div id='topbtn"+data[i].productno+"' class='btninfo' onclick='return addCart("+data[i].productno+")'><img class='btnimg' src='image/bg_cart_b.svg'></div>"
							+  "<%} else {%>"
							+  "<a id='top_a"+data[i].productno+"' class='btninfo_a' href='${pageContext.request.contextPath}/member/login'>"
							+  "<div id='topbtn"+data[i].productno+"' class='btninfo'><img class='btnimg' src='image/bg_cart_b.svg'></div></a>"
							+  "<%}%>"
							+  "</div></div></div></div>";
					}else {
						bot += "<div class='botbox'><div class='botrank'>"+(i+1)+"</div><div><img class='botrankimg' src='image/top5bar2.png'></div>"
							+  "<div class='botimgbox'>"
							+  "<div class='botstatusimgbox'><img id='botstatusimg"+data[i].productno+"' class='botstatusimg'></div>"
							+  "<a id='botdetail"+data[i].productno+"' href='<c:url value="/Detail" />?no="+data[i].productno+"&cate="+data[i].productcategory+"'>"
							+  "<img class='botimg' src='${pageContext.request.contextPath}/pic/"+data[i].imagepath+"'></a></div>"
							+  "<div class='botinfo1'>"
							+  "<div class='botbrandinfo'>"+data[i].brandname+"</div>"
							+  "<div class='botseriesinfo'>"+data[i].productseries+"</div>"
							+  "<div class='botcateinfo'>"+data[i].productcategory+"</div></div>"
							+  "<div class='botinfo2'>"
							+  "<div class='botproinfo'>"+data[i].productname+"</div>"
							+  "<div class='botdealbox'>"
							+  "<div class='priceinfo'>NT$ "+data[i].productprice+"</div>"
							+  "<%if (login) {%>"
							+  "<div id='botbtn"+data[i].productno+"' class='btninfo' onclick='return addCart("+data[i].productno+")'><img class='btnimg' src='image/bg_cart_b.svg'></div>"
							+  "<%} else {%>"
							+  "<a id='bot_a"+data[i].productno+"' class='btninfo_a' href='${pageContext.request.contextPath}/member/login'>"
							+  "<div id='botbtn"+data[i].productno+"' class='btninfo'><img class='btnimg' src='image/bg_cart_b.svg'></div></a>"
							+  "<%}%>"
							+  "</div></div></div>";
					}
				}
				$("#sellhot").html(content);
				$('#sellhot').append(top);
				$('#sellhot').append(bot);
			}
		});
	}
	
	function Allstatus() {
		$.ajax({
			type : 'GET',
			url : 'AllStatus',
			dataType : "json",
			success : function(data) {
				for (let i = 0; i < data.Products.length; i++) { 
					if(data.Products[i].productstatus == 2) {
						$('#topstatusimg' + data.Products[i].productno).attr('src', 'image/soldout.gif');
						$('#topstatusimg' + data.Products[i].productno).css('display', 'block');
						$('#topdetail' + data.Products[i].productno).removeAttr('href');
						$('#topbtn' + data.Products[i].productno).css('cursor', 'not-allowed');
						$('#topbtn' + data.Products[i].productno).removeAttr('onclick');
						$('#top_a' + data.Products[i].productno).removeAttr('href');
						
						$('#botstatusimg' + data.Products[i].productno).attr('src', 'image/soldout.gif');
						$('#botstatusimg' + data.Products[i].productno).css('display', 'block');
						$('#botdetail' + data.Products[i].productno).removeAttr('href');
						$('#botbtn' + data.Products[i].productno).css('cursor', 'not-allowed');
						$('#botbtn' + data.Products[i].productno).removeAttr('onclick');
						$('#bot_a' + data.Products[i].productno).removeAttr('href');
					}
				}
			}
		});
	}
</script>
<script src="${pageContext.request.contextPath}/js/Home.js" defer="defer"></script>
</html>