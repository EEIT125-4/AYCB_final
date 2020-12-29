<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< Updated upstream
<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js'></script>
=======

<!-- <script type='text/javascript' -->
<!-- 	src="http://code.jquery.com/jquery-1.9.1.js"></script> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
  $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAN4iHbCP2pOJkfPy_FogIbgD7Ac7WpvK4&callback=initMap" async defer></script>

<script>
var map, geocoder;

function initMap() {
  geocoder = new google.maps.Geocoder();
  map = new google.maps.Map(document.getElementById('map${event.eventid}'), {
    zoom: 17
  });

 // var address = '${event.eventlocation}';
  var address='國父紀念館'

  geocoder.geocode( { 'address': address}, function(results, status) {
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
}
</script>
>>>>>>> Stashed changes
<title></title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" />
</head>

<%@include file="../jspf/header.jspf"%>
<body>
<div align='center' style=' position: relative; top: 200px;'>
<h3>活動資料</h3>
<a href="<c:url value='/event/eventForm'/>">新增活動</a> &nbsp;&nbsp;&nbsp;<a href="<c:url value='/'/> " >回前頁</a>
<hr>
<form method='POST'>
	<input type='hidden' name='_method' value='DELETE'>
</form>

<c:choose>
	<c:when test="${empty events}">
	    沒有任何活動<br> 
	</c:when>
	<c:otherwise>
		<table border='1' cellpadding="3" cellspacing="1" bordercollapse="collapse" >
			<tr>
			   <th width='56'>活動編號</th>
			   <th width='140'>活動名稱</th>
			   <th width='180'>活動日期</th>
			   <th width='130'>活動地點</th>
			   <th width='64'>活動簡介</th>
			   <th width='56'>主辦人</th>
			   <th width='56'>連絡電話</th>
			   <th width='56'>人數</th>
			   <th>照片</th>
			   <th colspan='2' width='72'>資料維護</th>
			</tr>
			<c:forEach var='event' items='${events}'>
<<<<<<< Updated upstream
				<tr>
					<td style="text-align:center">${event.id}</td>
					<td>${event.name}</td>
					<td>${event.email}</td>
					<td style="text-align:center">${event.date}</td>
					<td style="text-align:right">${event.description}</td>
					<td style="text-align:center">${event.host}</td>
					<td style="text-align:center">${event.phone}</td>
					<td style="text-align:center">${event.location }</td>
					<td><img width='60' height='72' src='crm/picture/${event.id}' /></td>
					 <td><a
                        href="${pageContext.request.contextPath}/event/${event.id}">編輯</a></td>
                    <td><a class='deletelink'
                        href="${pageContext.request.contextPath}/event/${event.id}">刪除</a></td>
				</tr>
=======
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 640px">
					<div class="thumbnail" style="width: 320px; height: 600px">
						<img width='180' height='200' src='${event.filename}' />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${event.eventname}</b>
							</p>
<%-- 							<p>${event.eventid}</p> --%>
							<span><img src="${pageContext.request.contextPath}/image/icon/calendar.png" alt="">${event.eventdate}</span>
<%-- 							<p>${event.eventlocation}</p> --%>
<%-- 							<p>${event.eventdescription}</p> --%>
<%-- 							<p>${event.host}</p> --%>
<%-- 							<p>${event.hostphone}</p> --%>
<%-- 							<p>${event.pax}</p> --%>
<%-- 							<p>${event.hostphone}</p>							 --%>
                              <div>
								<a href="<c:url value='eventupdate'/>?eventid=${event.eventid}" class="btn btn-primary" style="background-color: black; border-color:black; border-radius: 0px"> 
									<span class="glyphicon-info-sigh glyphicon">編輯</span></a> 
								<a href="<c:url value='eventdelete'/>?eventid=${event.eventid}" class="btn btn-primary" style="background-color: black; border-color:black; border-radius: 0px">
									<span class="glyphicon-info-sigh glyphicon">刪除</span></a>								
								 
<%-- 								<a href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}" class="btn btn-primary"> --%>
<!-- 									<span class="glyphicon-info-sigh glyphicon">報名參加</span></a>	 -->

                              <!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" style="width: 100px; background-color: black; border-color:black; border-radius: 0px"
									data-toggle="modal" data-target="#more${event.eventid}" >詳細資料</button>
                              </div>
                             <!-- Modal -->
							<div class="modal fade" id="more${event.eventid}" tabindex="-1" role="dialog" aria-labelledby="modalLongTitle"
								aria-hidden="true">
								
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="modalLongTitle">${event.eventname}</h5>
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
												
											</div>
											<div id="map+${event.eventid}" style="width:400px ;height: 400px"></div>
											<div class="modal-footer">
											<button type="button"  style="width: 100px;"  class="btn btn-secondary" data-dismiss="modal">Close</button>
											<a href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}" class="btn btn-primary">													
											<span class="glyphicon-info-sigh glyphicon">報名參加</span></a>
													
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
>>>>>>> Stashed changes
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>
<hr>
</div>
<script type='text/javascript'>
    $(document).ready(function() {
        $('.deletelink').click(function() {
        	if (confirm('確定刪除此筆紀錄? ')) {
        		var href = $(this).attr('href');
                $('form').attr('action', href).submit();
        	} 
        	return false;
            
        });
    })
</script>
</body>
</html>