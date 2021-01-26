<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<script>
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAN4iHbCP2pOJkfPy_FogIbgD7Ac7WpvK4&callback=initMap" async defer></script>
	
	
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<style>
a:link,
a:visited{
 text-decoration: none;
 color: black;
 }

</style>

<title></title>

<%@include file="../jspf/header.jspf"%>


<body>	
<div>
	
	<section class="container" style="margin-top:30px">
	
	<span style="display:inline-block; margin-bottom: 30px" >
	<form action="<c:url value='/event/showEventByCategory' />">
    <label style="font-size: 20px;text-align: left">分類搜尋活動:&nbsp;&nbsp;
	<button  style="width:100px" class="btn btn-outline-dark" name="eventcategory" value="體驗">體驗</button>
	<button  style="width:100px" class="btn btn-outline-dark" name="eventcategory" value="教學">教學</button>
	<button  style="width:100px" class="btn btn-outline-dark" name="eventcategory" value="新品發表">新品發表</button>
	<button  style="width:100px" class="btn btn-outline-dark" name="eventcategory" value="促銷">促銷</button>
	<button  style="width:100px" class="btn btn-outline-dark" name="eventcategory" value="其他">其他</button>
	</label>
	</form>
	</span>
	
	<span><button style="width:100px" class="btn btn-outline-dark">
	<a href="${pageContext.request.contextPath}/event/showEvent">所有類別</a></button></span>
	<div class="line-it-button" data-lang="zh_Hant" data-type="share-A" data-ver="3" data-url="http://localhost:8080/AYCB_final/event/showEvent" data-color="default" data-size="large" data-count="true" style="display: none;"></div>
   <script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
	
    <div class="row">
		<c:forEach var='event' items='${events}'>		
		   <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6">
                    <div class="product__item" >
                        <div class="product__item__pic set-bg"  id="resize" >
                        <img width="300px" height="250px" src="${event.filename}">
                        
                            <span class="label" id="label">New</span>
<!--                             <ul class="product__hover"> -->
<%--                                 <li><a href="#"><img src="${pageContext.request.contextPath}/image/icon/heart.png" alt=""></a></li> --%>
<%--                                 <li><a href="#"><img src="${pageContext.request.contextPath}/image/icon/compare.png" alt=""><span>Compare</span></a></li> --%>
<%--                                 <li><a href="#"><img src="${pageContext.request.contextPath}/image/icon/search.png" alt=""></a></li> --%>
<!--                             </ul> -->
                        </div>
                        <div style="text-align: center">
                        <h6>${event.eventname}</h6>
                         <span><img src="${pageContext.request.contextPath}/image/icon/calendar.png"alt="">${event.eventdate}</span><br>	
							
						<span>
						<button  value="${event.eventlocation}" data-toggle="modal" data-target="#mapdialog" style="border: none;background-color: transparent;">
						<i class='fas fa-map-marker-alt' style='font-size:16px; color:red'></i></button>
						活動地點:${event.eventlocation}</span> 
						<div style="text-align: center">
						    <input type="hidden" id="aa" class="aa" value="${member.level}"> 
<%-- 							<a id="manager" href="<c:url value='eventupdate'/>?eventid=${event.eventid}" class="btn btn-dark manager"> --%>
<!--                             <span id="manager" class="glyphicon-info-sigh glyphicon manager">編輯</span></a> -->
								
<%-- 							 <a id="manager" href="<c:url value='eventdelete'/>?eventid=${event.eventid}"class="btn btn-dark manager"> --%>
<!-- 								<span id="manager" class="glyphicon-info-sigh glyphicon manager">刪除</span></a> -->
					   <!-- Button trigger modal  -->
							<button type="button" class="btn btn-dark" value="${event.eventlocation}" style="width: 100px;" data-toggle="modal" data-target="#event${event.eventid}">詳細資料</button>
						</div> 
						<!-- Modal -->
						<div class="modal fade" id="event${event.eventid}" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalTitle">${event.eventname}</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">											
											<span aria-hidden="true">&times;</span>
											
										</button>
									</div>
									<div class="modal-body">
										<img width='180' height='200' src='${event.filename}' />
										<div class="caption">
											<p>
												<b style='font-size: 16px;'>活動名稱:${event.eventname}</b>
											</p> 
