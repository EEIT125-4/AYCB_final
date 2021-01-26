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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<title>${video.title}</title>
<style>
.name :hover {
	color: purple;
}
</style>
</head>

<%@include file="../jspf/header.jspf"%>


<%-- <jsp:useBean id="videolist" class="video.model.Video" scope="session" /> --%>



<div class="content">
	<br> <br>



	<div class="primary"
		style="margin-left: 100px; border: none; margin: 20px">

		<h2 style="text-align: center;background-color:	#FFFFDF">${video.title}</h2>
		<hr>
		<!-- <h6 style="float:right;display:inline;"> -->
		<div class="row" style="text-align: center;">
			<div class="col-sm-4">
				<h6 style="text-align: center;">
					<i class="fa fa-thumbs-o-up fa-1g">${video.thumbsup}</i> <i
						class="fa fa-thumbs-o-down fa-1g">${video.thumbsdown }</i>
				</h6>
			</div>
			<div class="col-sm-4">
				<span class="commentdate">觀看次數：${video.viewCount}</span>
			</div>
			<div class="col-sm-4">
				<span class="commentdate">發布時間：${video.commentTime }</span>
			</div>

		</div>
		<%-- 			<div class="commentdate">發布時間：${video.commentTime }</div> --%>
		<br>
		<iframe class="videoFrame" id="frameid" src="${video.url}" autoplay
			muted frameborder="0"
			style="width: 640px; height: 360px; text-align: center; float: center"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen id='ads'></iframe>

		<div style="text-align: justify;">
			<!-- 			<span> -->
			<%-- 				<h2>${video.title}</h2> --%>
			<%-- 			</span> <span>觀看次數:${video.viewCount}</span> --%>
			<!-- 			<br> -->
			<%-- 			 <i	class="fa fa-thumbs-o-up fa-1g">${video.thumbsup}</i>  --%>
			<%-- 			 <i	class="fa fa-thumbs-o-down fa-1g">${video.thumbsdown }</i> --%>

			<%-- 			<div class="commentdate">發布時間:${video.commentTime }</div> --%>
			<p style="font-size: 20px; padding: 20px; line-height: 50px;">${video.description}</p>

		</div>

		<!-- 置頂留言功能列 -->
		<div
			style="width: 100%; background-color: whitesmoke; margin: 0 auto; padding: 20px; width: 900px; border-radius: 10px;">
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
				<textarea id='fixcomment' class="comment form-control" row="6"
					placeholder="新增公開留言" style="width: 850px; text-align: center;"></textarea>
				<div class="btnarea" style="margin-left: 50%; display: none;">
					<button class='resetBtn btn btn-outline-secondary' type='button'
						style='width: auto; margin: 10px 0px'>取消</button>
					<button class='postComment btn btn-outline-secondary'
						value='${pageContext.request.contextPath}/leaveComment?key=${video.videoId}&type=video'
						type='button' style='width: auto; margin: 10px 0px' disabled>留言</button>
					<button class='fastComment btn btn-outline-secondary' type='button'
						style='width: auto; margin: 10px 0px'>一鍵留言</button>

				</div>
			</div>
		</div>

		<div id="board"></div>



	</div>
	<div class="right_list" id="right_list"></div>

</div>
</div>




<%@include file="../jspf/footer.jspf"%>

<script>
<!-- 留言功能初始化 -->
	var object = "video";
	var pk = ${video.videoId};
	var path = "${pageContext.request.contextPath}";
	var board = document.getElementById("board");
	//var postUrl = path + "/leaveComment?key="+ pk+ "&type=" + object;
	var getUrl = path + "/loadComment?key=" + pk + "&type=" + object;
	var commentCount = 0;

	// 初始化結尾

	$(document)
			.ready(
					function() {
						var videoList = $("#right_list");
						var flag = 0;

						$
								.ajax({

									type : "GET",
									url : path + "/getRandomVideo/?num=5",//先預設產生五支影片

									datatype : 'json',

									success : function(data) {

										console.log("取得影片資料");

										for (let i = 0; i < data.length; i++) {

											videoList
													.append(

													'<div class="listBox">'
															+ '<div class="list_imageBox">'
															+ "<a href='${pageContext.request.contextPath}/video/videoWatch?videoID="
															+ data[i].videoId
															+ "'>"
															+ "<img class='video_image' src="
															+ data[i].coverUrl

															+ " onerror=javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg' "

															+ '</a>'
															+ '</div>'
															+ ' <div class="list_info">'
															+ '   <span><h5>'
															+ data[i].title
															+ '</h5></span>'
															// 		        + ' <span><h6>'+data[i].member.name+'</h6></span>'
															+ '<span><img class="headpic" src="${pageContext.request.contextPath}/pic/' + data[i].member.iconid+'"></span>'
															+ '<span class="name" style="font-size:20px;color:#007bff;">'
															+ data[i].member.name
															+ '</span>'
															+ '<br><span style="font-size:15px;color:black">觀看數：'
															+ data[i].viewCount
															+ '</span>'
															+ '<br><span style="font-size:15px;color:black">發佈時間：'
															+ formatTimeStamp(data[i].commentTime)
															+ '</span>'
															+ '</div></div>      '

													);
										}

									}

								});
					});

	$(document).on('click', '.fastComment', function() {
		console.log('快速留言');

		$('#fixcomment').val('這是一條很有價值的留言!');

	});

	//轉換時間格式
	function formatTimeStamp(time) {
		var time = new Date(time);
		var date = ((time.getFullYear()) + "-" + (time.getMonth() + 1) + "-"
				+ (time.getDate()) + " " + (time.getHours()) + ":" + (time
				.getMinutes())
		// 	               + ":" +(time.getSeconds())
		);
		return date;
	}
</script>

<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="utf-8"></script>


</body>


<!-- Js Plugins -->

</html>