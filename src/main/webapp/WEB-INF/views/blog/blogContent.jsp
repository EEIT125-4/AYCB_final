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

<!-- <div class="mid"> -->
<%-- 	<c:set var="blog" value="${blog}" /> --%>


<!-- 	<main> -->
<!-- 		<div> -->
<%-- 		<form:form method="POST" modelAttribute="message" --%> 
<%-- 				enctype='multipart/form-data'> --%> 
<!-- 				<fieldset> -->
<!-- 					<legend><h1>瀏覽中</h1></legend> -->
<!-- 					<table> -->
<!-- 						<tr> -->
<!-- 							<td></td> -->
<%-- 							<td>${blog.getTitle()}</td> --%>
<!-- 						</tr> -->

<!-- 						<tr> -->
<!-- 							<td>上傳者</td> -->
<%-- 							<td>${blog.getMember().getName()}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>上傳時間</td> -->
<%-- 							<td>${blog.getCommentTime()}</td> --%>

<!-- 						</tr> -->
						
<!-- 						<tr> -->
<!-- 							<td>圖片預覽 -->
<!-- 							</td> -->
<!-- 							<td><img id="demo" class="preview" -->
<%-- 								src="${pageContext.request.contextPath}/pic/${blog.getPicture()}" --%>
<%-- 								alt=<c:out value='${msg.getImageid()}'/> --%>
<%-- 								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'"/> --%>
								
								
						
								

<!-- 							</td> -->
<!-- 						</tr> -->

<!-- 					</table> -->
<!-- 				</fieldset> -->

			
			
<!-- 		</div> -->
<!-- 	</main> -->
<!-- </div> -->



<!-- Blog Details Hero Begin -->
    <section class="blog-hero spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-9 text-center">
                    <div class="blog__hero__text">
<!--                     文章基本資料 -->
                        <h2>${blog.title}</h2>
                        <ul>
                            <li>文章作者:${blog.member.name}</li>
                            <li>發布時間:${blog.commentTime}</li>
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
                        <img src="${pageContext.request.contextPath}/pic/${blog.getPicture()}" alt="">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="blog__details__content">
<!--                     分享區 -->
                        <div class="blog__details__share">
                            <span>share</span>
                            <ul>
                      
                            	<li>
						<div class="line-it-button" data-lang="zh_Hant" data-type="share-c" data-ver="3" data-url="http://localhost:8080/AYCB_final/blog/${blog.blogId}" data-color="default" data-size="large" data-count="true" style="display: none;"></div>
 <script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
								
								</li>	
								
															
                                <li>
                                <iframe src="https://www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fwww.tklab.com.tw%2Fpages%2Fskincare-facial-care-use-principle&layout=button_count&size=large&appId=212518000477745&width=80&height=28" width="80" height="28" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
<!--                                 <a href="#"><i class="fa fa-facebook"></i></a> -->
                                </li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="youtube"><i class="fa fa-youtube-play"></i></a></li>
                                <li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
<!--                         內文區 -->
                        <div class="blog__details__text">
                            <textarea id="editor">${blog.reflection}</textarea>
                        </div>
<!--                         引用文章時的格式 -->
                        <div class="blog__details__quote">
                            <i class="fa fa-quote-left"></i>
                            <p>“When designing an advertisement for a particular product many things should be
                                researched like where it should be displayed.”</p>
                            <h6>_ John Smith _</h6>
                        </div>
                        
                        <div class="blog__details__text">
                            <p>Vyo-Serum along with tightening the skin also reduces the fine lines indicating aging of
                                skin. Problems like dark circles, puffiness, and crow’s feet can be control from the
                                strong effects of this serum.</p>
                            <p>Hydroderm is a multi-functional product that helps in reducing the cellulite and giving
                                the body a toned shape, also helps in cleansing the skin from the root and not letting
                                the pores clog, nevertheless also let’s sweeps out the wrinkles and all signs of aging
                                from the sensitive near the eyes.</p>
                        </div>
                        
                        
                        <div class="blog__details__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="blog__details__author">
                                        <div class="blog__details__author__pic">
                                            <img src="${pageContext.request.contextPath}/pic/${blog.getMember().getIconid()}" alt="">
                                        </div>
                                        <div class="blog__details__author__text">
                                            <h5>${blog.getMember().getName()}</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="blog__details__tags">
                                        <a href="#">#Fashion</a>
                                        <a href="#">#Trending</a>
                                        <a href="#">#2020</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
<!--                         操作區 -->
<!-- 							前後篇文章 -->
                        <div class="blog__details__btns">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <a href="" class="blog__details__btns__item">
                                        <p><span class="arrow_left"></span> 上一篇</p>
                                        <h5>It S Classified How To Utilize Free Classified Ad Sites</h5>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <a href="" class="blog__details__btns__item blog__details__btns__item--next">
                                        <p>下一篇 <span class="arrow_right"></span></p>
                                        <h5>Tips For Choosing The Perfect Gloss For Your Lips</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
<!--                         留言 -->
						<c:if test='${not empty member}'>
						
                        <div class="blog__details__comment">
                            <h4>Leave A Comment</h4>
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <input type="text" placeholder="Name">
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <input type="text" placeholder="Email">
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <input type="text" placeholder="Phone">
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <textarea placeholder="Comment"></textarea>
                                        <button type="submit" class="site-btn">Post Comment</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </c:if>
                        <c:if test='${ empty member}'>
                        <a href="${pageContext.request.contextPath}/member/login">若欲留言請先登入</a>
                        </c:if>
                        
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

<script>
	$('#file').change(function() {

		var file = $('#file')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#demo').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	

    ClassicEditor
            .create(document.querySelector('#editor'),{
            	ckfinder: {
                    uploadUrl: "${pageContext.request.contextPath}/uploadImage.do"
                }
            	
            	
            })
            .then(editor=>{
                   console.log(editor);
            })
            .catch(error=>{
                   console.error(error);
            });
	
</script>




</html>