<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type='text/javascript'
	src="http://code.jquery.com/jquery-1.9.1.js"></script>
	
<title></title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	
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
							<p><b style='font-size: 16px;'>${event.eventname}</b></p>
							<p>${event.eventid}</p>
							<p>活動日期:${event.eventdate}</p>
							<p>${event.eventlocation}</p>
							<p>${event.eventdescription}</p>
							<p>${event.host}</p>
							<p>${event.hostphone}</p>
							<p>${event.pax}</p>
							<p>${event.hostphone}</p>
							<p>
							<a href="<c:url value='eventupdate'/>?eventid=${event.eventid}" class="btn btn-primary">
							<span class="glyphicon-info-sigh glyphicon">編輯</span></a>
							<a href="<c:url value='eventdelete'/>?eventid=${event.eventid}" class="btn btn-primary">
							<span class="glyphicon-info-sigh glyphicon">刪除</span></a>
							<a href="<c:url value='/event/attendanceForm'/>?eventid=${event.eventid}" class="btn btn-primary">
							<span class="glyphicon-info-sigh glyphicon">報名參加</span></a>	
							</p>
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