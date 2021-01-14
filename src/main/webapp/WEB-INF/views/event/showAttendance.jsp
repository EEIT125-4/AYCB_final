<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>

<html>
<head>


<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventpage.css">
<title>活動資料</title>

<%@include file="../jspf/header.jspf"%>

<div>

	<div class="form-inline" style="margin-bottom: 80px; margin-left: 20px;">
		
<!-- 		<dl> -->
<!-- 			<dt> -->
<!-- 				<A href="" class="btn btn-dark" style="margin: 10px"> -->
<!-- 					<button class="btn btn-dark" style="width: 120px">會員管理</button> -->
<!-- 				</A> -->
<!-- 			</dt> -->
<!-- 			<dt> -->
<!-- 				<A href="" class="btn btn-dark" style="margin: 10px"> -->
<!-- 				<button class="btn btn-dark" style="width: 120px">商品管理</button> -->
<!-- 				</A> -->
<!-- 			</dt> -->
<!-- 			<dt> -->
<!-- 				<A href="" class="btn btn-dark" style="margin: 10px"> -->
<!-- 					<button class="btn btn-dark" style="width: 120px">訂單管理</button> -->
<!-- 				</A> -->
<!-- 			</dt> -->
<!-- 			<dt> -->
<!-- 				<a href="" class="btn btn-dark" style="margin: 10px"> -->
<!-- 					<button class="btn btn-dark" style="width: 120px">討論區管理</button> -->
<!-- 				</a> -->
<!-- 			</dt> -->
<!-- 			<dt> -->
<!-- 				<button class="btn btn-dark" style="width: 120px" id="eventmanager">活動管理</button> -->
<!-- 			</dt> -->
<!-- 		</dl> -->
		<div>
			<div>
			<ul class="nav nav-tabs"> 
					<li class="nav-item">
<!-- 					<a class="nav-link active" href=""> -->
					<button class="nav-link" style="width: 120px; background: none;border: 0px" id="eventmanager">所有參加者</button>
<!-- 					</a> -->
					</li>
					<li class="nav-item">
<%-- 					<a class="nav-link" href="${pageContext.request.contextPath}/event/ajaxShowEvent" id="showallevent"> --%>
					<button class="nav-link" style="width: 120px; background: none;border: 0px" id="showallevent">所有活動</button>
<!-- 					</a>						 -->
					</li>
			</ul> 
    			<table class='table table-borderless table-dark'  id ="insertdata">

    			</table>
    	</div>				

<%-- 				<c:choose> --%>
<%-- 					<c:when test='${empty attendances}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     --%>
<!-- 		查無報名資料<br> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<table class="table table-borderless table-dark"> -->
<!-- 							<tr> -->
<!-- 								<td>帳號</td> -->
<!-- 								<td>活動名稱</td> -->
<!-- 								<td>mail</td> -->
<!-- 								<td>電話號碼</td> -->
<!-- 								<td>參加人數</td> -->
<!-- 								<td colspan="2">修改報名資料</td> -->

<!-- 							</tr> -->
<%-- 							<c:forEach var='Attendance' varStatus='vs' items='${attendances}'> --%>
<!-- 								<tr> -->
<%-- 									<td>${Attendance.member.account}</td> --%>
<%-- 									<td>${Attendance.event.eventname}</td> --%>
<%-- 									<td>${Attendance.mailaddress}</td> --%>
<%-- 									<td>${Attendance.phone}</td> --%>
<%-- 									<td>${Attendance.pax}</td> --%>

<!-- 									<td><a -->
<%-- 										href="<c:url value='update'/>?aid=${Attendance.aid}">編輯</a></td> --%>
<!-- 									<td><a -->
<%-- 										href="<c:url value='delete'/>?aid=${Attendance.aid}">刪除</a></td> --%>
<!-- 								</tr> -->

<%-- 							</c:forEach> --%>
<!-- 						</table> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->


		</div>
	</div>

</div>

<%@include file="../jspf/footer.jspf"%>
</body>
<script type='text/javascript'>
     	  
  $('#eventmanager').click(function() {  
 	  $.ajax({ 
 		 async : false,
    	  url : "ajaxShowAttendance", 
    	  dataType : "json",
		  contentType : "application/json;charset=utf-8", 
       success : function(data){
    	   console.log(data.lenth);
   			var insertData = "";
   			insertData ="<tr>" 
				+"<td>帳號</td>" 
				+"<td>活動名稱</td>" 
				+"<td>mail</td>" 
				+"<td>電話號碼</td>" 
				+"<td>參加人數</td>" 
				+"<td colspan='2'>修改報名資料</td>"
				+"</tr>"
   			for (let i = 0; i < data.length; i++) {
   				insertData += 	"<tr>" 
    										+"<td>"+data[i].member.account+"</td>" 
    										+"<td>"+data[i].event.eventname+"</td>" 
    										+"<td>"+data[i].mailaddress+"</td>" 
    										+"<td>"+data[i].phone+"</td>" 
    										+"<td>"+data[i].pax+"</td>" 
                                         +"<td><a href='<c:url value='update'/>?aid="+data[i].aid+"'>編輯</a> |  " 
                                         +"<a href='<c:url value='delete'/>?aid="+data[i].aid+"'>刪除</a></td>" 
                                         +"</tr>" 
    				console.log(insertData);  			
   			}
   				$("#insertdata").html(insertData);
		  
 	  }
        	

         })  
  }) 
  
   $('#showallevent').click(function() {  
 	  $.ajax({ 
 		 async : false,
    	  url : "ajaxShowEvent", 
    	  dataType : "json",
		  contentType : "application/json;charset=utf-8", 
       success : function(data){
    	   console.log(data.lenth);
   			var insertData = "";
   			insertData ="<tr>" 
				+"<td>活動ID</td>" 
				+"<td>活動圖片</td>" 
				+"<td>活動名稱</td>" 
				+"<td>日期</td>" 
				+"<td>地點</td>" 
				+"<td>主辦人</td>" 
				+"<td>連絡電話</td>" 
				+"<td>活動敘述</td>" 
				+"<td>可報名人數</td>" 
				+"<td colspan='2'>修改活動資料</td>"
				+"</tr>"
   			for (let i = 0; i < data.length; i++) {
   				insertData += 	"<tr>" 
    										+"<td><a href='<c:url value='showAllAttendanceByEvent'/>?eventid="+data[i].eventid+"'>"+data[i].eventid+"</a></td>" 
    										+"<td><img width='180' height='200' src="+data[i].filename+"/></td>" 
    										+"<td>"+data[i].eventname+"</td>" 
    										+"<td>"+data[i].eventdate+"</td>" 
    										+"<td>"+data[i].eventlocation+"</td>" 
    										+"<td>"+data[i].host+"</td>" 
    										+"<td>"+data[i].hostphone+"</td>" 
    										+"<td>"+data[i].eventdescription+"</td>" 
    										+"<td>"+data[i].pax+"</td>" 
                                            +"<td><a href='<c:url value='eventupdate'/>?eventid="+data[i].eventid+"'>編輯</a> |  " 
                                            +"<a href='<c:url value='eventdelete'/>?eventid="+data[i].eventid+"'>刪除</a></td>" 
                                         +"</tr>" 
    				console.log(insertData);  			
   			}
   				$("#insertdata").html(insertData);
		  
 	  }
        	

         })  
  }) 
</script>
</html>