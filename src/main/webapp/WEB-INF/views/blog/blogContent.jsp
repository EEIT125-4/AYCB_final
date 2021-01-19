<%@page import="message.model.MessageBean"%>
<%@page import="message.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!-- 標準寫法,詳細參考網站https://www.javatpoint.com/jstl-sql-setdatasource-tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://use.edgefonts.net/arizonia:n4:default.js"
	type="text/javascript"></script>

<link href="${pageContext.request.contextPath}/css/editor.css"
	rel="stylesheet">


<title>${blog.title}</title>
 <style>
        .headpic {
            vertical-align: middle;
            border-radius: 50%;
            width: 80px;
            height: 80px;
        }
    
        .reply {
            padding: 5px 10px;
            background: #e6e6e6;
            color: #000000;
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: .1em;
            font-weight: 400;
            border-radius: 4px;
        }
    
        .commentdate {
            font-size: 15px;
            color: #589167;
        }
    
        .picform {
            width: 80px;
            float: left;
            list-style: none;
        }
    
        .leavecomment {
            border-color: grey;
            border-style: solid;
            border-width: 1px;
            width: 800px;
        }
    </style>

<!-- Google Font -->
<!--     <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" -->
<!--         rel="stylesheet"> -->

<!-- Css Styles -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"> --%>


<%@include file="../jspf/header.jspf"%>




<!-- Blog Details Hero Begin -->
<section class="breadcrumb-blog set-bg" data-setbg="${pageContext.request.contextPath}/pic/${blog.picture}">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-lg-9 text-center">
				<div class="blog__hero__text">
					<!--                     文章基本資料 -->
					<h2>${blog.title}</h2>
					<ul>
						<li>文章作者:${blog.member.name}</li>
						<li>發布時間:${blog.commentTime}</li>
						<li>編輯時間:${blog.fixedtime}</li>
						<li>瀏覽次數:${blog.views}</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Details Hero End -->

<!-- Blog Details Section Begin -->
<section class="blog-details spad">
	<div class="container">

		<div class="row d-flex justify-content-center">
		
			<!--         圖片區 -->
			<div class="col-lg-12">
				<div class="blog__details__pic">
					<img
						src="${pageContext.request.contextPath}/pic/${blog.getPicture()}"
						alt="">
				</div>
			</div>
			
			
			<div class="col-lg-8">
				<div class="blog__details__content">
					<!--                     分享區 -->
					<div class="blog__details__share">
						<span>share</span>
						<ul>

							<li>
								<div class="line-it-button" data-lang="zh_Hant"
									data-type="share-c" data-ver="3"
									data-url="http://localhost:8080/AYCB_final/blog/${blog.blogId}"
									data-color="default" data-size="large" data-count="true"
									style="display: none;"></div> <script
									src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js"
									async="async" defer="defer"></script>

							</li>


							<li><iframe
									src="https://www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fwww.tklab.com.tw%2Fpages%2Fskincare-facial-care-use-principle&layout=button_count&size=large&appId=212518000477745&width=80&height=28"
									width="80" height="28" style="border: none; overflow: hidden"
									scrolling="no" frameborder="0" allowfullscreen="true"
									allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
								<!--                                 <a href="#"><i class="fa fa-facebook"></i></a> -->
							</li>
