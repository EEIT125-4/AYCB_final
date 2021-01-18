<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>
				<c:choose>
					<c:when test='${empty events}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
		查無報名資料<br>
					</c:when>
					<c:otherwise>
						<table class="table table-borderless table-dark">
							<tr>
								<td>活動ID</td>
				<td>活動圖片</td> 
				<td>活動名稱</td> 
				<td>日期</td>
				<td>地點</td>
				<td>主辦人</td>
				<td>連絡電話</td>
				<td>活動敘述</td> 
				<td>名額</td> 
				<td>報名人數</td> 
				<td colspan='2'>修改活動資料</td>
				</tr>
							<c:forEach var='event' varStatus='vs' items='${events}'>
								<tr>
									<td><a href="<c:url value='showAllAttendanceByEvent'/>?eventid=${event.eventid}">${event.eventid}</a></td> 
    										<td><img width='180' height='200' src='${event.filename}'/></td> 
    										<td>${event.eventname}</td> 
    										<td>${event.eventdate}</td>
    										<td>${event.eventlocation}</td>
    										<td>${event.host}</td>
    										<td>${event.hostphone}</td> 
    										<td>${event.eventdescription}</td> 
    										<td>${event.totalpax}</td> 
    										<td>${event.pax}</td> 
                                            <td><a href="<c:url value='eventupdate'/>?eventid=${event.eventid}">編輯</a> |   
                                           <a href="<c:url value='eventdelete'/>?eventid=${event.eventid}">刪除</a></td> 
                                         </tr> 

							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
</body>
</html>