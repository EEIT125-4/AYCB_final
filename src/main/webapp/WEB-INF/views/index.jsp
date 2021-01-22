<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<script src="${pageContext.request.contextPath}/js/main.js"></script>


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
		<ul class="adbox_slides">
			<li><img src="image/BIOTHERM.jpg"></li>
			<li><img src="image/ad1.jpg"></li>
			<li><img src="image/ad2.png"></li>
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

	<div class="maybelike">
		<div class="maybeliketext">你可能也喜歡</div>
		<div>
			<c:forEach var="ra" items="${racate}">
				<div class="raside">
					<div class="imgbox">
						<a
							href='<c:url value="/Detail" />?no=${ra.productno}&cate=${ra.productcategory}'>
							<img class="raimg"
							src="${pageContext.request.contextPath}/pic/${ra.imagepath}">
						</a>
					</div>
					<div class="raname">${ra.productname}</div>
					<div class="rabuttonbox">
						<div class="raprice">NT$ ${ra.productprice}</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

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

		$
				.ajax({

					//Kevin:async預設是非同步=true,但因為我們需要動態取得圖片,故要等controller將資料帶回來之後才進行,所以這邊用false,其他地方不建議 			
					async : false,
					type : "get",
					url : "${pageContext.request.contextPath}/ads",
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {

						// 				alert("get result!(輪播加工中,要手動輸入/index才會有資料,之後要改ajax動態產生)");
						console.log("轉換前:" + data);

						console.log("資料數" + data.length);

						$('#slides').empty();
						// 				$('#slides').width=200*data.length
						$('#dots').empty();

						for (let i = 0; i < data.length; i++) {
							console.log("data:" + i + data[i]);
							$('#slides')
									.append(
											"<li><a href='${pageContext.request.contextPath}/Detail/?no="
													+ data[i].productno
													+ "&cate="
													+ data[i].productcategory
													+ "'>"

													+ "<img class='adimg' src="+"${pageContext.request.contextPath}/pic/"+data[i].imagepath
			
					+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' " 
					+" ></a></li>");

							$('#dots').append(
									"<li id="+data[i].productno+"></li>");

						}

					},
					error : function() {
						alert("fail");
					}

				})

	}

	getAds();
</script>
<script src="${pageContext.request.contextPath}/js/Home.js"
	defer="defer"></script>



</html>