<!-- 							<li><a href="http://twitter.com/home/?status=https://www.removal.idv.tw/article.php" class="twitter"><i class="fa fa-twitter"></i></a></li> -->
<!-- 							<li><a href="#" class="youtube"><i -->
<!-- 									class="fa fa-youtube-play"></i></a></li> -->
<!-- 							<li><a href="#" class="linkedin"><i -->
<!-- 									class="fa fa-linkedin"></i></a></li> -->
						</ul>
					</div>
					<!--                         內文區 -->
					<div class="blog__details__text">
						<p>${blog.reflection}</p>
					</div>

					<!-- 					<div class="blog__details__text"> -->
					<%-- 						<p>${blog.reflection}</p> --%>
					<!-- 					</div> -->
					<!--                         引用文章時的格式 -->
					<!-- 					<div class="blog__details__quote"> -->
					<!-- 						<i class="fa fa-quote-left"></i> -->
					<!-- 						<p></p> -->
					<!-- 						<h6>_ John Smith _</h6> -->
					<!-- 					</div> -->

					<!-- 					<div class="blog__details__text"> -->
					<!-- 						<p>Vyo-Serum along with tightening the skin also reduces the -->
					<!-- 							fine lines indicating aging of skin. Problems like dark circles, -->
					<!-- 							puffiness, and crow’s feet can be control from the strong effects -->
					<!-- 							of this serum.</p> -->
					<!-- 						<p>Hydroderm is a multi-functional product that helps in -->
					<!-- 							reducing the cellulite and giving the body a toned shape, also -->
					<!-- 							helps in cleansing the skin from the root and not letting the -->
					<!-- 							pores clog, nevertheless also let’s sweeps out the wrinkles and -->
					<!-- 							all signs of aging from the sensitive near the eyes.</p> -->
					<!-- 					</div> -->


					<div class="blog__details__option">
						<div style="font-weight: bold;">
							<h2>作者資訊</h2>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<!-- 									作者大頭貼 -->
										<img
											src="${pageContext.request.contextPath}/pic/${blog.getMember().getIconid()}"
											alt="">
									</div>
									<div class="blog__details__author__text">
										<h5>${blog.getMember().getName()}</h5>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<!-- 							作者標籤
<!-- 								<div class="blog__details__tags"> -->
								<!-- 									<a href="#">#Fashion</a> <a href="#">#Trending</a> <a href="#">#2020</a> -->
								<!-- 								</div> -->
							</div>
						</div>
						<div style="border: 1px solid #acd6ff; border-radius: 10px;">${blog.getMember().getIntroduce()}</div>
					</div>

					<!--                         操作區 -->
					<!-- 							前後篇文章 -->
					<div class="blog__details__btns">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<a
									href="${pageContext.request.contextPath}/blog/${blog.blogId-1}"
									class="blog__details__btns__item">
									<p><span class="arrow_left"></span> 上一篇</p>
										
									 <!-- 									<h5>It S Classified How To Utilize Free Classified Ad Sites</h5> -->
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<a
									href="${pageContext.request.contextPath}/blog/${blog.blogId+1}"
									class="blog__details__btns__item blog__details__btns__item--next">
									<p>下一篇 <span class="arrow_right"></span></p>
									 <!-- 									<h5>Tips For Choosing The Perfect Gloss For Your Lips</h5> -->
								</a>
							</div>
						</div>
					</div>
					<!--                         留言 -->
					<div>
					<c:if test='${not empty member}'>

						<div class="blog__details__comment">
							<h4>留個言吧</h4>
							<form id="commentform" >
<!-- 							action="#" -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-lg-4 col-md-4"> -->
<!-- 										<input type="text" placeholder="Name"> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-4 col-md-4"> -->
<!-- 										<input type="text" placeholder="Email"> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-4 col-md-4"> -->
<!-- 										<input type="text" placeholder="Phone"> -->
<!-- 									</div> -->
									<div class="col-lg-12 text-center">
									
										<textarea id="comment" placeholder="Comment"></textarea>
										<button id="postComment" type="button" class="site-btn" style="width: fit-content;" >送出留言</button>
<!-- 										onclick="postComment();" -->
										
									</div>
									
									</form>
								</div>
							</c:if>
					
					<c:if test='${ empty member}'>
						<a href="${pageContext.request.contextPath}/member/login">若欲留言請先登入</a>
					</c:if>
					</div>
					
<!-- 					留言列 -->
					<div id="board">
					
					
					
					</div>
					

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Details Section End -->


