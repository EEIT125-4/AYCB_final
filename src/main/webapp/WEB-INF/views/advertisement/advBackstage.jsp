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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
<%-- <link REL=STYLESHEET HREF="${pageContext.request.contextPath}/css/inside.css" TYPE="text/css">	 --%>

<title>廣告維護後台</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file="../jspf/managerPanel.jspf"%>

<div class='rightoutbox'>
	<h1>廣告後台</h1>
	<a class="a1"
		href="${pageContext.request.contextPath}/advertisement/edit">
		<h3>新增廣告</h3>
	</a>
	<table id="myDataTable" class="display">
		<thead>
			<tr>
				<th>id</th>
				<th>標題</th>
				<th>分類</th>
				<th>開始日期</th>
				<th>結束日期</th>
				<th>播放次數</th>
				<th>狀態</th>
				<th>上傳者</th>
				<th>廠商</th>
				

			</tr>
		</thead>

		<tbody id="tbody">
		</tbody>
	</table>
</div>
</div>
</div>






<%@include file="../jspf/footer.jspf"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<!-- 	Kevin:datatable -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>


<script>
//此javascript負責抓資料
function getData(){
	
	$.ajax({
		//Kevin:等資料完成 所以用false
		async : false,
		type : "get",
		url : "${pageContext.request.contextPath}/getAds",
		contentType : "application/json; charset=utf-8",
		dataType : "json",

		success : function(data) {
			
			console.log("轉換前:" + data);

			console.log("資料數" + data.length);
			
			
			
			$('#tbody').empty();

			
			
			for (let i = 0; i < data.length; i++) {
				console.log("data:" + i + data[i].advtitle);
				
				
				$('#tbody').append(
				"<tr>"
				+"<td>"+data[i].advid+"</td>"
				+"<td>"+data[i].advtitle+"</td>"
				+"<td>"+data[i].advcategory+"</td>"
				+"<td>"+data[i].postTime+"</td>"
				+"<td>"+data[i].endTime+"</td>"
				+"<td>"+data[i].advcount+"</td>"
				+"<td>"+data[i].status+"</td>"
				+"<td>"+data[i].member.name+"</td>"
				+"<td>"+data[i].owner+"</td>"
				+"</tr>"

				);
	
			}												
			
		},
		error : function() {
			alert("fail");
		}

	})
		
		
		
		
	}
	
	getData();
	
	



</script>
<script type="text/javascript">

var table=document.getElementById("myDataTable");

        $(function () {
            $("#myDataTable").DataTable({
                searching: true, 
                columnDefs: [{
                    orderable: true,
                }]
            });
        });
    </script>
</body>


</html>