<%--  										<p>${event.eventid}</p>  --%>
 										<p>活動類別:${event.eventcategory}</p>
 										<p>活動日期:${event.eventdate}</p>
 									    <p>活動地點:${event.eventlocation}</p>
 										<p>主辦單位:${event.host}</p>
 										<p>連絡電話:${event.hostphone}</p>
 										<p>名額:${event.totalpax}</p>
 									    <p>報名人數:${event.pax}</p>
 										<p>活動介紹:${event.eventdescription}</p>	
 										</div> 
 							<div class="modal-footer"> 
 								<a id="trans" href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}&membercatcher=${member.account}&memberid=${member.id}"> 
 									<button id="attend" type="submit" class="btn btn-primary">報名參加</button>
 									</a>
 								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> 
 <%-- 												<form action="<c:url value='/event/attendanceForm'/>" id="trans"> --%> 
 <%-- 												<input type="hidden" name="eventid" value="${event.eventid}"> --%> 
 <%-- 												<input type="button" id="attend" value="報名參加" class="btn btn-primary attend${event.eventid}" style="width: 100px;"> --%> 
 <!-- 												</form> -->
							</div>
									</div>
								</div>
							</div>
						</div> 
                        </div>
                    </div>
            </div>
		

			
		</c:forEach>
		<input type="hidden" value="${check}" id="check">
	</div>

	</section>
	<div class="modal fade" id="mapdialog" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalTitle">詳細位址</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">	
										<div class="caption">											
											<div id="map" style="width: 465px; height: 500px"></div>
<%-- 											value="${event.eventid}"  --%>
										</div>
										<div class="modal-footer">
											<button type="button" style="width: 100px;"
												class="btn btn-secondary" data-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>
						</div>
</div>
<%@include file="../jspf/footer.jspf"%>
</body>
<script type="text/javascript">
   //googlemap   
	var map, geocoder;
	var mapId = "";
	$('button').click(function(){
		mapId = $(this).val();
		console.log('mapid='+mapId);
		
		console.log("wwww"+mapId);
		  geocoder = new google.maps.Geocoder();
		  map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 17
		  });
		
		var address = mapId;
		  geocoder.geocode( { 'address': address},
				  function(results, status) {
		    if (status == 'OK') {
		      map.setCenter(results[0].geometry.location);
		      var marker = new google.maps.Marker({
		          map: map,
		          position: results[0].geometry.location
		      });
		    } else {
		      console.log(status);
		    }
		  });
	});
	//判斷是否為會員
	
// 	let membercatcher = $('#membercatcher').val();
// 	console.log(membercatcher)
	
// 	$('.attend').click(function(){	
// 		if(membercatcher == ""){
// 			console.log("456")
// 			window.location.href="${pageContext.request.contextPath}/member/login";
// 		}else{
// 			console.log("789")
// 			$('#trans').submit();
// 		}
// })
	
	
	//彈跳視窗 
	$(document).ready(function() {
		console.log($('#check').val())
		if($('#check').val()=="1"){
			alert("已經報名過囉，請選擇其他活動")
		}
	});
	
	// 調整圖片大小
	$(window).bind("load", function() {
		$('#resize img').each(function() {
			var maxWidth = 300px;
			var maxHeight = 250px;
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
	
	//判斷是否為管理員
// 	$(document).ready(function() {
// 		let aa =$('.aa').val();
	
// 	 if (aa=='999'){
// 		 $('.manager').show();
// 	 }else {
// 		 $('.manager').hide();
// 	 };
		
// 	});
	
	
	
</script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</html>