<%@include file="../jspf/footer.jspf"%>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
<!-- 	Kevin:這裡非常奇怪,header已經載入過的js失效,且必須在body末端加入才有效?? -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>


<script>
var board=document.getElementById("board");

$(document).ready(function() {
    $("#postComment").click(function() { 
    	console.log($("#comment").val());
        $.ajax({
            type: "POST", //傳送方式
            url: "${pageContext.request.contextPath}/leaveComment?memberid=${member.id}&key=${blog.blogId}&type=blog", //傳送目的地
            dataType: "json", //資料格式
            data: { //傳送資料
                "comment": $("#comment").val()
            },
            success: function(data) {
            	$("#comment").val('');
                if (data) {
                	
                	
                	swal.fire({
        				  title: "留言成功!",
        				  text: "成功",
        				  icon: "success",
        				  button: "OK",
        				});
                	
                	refresh();
                	
                } else { 
                	swal.fire({
      				  title: "留言失敗",
      				  text: "oops",
      				  icon: "error",
      				  button: "OK",
      				});
                	
                }
            },
            error: function(data) {
            	swal.fire({
    				  title: "留言失敗",
    				  text: "oops",
    				  icon: "error",
    				  button: "OK",
    				});
              
            }
        })
    })        
});

function formatTimeStamp(time){
	   var time = new Date(time);
	   var date = (
			   	   (time.getFullYear())  + "-" +
	               (time.getMonth() + 1) + "-" +
	               (time.getDate()) + " " +
	               (time.getHours()) + ":" +
	               (time.getMinutes())
// 	               + ":" +(time.getSeconds())
	              );
	   return date;
	}

function refresh(){
	
	 $.ajax({
         type: "POST", //傳送方式
         url: "${pageContext.request.contextPath}/loadComment?type=${blog.identify}&key=${blog.blogId}", //傳送目的地
         dataType: "json", //資料格式
         data: { //傳送資料
             comment: $("#comment").text()

         },

         success: function(data) {
         	
        	 console.log("取得留言!");
        	 console.log(data);  
        	 $('#board').empty();
        	 for(let i=0;i<data.comments.length;i++){
        		 
        		//因為append必須一次性加入所有成對標籤,不得已將回覆內容先存起來
                 replyContent="";
                 if(data.replys!=null){
                 for (let j = 0; j < data.replys.length; j++) {
                 		if (data.replys[j].keynumber == data.comments[i].commentId) {
                  	console.log("reply=" + data.replys[j].contentBox);
                 		replyContent+=
                 		"<p>"
                 		+"<div class='picform'>"
                 		+"<img class='headpic' src=" + path + "/pic/" + data.replys[j].member.iconid+"></div>"
                 		+ "<h5>" + data.comments[i].member.name + "</h5>"
                      + "<div class='commentdate'>" + formatTimeStamp(data.replys[j].commentTime) + "</div>"
                 		 + "<p>"+data.replys[j].contentBox + "</p></p>";
                 		}
                 		}
                  	
               
                  }
        		 
        		 
        		 console.log("加入留言");
        		 $('#board').append(  
        		 +"<p>"+i+"</p>"	 
        		 +"<div class='leavecomment'>"
			     
			     +  "<div class='picform'>"

			     +  "<img class='headpic' src="+"${pageContext.request.contextPath}/pic/"+data.comments[i].member.iconid
			     +" alt='Image placeholder'>"
			     +"</div>"
			      +"<div>"
			       +"<h3>"+data.comments[i].member.name+"</h3>"
			                +"<div class='commentdate'>"+formatTimeStamp(data.comments[i].commentTime)+"</div>"
			                +"<p>"+data.comments[i].contentBox+"</p>"
			               +"<p><a href='#' class='reply'>回覆</a></p>"
			            +"</div>"
			 
			    +"</div>"
			    +"<br>"
			    );
	 
        	 }
         },
         error: function(data) {
        	 console.log("取得失敗!");
           
         }
     })
	
}
refresh();

	
</script>




</html>