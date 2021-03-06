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

<link href="${pageContext.request.contextPath}/css/comment.css"
	rel="stylesheet">


<title>${blog.title}</title>

<%@include file="../jspf/header.jspf"%>

<section class="breadcrumb-blog set-bg">
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
									<p>
										<span class="arrow_left"></span> 上一篇
									</p> <!-- 									<h5>It S Classified How To Utilize Free Classified Ad Sites</h5> -->
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<a
									href="${pageContext.request.contextPath}/blog/${blog.blogId+1}"
									class="blog__details__btns__item blog__details__btns__item--next">
									<p>
										下一篇 <span class="arrow_right"></span>
									</p> <!-- 									<h5>Tips For Choosing The Perfect Gloss For Your Lips</h5> -->
								</a>
							</div>
						</div>
					</div>
					<!--                         留言 -->
					<div style="width: 100%; text-align: center; background: pink;margin-bottom: 100px;min-height: 300px;">
						<c:if test='${not empty member}'>
							<div>
								<h4>留言區</h4>
							</div>

							<textarea class="comment" rows=10 placeholder="請輸入留言"></textarea>
							<div class="btnarea" style="margin-left: 50%; display: none;">
								<button class='resetBtn' type='button' style="width: fit-content; background: #111111; display: inline-block; font-size: 14px; color: #ffffff;">取消</button>
								<button class="postComment" type="button" value='${pageContext.request.contextPath}/leaveComment?key=${blog.blogId}&type=blog'
									style="width: fit-content; background: #111111; display: inline-block; font-size: 14px; color: #ffffff;">送出留言</button>

							</div>





						</c:if>

						<c:if test='${ empty member}'>
							<a href="${pageContext.request.contextPath}/member/login">若欲留言請先登入</a>
						</c:if>
					</div>

					<!-- 					留言列 -->
					<div id="board"></div>


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
<!-- 留言功能初始化 -->
	var object = "blog";
	var pk = ${blog.blogId};
	
	var board = document.getElementById("board");
	//var postUrl = path + "/leaveComment?key="+ pk+ "&type=" + object;
	var path = "${pageContext.request.contextPath}";
	var getUrl = path + "/loadComment?key=" + pk + "&type=" + object;
	var commentCount = 0;

	// 初始化結尾
</script>

<script src="${pageContext.request.contextPath}/js/comment.js"
	defer="defer" charset="utf-8"></script>


</html>