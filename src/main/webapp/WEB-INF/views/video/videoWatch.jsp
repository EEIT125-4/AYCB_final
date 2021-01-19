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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/video.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css" />

<!-- social media -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<title>${video.title}</title>
<style>
</style>
</head>

<%@include file="../jspf/header.jspf"%>


<%-- <jsp:useBean id="videolist" class="video.model.Video" scope="session" /> --%>



<div class="content">
	<div class="primary">
		<iframe class="videoFrame" id="frameid" src="${video.url}" autoplay
			muted frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen id='ads'></iframe>

		<div style="text-align: justify;">
			<span>
				<h2>${video.title}</h2>
			</span> <span>觀看次數:${video.viewCount}</span><span>發布時間:xxxx</span> <i
				class="fa fa-thumbs-o-up fa-1g">${video.thumbsup}</i> <i
				class="fa fa-thumbs-o-down fa-1g">${video.thumbsdown }</i>

			<div class="commentdate">${video.commentTime }</div>

		</div>

		<!-- 置頂留言功能列 -->
		<div style="width: 100%;">
			<div id='commentCount'></div>
			<c:choose>
				<c:when test='${not empty member }'>
					<img class="headpic"
						src="${pageContext.request.contextPath}/pic/${member.iconid}">
				</c:when>
				<c:otherwise>

					<a href="${pageContext.request.contextPath}/member/login">如欲留言請先登入</a>
				</c:otherwise>
			</c:choose>

			<div>

				<!-- Kevin:需要依據使用者輸入調整textarea大小 -->
				<!--容易忘記:textarea的placeholder要發揮作用兩個textarea之間不能有空白-->

				<textarea id='comment' class="auto-height" placeholder="新增公開留言"
					cols="100" style="resize: none;"></textarea>
				<!-- onfocus="showBtnArea()" onchange="postJudgment()" -->
				<div id="btnarea" style="margin-left: 50%; display: none;">
					<!-- K:此方法暫時廢棄 onkeyup="autogrow(this);" -->
					<button id='resetBtn' type="button" style='width: auto'>取消</button>
					<button id='postComment' type='button' style='width: auto' disabled>留言</button>
				</div>
			</div>
		</div>

		<div id="board">

			<!-- 			<div class="leavecomment"> -->

			<!-- 				<div class="picform"> -->
			<!-- 					<img class="headpic" src="Images/slide1.jpg"> -->
			<!-- 				</div> -->
			<!-- 				<div> -->
			<!-- 					<h3>John Doe</h3> -->
			<!-- 					<div class="commentdate">April 12, 2020 at 1:21am</div> -->
			<!-- 					<p>請問一下有沒有賣雅漾保濕舒壓潤膚乳液，加強保濕的，還有沒有買一送一?</p> -->
			<!-- 					<p> -->
			<!-- 						<a href="#" class="reply">回覆</a> -->
			<!-- 					</p> -->
			<!-- 				</div> -->



		</div>



	</div>
	<div class="right_list" id="right_list">
<!-- 		<div class="listBox"> -->
<!-- 			<div class="list_imageBox"> -->
<!-- 				<a href=""> <img class="video_image" src="Images/slide1.jpg" -->
<%-- 					onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'"> --%>
<!-- 				</a> -->
<!-- 			</div> -->
<!-- 			<div class="list_info"> -->
<!-- 				<span> -->
<!-- 					<h5>影片標題</h5> -->
<!-- 				</span> <span> -->
<!-- 					<h6>上傳者</h6> -->
<!-- 				</span> <span> -->
<!-- 					<h6>觀看次數</h6> -->
<!-- 				</span> <span> -->
<!-- 					<h6>上傳時間</h6> -->
<!-- 				</span> -->
<!-- 			</div> -->

		</div>

	</div>
</div>




<%@include file="../jspf/footer.jspf"%>

<script>


<!-- 留言功能初始化 -->
var object = "video";
var pk = ${video.videoId};
var path = "${pageContext.request.contextPath}";
var board = document.getElementById("board");
var postUrl = path + "/leaveComment?memberid=${member.id}&key=" + pk
		+ "&type=" + object;
