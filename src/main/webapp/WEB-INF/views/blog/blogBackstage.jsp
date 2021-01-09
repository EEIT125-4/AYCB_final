<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">

<title>網誌後台</title>
<%@include file="../jspf/header.jspf"%>


	<div>
		<h1>網誌後台</h1>
		<table>
		    <thead>
            <tr>
                <th>id</th>
                <th>上傳時間</th>
                <th>修改時間</th>
                <th>狀態列</th>
                <th>標題</th>
                <th>上傳會員</th>
                 <th>點讚次數</th>
                  <th>觀看次數</th>
                   <th>分類</th>
            </tr>
        </thead>
<%--         <c:set var="status" value="{'顯示','審核中','維護中','用戶刪除'}"/> --%>
    
     
		<c:forEach var='b' varStatus='bg' items='${blogs}'>
		<tr>		
		<td name="blogId">${b.blogId}</td>
		<td>${b.commentTime}</td>
		<td>${b.fixedtime}</td>
		<td>

			<select class="status">
			
	
			<option disabled selected>${b.status}</option>
				<option value="顯示">顯示</option>
				<option value="審核中">審核中</option>
				<option value="維護中">維護中</option>
				<option value="用戶刪除">用戶刪除</option>
			</select>
			
		</td>
		<td>${b.title}</td>
		<td>${b.member.name}</td>
		<td>${b.thumbs}</td>
		<td>${b.views}</td>	
	
		</tr>
		
		</c:forEach>
		</table>
		<div 	style="width: 600px;"><canvas id="myChart"></canvas></div>
		
		</div>
		
		
		
		<%@include file="../jspf/footer.jspf"%>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>

$(document).ready(function() {
    $(".status").change(function() { 
    	
    	var blogId=$(this).parent().siblings("td[name='blogId']").text();
//     	blog.css({"color":"red","border":"2px solid red"});
//     	var blogId=blog.text();
		var state=$(this).val();
//     	console.log($(this).val());
    	console.log("blogId="+blogId+",state="+state);
        $.ajax({
            type: "GET", //傳送方式
            url: "${pageContext.request.contextPath}/blog/adjust/", 
            dataType: "json", //資料格式
            data: { //傳送資料            	
            	"blogId":blogId,
            	"state":state                
            },
            success: function(data) {
            	swal("OK","","success");
              
            },
            error: function(data) {
            	swal("fail!","","error");
              
            }
        })
    })        
});


var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});


</script>
</body>

 

<!-- Js Plugins -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>


</html>