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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
  $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
</script>
<title></title>
</head>

<%@include file="../jspf/header.jspf"%>
<body>
	<div style="text-align: center">
			<h3>活動資料</h3>
			<a href="<c:url value='/event/eventForm'/>">新增活動</a>
			&nbsp;&nbsp;<a href="<c:url value='/'/> ">回前頁</a>
			
			<form method='POST'>
				<input type='hidden' name='_method' value='DELETE'>
			</form>
<!-- <section class="blog spad"> -->
<!-- <div class="container"> -->
<!-- <div class="row"> -->
<%-- <c:forEach var='event' items='${events}'> --%>
<!--                 <div class="col-lg-4 col-md-6 col-sm-6"> -->
<!--                     <div class="blog__item"> -->
<%--                         <div class="blog__item__pic set-bg" data-setbg='${event.filename}'></div> --%>
<!--                         <div class="blog__item__text"> -->
<%--                             <span><img src='${event.filename}' alt=""> 16 February 2020</span> --%>
<%--                             <h5>${event.eventname}</h5> --%>
<!--                             <a href="#">Read More</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--       </div> -->
<%--  </c:forEach>                --%>
<!-- </div>                 -->
<!-- </div> -->
<!-- </section>		 -->

<section class="container" >
		<div class="row">
			<c:forEach var='event' items='${events}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 640px">
					<div class="thumbnail" style="width: 320px; height: 600px">
						<img width='180' height='200' src='${event.filename}' />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${event.eventname}</b>
							</p>
<%-- 							<p>${event.eventid}</p> --%>
							<p>活動日期:${event.eventdate}</p>
<%-- 							<p>${event.eventlocation}</p> --%>
<%-- 							<p>${event.eventdescription}</p> --%>
<%-- 							<p>${event.host}</p> --%>
<%-- 							<p>${event.hostphone}</p> --%>
<%-- 							<p>${event.pax}</p> --%>
<%-- 							<p>${event.hostphone}</p>							 --%>
								<a href="<c:url value='eventupdate'/>?eventid=${event.eventid}" class="btn btn-primary"> 
									<span class="glyphicon-info-sigh glyphicon">編輯</span></a> 
								<a href="<c:url value='eventdelete'/>?eventid=${event.eventid}" class="btn btn-primary">
									<span class="glyphicon-info-sigh glyphicon">刪除</span></a>								
								 
<%-- 								<a href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}" class="btn btn-primary"> --%>
<!-- 									<span class="glyphicon-info-sigh glyphicon">報名參加</span></a>	 -->

								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" style="width: 100px;"
									data-toggle="modal" data-target="#more${event.eventid}" >詳細資料</button>

								<!-- Modal -->
							<div class="modal fade" id="more${event.eventid}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLongTitle"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLongTitle">${event.eventname}</h5>
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
			</c:forEach>
		</div>
</section>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${empty events}"> 沒有任何活動<br></c:when>    --%>
				
<%-- 				<c:otherwise> --%>
<!-- 					<table border='1' cellpadding="3" cellspacing="1" > -->
						
<!-- 						<tr> -->
<!-- 							<th width='56'>活動編號</th> -->
<!-- 							<th width='140'>活動名稱</th> -->
<!-- 							<th width='180'>活動日期</th> -->
<!-- 							<th width='130'>活動地點</th> -->
<!-- 							<th width='64'>活動簡介</th> -->
<!-- 							<th width='56'>主辦人</th> -->
<!-- 							<th width='56'>連絡電話</th> -->
<!-- 							<th width='56'>人數</th> -->
<!-- 							<th>照片</th> -->
<!-- 							<th colspan='2' width='72'>資料維護</th> -->
<!-- 						</tr> -->
<%-- 						<c:forEach var='event' items='${events}'> --%>
<!-- 							<tr> -->
<%-- 								<td style="text-align: center">${event.eventid}</td> --%>
<%-- 								<td style="text-align: center">${event.eventname}</td> --%>
<%-- 								<td style="text-align: center">${event.eventdate}</td> --%>
<%-- 								<td style="text-align: center">${event.eventlocation}</td> --%>
<%-- 								<td style="text-align: right">${event.eventdescription}</td> --%>
<%-- 								<td style="text-align: center">${event.host}</td> --%>
<%-- 								<td style="text-align: center">${event.hostphone}</td> --%>
<%-- 								<td style="text-align: center">${event.pax}</td> --%>
<%-- 								<td><img width='60' height='72' src='${event.filename}' /></td> --%>

<!-- 								<td> -->
<%-- 								<a href="<c:url value='eventupdate'/>?eventid=${event.eventid}">編輯</a> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 								<a href="<c:url value='eventdelete'/>?eventid=${event.eventid}">刪除</a> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</table> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- <div> -->
<%-- 			<a href="<c:url value='/event/eventForm'/>">新增活動</a> --%>
<%-- 			&nbsp;&nbsp;&nbsp;<a href="<c:url value='/'/> ">回前頁</a> --%>
<!-- 			</div> -->
		</div>
	</div>

 	
	<%@include file="../jspf/footer.jspf"%>
</body>
</html>