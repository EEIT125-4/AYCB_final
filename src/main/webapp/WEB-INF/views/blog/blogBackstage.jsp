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

<title>網誌後台</title>
<%@include file="../jspf/header.jspf"%>


<div>
	<h1>網誌後台</h1>
	<table id="myDataTable" class="display">
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
				<th>刪除</th>

			</tr>
		</thead>
		<%--         <c:set var="status" value="{'顯示','審核中','維護中','用戶刪除'}"/> --%>

		<tbody>
			<c:forEach var='b' varStatus='bg' items='${blogs}'>
				<tr>
					<td name="blogId">${b.blogId}</td>
					<td>${b.commentTime}</td>
					<td>${b.fixedtime}</td>
					<td><select class="status">


							<option disabled selected>${b.status}</option>
							<option value="顯示">顯示</option>
							<option value="審核中">審核中</option>
							<option value="維護中">維護中</option>
							<option value="用戶刪除">用戶刪除</option>
					</select></td>
					<td>${b.title}</td>
					<td>${b.member.name}</td>
					<td>${b.thumbs}</td>
					<td>${b.views}</td>
					<td><button class='delete_btn'>刪除</button></td>


				</tr>

			</c:forEach>
		</tbody>
	</table>
	<div style="width: 600px;">
		<canvas id="myChart"></canvas>
	</div>
	<div style="width: 600px;">
		<canvas id="myChart2"></canvas>
	</div>
</div>





<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- 		<script src="https://code.jquery.com/jquery-3.5.1.js" -->
<!-- 	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- 	Kevin:datatable -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
<script type="text/javascript">

var table=document.getElementById("myDataTable");



        $(function () {

            $("#myDataTable").DataTable({
                searching: true, 
                columnDefs: [{
//                     targets: [10],
                    orderable: true,
                }]
            });
        });
    </script>

<script>


$(document).ready(function() {
	
	var tb= document.getElementById('myDataTable');
	});
	
	
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
   				
     				swal.fire({
      				  title: "已更新",
      				  text: "狀態變更",
      				  icon: "success",
      				  button: "OK",
      				});
     				
            },
            error: function(data) {
            	
            	
            	swal.fire({
    				  title: "oops",
    				  text: "狀態未變更",
    				  icon: "error",
    				  button: "OK",
    				});
              
            }
        })
    })  ;
    //刪除blog按鈕
    $(".delete_btn").click(function() {
    
    	var blogId=$(this).parent().siblings("td[name='blogId']").text();
    	
    	
    	swal.fire({ 
    		  title: '確定刪除?', 
    		  text: '將無法恢復此筆資料', 
    		  type: 'warning',
    		  showCancelButton: true, 
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: '確定刪除', 
    		}).then(function(){
    			
    			
    			 $.ajax({
    		            type: "POST", //傳送方式
    		            url: "${pageContext.request.contextPath}/blog/delete/"+blogId, 
    		            dataType: "json", //資料格式
//     		            data: { //傳送資料            	
//     		            	"blogId":blogId,
//     		            	"state":state                
//     		            },
    		            success: function(data) {
    		            	if(data){
    		            		swal.fire({
      		      				  title: "已刪除",
      		      				  text: "狀態變更",
      		      				  icon: "success",
      		      				  button: "OK",
      		      				});
    		            		console.log("this="+$(this));
    		            		$(this).parent().parent().remove();
//     		            		var target=$(this).parent().parent();
//     		            		target.css({"color":"red","border":"2px solid red"});
    		            		
    		            	}else{
    		            		
    		            	 	swal.fire({
      		    				  title:'刪除失敗',
      		    				  text: '資料刪除過程中現異常,請聯絡管理員',
      		    				  icon: "error",
      		    				  button: "OK",
      		    				});        		
    		            	}
			   		     				
    		            },
    		            error: function(data) {
    		            	
    		            	swal.fire({
    		    				  title:'請求錯誤',
    		    				  text: 'server無回應,聯絡管理員',
    		    				  icon: "error",
    		    				  button: "OK",
    		    				});        		
  		            	}   		            	            	    		              		           
    		        })  			
    		});
    	
    });
    
    
    


var ctx = document.getElementById('myChart').getContext('2d');
var ctx2 = document.getElementById('myChart2').getContext('2d');
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
var titles=${titles};
var views=${views};
var blogJson=${blogJson};
var mTitles=[];
var mViews=[];
var colors=[];
var lines=[];

for(let i=0;i<blogJson.length;i++){
	 mTitles.push(blogJson[i].title);	
	 mViews.push(blogJson[i].views);
	 let rgb = [];
	 for (let i = 0; i < 3; i++) {
         rgb[i] = parseInt(Math.random() * 256);
//          console.log(rgb[i]);
     };
     let color="rgba("+rgb[0]+","+rgb[1]+","+rgb[2]+",0.2)";         
	 colors.push(color);
	 color="rgba("+rgb[0]+","+rgb[1]+","+rgb[2]+",1.0)";
	 lines.push(color);	 
// 	 console.log("json_title"+blogJson[i].title);
}

var chart2 = new Chart(ctx2, {
    // The type of chart we want to create
    type: 'bar',
    data: {
        //標題
        labels: mTitles,
        datasets: [{
          label: '瀏覽人次', //標籤
          data: mViews, //資料
          //圖表背景色
          backgroundColor: colors
//         	  [
//             'rgba(255, 99, 132, 0.2)',
//             'rgba(54, 162, 235, 0.2)',
//             'rgba(255, 206, 86, 0.2)',
//             'rgba(75, 192, 192, 0.2)',
//             'rgba(153, 102, 255, 0.2)',
//             'rgba(255, 159, 64, 0.2)'
//           ]
        ,
          //圖表外框線色
          borderColor: lines
//         	  [
//             'rgba(255, 99, 132, 1)',
//             'rgba(54, 162, 235, 1)',
//             'rgba(255, 206, 86, 1)',
//             'rgba(75, 192, 192, 1)',
//             'rgba(153, 102, 255, 1)',
//             'rgba(255, 159, 64, 1)'
//           ]
        ,
          //外框線寬度
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true,
              responsive: true //符合響應式
            }
          }]
        }
      }
    });
    

   
   



</script>
<script>
// var data=[];
// var titles=${titles};
// console.log("titles size"+${blogs.size()});
// titles.forEach(function(item,i){
// 	console.log("title:"+item);
	
// });

// function getTitle(){
// $.ajax({
//     type: "GET", //傳送方式
//     url: "${pageContext.request.contextPath}/blog/adjust/", 
//     dataType: "json", //資料格式

//     success: function(data) {


//     },
//     error: function(data) {
    	    	
     
//     }
// });
// }

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