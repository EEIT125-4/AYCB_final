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
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css"> -->

<head>
<meta charset="UTF-8">
<meta name="description" content="blog">
<meta name="keywords" content="blog, article, share, write">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>


/*停權開關*/
.switch {
position: relative;
display: inline-block;
width: 50px;
height: 24px;
}

.switch input {
opacity: 0;
width: 0;
height: 0;
}

.slider {
position: absolute;
cursor: pointer;
top: 0;
left: 0;
right: 0;
bottom: 0;
background-color: #ccc;
-webkit-transition: .4s;
transition: .4s;
border-radius: 34px;
}

.slider:before {
/* 未開顏色 */
position: absolute;
content: "";
height: 20px;
width: 20px;
left: 2px;
top: 2px;
background-color: white;
-webkit-transition: .4s;
transition: .4s;
border-radius: 50%;
}

input:checked + .slider {
/* 以開顏色 */
background-color: lightpink;
}

input:checked + .slider:before {
/* 按鈕顏色 */
-webkit-transform: translateX(26px);
-ms-transform: translateX(26px);
transform: translateX(26px);
}
</style>




<title>會員後台管理</title>
<%@include file="../jspf/header.jspf"%>




    <table id="myDataTable" class="table" style="width:1600px;margin-left:180px">
        <thead class="thead-light">
          <tr>
            <th scope="col">會員ID</th>
            <th scope="col">名稱</th>
            <th scope="col">帳號</th>
            <th scope="col">信箱</th>
            <th scope="col">手機</th>
            <th scope="col">生日</th>
            <th scope="col">地址</th>
            <th scope="col">權限</th>
<!--             <th scope="col">刪除</th> -->
          </tr>
        </thead>
        <tbody>
        
        <c:forEach var="member" items='${memberBackstage}'>
          <tr>         
            <th scope="row">${member.id}</th>
            <td>${member.name}</td>
            <td >${member.account}</td>
            <td>${member.email}</td>
            <td>${member.phone}</td>
            <td>${member.birth}</td>
            <td>${member.address}</td>
            <td>
           <label class="switch"> 
           <input type="checkbox"> 
           <span class="slider" checkType="${member.ckpower}"></span>
				</label>
				</td>
<%-- 			<td><form id="delete" action="<c:url value="delete" />"><button type=button id=checkde  >刪除</button> --%>
<%-- 			<input type=hidden id=check name=delete value="${member.id}"> --%>
<!-- 			</form></td> -->
                      </tr>
        </c:forEach>
       
        
        </tbody>
      </table>







<c:if test="${not empty member }">

</c:if>



<%@include file="../jspf/footer.jspf"%>
<!-- <script type="text/javascript" charset="utf8" -->
<!-- 	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script> -->





<script type="text/javascript">

// var table=document.getElementById("myDataTable");



//         $(function () {

//             $("#myDataTable").DataTable({
//                 searching: true, 
//                 columnDefs: [{
// //                     targets: [10],
//                     orderable: true,
//                 }]
//             });
//         });
<!--     </script> -->


<!-- <script> -->
// 	function refreshData() {

// 		console.log("更新Data")

// 		$.ajax({

// 			type : 'post',
// 			url : "forgot",
// 			datatype : "text",
// 			data : {
// 				"email" : email
// 			},
// 			//		      		contentType : "application/json;charset=utf-8",

// 			success : function(data) {

// 				if (data == "ok") {
// // 					swal("密碼重置", "已寄送新密碼至您信箱", "success")

// 				} else {

// // 					swal("發生錯誤", "寄送過程發生錯誤,請稍後再試或撥打客服電話", "error")

// 				}

// 			},
// 			error : function() {
// 				swal("更新資料失敗","controller error","error");

// 			}
// 		})

// 	}
	
	
	<script>

    $(document).ready(function(){	
		$(".slider").each(function(){
		if($(this).attr("checktype") == 'true'){
		$(this).click();
		}
		$(this).click(function(){
		let s = $(this);
		$.ajax({
		url:"ckpower2",
		data:{
		'id':  s.parent().parent().parent().children('th').eq(0).html() },
		type:"POST",
		success:function(){
		if(s.attr("checktype") == 'true'){
		s.attr("checktype", "false");
		}
		else{
		s.attr("checktype", "true");
		}
		}
		})
		})
		})
})


// 	$('#checkde').click(function(){
// 		alert("確定");
// 		$('#delete').submit();
// 	}






	
	
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