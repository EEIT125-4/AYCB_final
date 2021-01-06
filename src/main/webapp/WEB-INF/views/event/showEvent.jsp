<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script type='text/javascript' -->
<!-- 	src="http://code.jquery.com/jquery-1.9.1.js"></script> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
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

<title></title>

<%@include file="../jspf/header.jspf"%>

<div style="text-align: center">
	<h3>活動資料</h3>
	<a href="<c:url value='/event/eventForm'/>">新增活動</a> &nbsp;&nbsp;<a
		href="<c:url value='/'/> ">回前頁</a>

	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>
	<section class="container">
	<div class="row">
		<c:forEach var='event' items='${events}'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
				<div class="thumbnail" style="width: 320px; height: 360px">
					<img width='180' height='200' src='${event.filename}' />
					<div class="caption">
						<p>
							<b style='font-size: 16px;'>${event.eventname}</b>
						</p>
						<span>
						<img src="${pageContext.request.contextPath}/image/icon/calendar.png"alt="">							
							${event.eventdate}</span><br>
						<span>
						<button  value="${event.eventlocation}" data-toggle="modal" data-target="#mapdialog" style="border: none;background-color: transparent;">
						<i class='fas fa-map-marker-alt' style='font-size:16px; color:red'></i></button>
						活動地點:${event.eventlocation}</span>


						<div>
						    <input type="hidden" id="aa" class="aa" value="${member.level}"> 
							<a id="manager" href="<c:url value='eventupdate'/>?eventid=${event.eventid}" class="btn btn-primary manager"								
								style="background-color: black; border-color: black; border-radius: 0px">
                            <span id="manager" class="glyphicon-info-sigh glyphicon manager">編輯</span></a>
								
							 <a id="manager" href="<c:url value='eventdelete'/>?eventid=${event.eventid}"
								class="btn btn-primary manager"
								style="background-color: black; border-color: black; border-radius: 0px">
								<span id="manager" class="glyphicon-info-sigh glyphicon manager">刪除</span>
							</a>

							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary"
								value="${event.eventlocation}"
								style="width: 100px; background-color: black; border-color: black; border-radius: 0px"
								data-toggle="modal" data-target="#event${event.eventid}">詳細資料</button>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="event${event.eventid}" tabindex="-1"
							role="dialog" aria-labelledby="modalTitle" aria-hidden="true">

							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalTitle">${event.eventname}</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<img width='180' height='200' src='${event.filename}' />



										<div class="caption">
											<p>
												<b style='font-size: 16px;'>${event.eventname}</b>
											</p>
											<p>${event.eventid}</p>
											<p>活動日期:${event.eventdate}</p>
											<p>${event.eventlocation}</p>
											<p>${event.eventdescription}</p>
											<p>${event.host}</p>
											<p>${event.hostphone}</p>
											<p>${event.pax}</p>
											<p>${event.hostphone}</p>
<%-- 											<div id="map" value="${event.eventid}" style="width: 465px; height: 500px"></div> --%>
										</div>
										<div class="modal-footer">
											<button type="button" style="width: 100px;"
												class="btn btn-secondary" data-dismiss="modal">Close</button>

												<form action="<c:url value='/event/attendanceForm'/>" id="trans">
												<input type="hidden" name="eventid" value="${event.eventid}">
												<button type="button" id="attend" class="btn btn-primary attend" style="width: 100px;">報名參加</button>
												</form>
												
<%-- 												<a id="trans" href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}"> --%>
<!-- 												<button id="attend" type="submit" class="btn btn-primary" style="width: 100px;">報名參加</button></a>  -->
											<input type="hidden" id="membercatcher" value="${member}"> 

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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
<script>
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
	
	let membercatcher = $('#membercatcher').val();
	console.log(membercatcher)
	
	$('.attend').click(function(){
		if(membercatcher == ""){
			window.location.href="${pageContext.request.contextPath}/member/login";
		}else{
			$('#trans').submit();
		}
	})
	
	//判斷是否為管理員
	let aa =$('.aa').val();
	
	 if (aa=='999'){
		 $('.manager').show();
	 }else {
		 $('.manager').hide();
	 }
	  
	
	
	
</script>


</html>