var getUrl = path + "/loadComment?key=" + pk + "&type=" + object;
var commentCount=0;



// 初始化結尾


// function postJudgment(){
//     if($('#comment').val.length>0)
//     {

//         $('#postComment').attr('disabled',false);
//     }

// } 
// function showBtnArea(){
   
//     $('#btnarea').css('display', 'block');

// }

// function resetComment(){
//     $('#comment').val('');
//     $('#btnarea').css('display', 'none');
//     $('#postComment').attr('disabled',true);

// }



// //Kevin:根據留言內容調整大小
// $(document).ready(function () {
// $("textarea.auto-height").css("overflow", "hidden").bind("keydown keyup", function () {
//     $(this).height('0px').height($(this).prop("scrollHeight") + 'px');
// }).keydown();

// $('#comment').focus(function(){
//    showBtnArea();

// });

// $('#comment').change(function(){

//     postJudgment();

// }) ;  

// $('#postComment').click(function() { 

//     console.log("click post");
//     resetComment();
// });

// $('#resetBtn').click(function(){

//     resetComment();


// })
// });





$(document).ready(function () {
var videoList = $("#right_list");
var flag = 0;

	$.ajax({

		type:"GET",
		url:path+"/getRandomVideo/?num=5",//先預設產生五支影片
		
		datatype:'json',

		success:function (data){
			
			console.log("取得影片資料");
			
			
			for(let i = 0; i < data.length;i++){
				
		
		    	videoList.append(
		        
		
		        '<div class="listBox">'
		        + '<div class="list_imageBox">'
		        +"<a href='${pageContext.request.contextPath}/video/videoWatch?videoID="+data[i].videoId+"'>"    
		        +"<img class='video_image' src="+data[i].coverUrl
				
					+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' " 
		        
		        +'</a>'
		        + '</div>'
		        + ' <div class="list_info">'
		        + '   <span><h5>'+data[i].title+'</h5></span>'
		        + ' <span><h6>'+data[i].member.name+'</h6></span>'
		        + '<span><h6>'+data[i].viewCount+'</h6></span>'
		        + ' <span><h6>'+data[i].commentTime+'</h6></span>'
		        + '</div></div>      '
		
		    );
		}

	}
		
});
});





  //往下捲產生內容
// $(window).scroll(function () {



//     if ($(window).scrollTop() >= $(document).height() - $(window).height() && flag<=10) {
//          console.log("增加內容");   
//          for(let i=0;i<3;i++){
//              flag+=1;
//         videoList.append(
            

//             '<div class="listBox">'
//             + '<div class="list_imageBox">'
//             +'  <a href="">'    
//             +"<img class='video_image' src="+"${pageContext.request.contextPath}/pic/"+1
			
// 			+" onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' " 
            
//             +'</a>'
//             + '</div>'
//             + ' <div class="list_info">'
//             + '   <span><h5>影片標題</h5></span>'
//             + ' <span><h6>上傳者</h6></span>'
//             + '<span><h6>觀看次數</h6></span>'
//             + ' <span><h6>上傳時間</h6></span>'
//             + '      </div>  </div>      '

//         );
//     }



        // 	$.ajax({

        // 		type:"GET",
        // 		url:"StoreGetClassStoreAjax",
        // 		data:{
        // 			....
        // 			'offset':flag
        // 		},
        // 		datatype:'json',
        // 		success:function (data){
        // 			for(var i = 0; i < data.length;i++){
        // 				context +=
        // 					產生內容
        // 		}
        // 			flag += 3;  一次產生3筆
        // 			$("#ajax").html(context);


        // 		}
        // })



//Kevin:這個方法只能長,不能縮,故不使用
//function autogrow(textarea){

//var adjustedHeight=textarea.clientHeight;
//adjustedHeight=Math.max(textarea.scrollHeight,adjustedHeight);

//if (adjustedHeight>textarea.clientHeight){

//textarea.style.height=adjustedHeight+'px';
//}else{
//// textarea.style.height=textarea.clientHeight+'px';

//}



//}
        </script>

<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="utf-8"></script>
</body>


<!-- Js Plugins -->

</html>