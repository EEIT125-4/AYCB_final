<%@page import="org.hibernate.graph.CannotContainSubGraphException"%>
<%@page import="blog.model.Blog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta charset="UTF-8">
<title>部落格上傳</title>
<style>

.updateform {
	top:100px;
	margin: auto;
	text-align: center;
	width: 80%;
	border: 1px inset brown;
	border-radius: 10px;
}


.preview {
	width: 200px;
	height: 200px;
	background-size: cover;
}

</style>

</head>


  <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/editor.css" rel="stylesheet">
    




<%@include file="../jspf/header.jspf"%>



<!-- 	Breadcrumb Section Begin -->
	<section class="breadcrumb-blog set-bg"
		data-setbg="${pageContext.request.contextPath}/image/blog_backgroundjpg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>文章撰寫</h2>
				</div>
			</div>
		</div>
	</section>
<!-- 	Breadcrumb Section End -->

<div style="text-align: center;">

<% Blog blog=(Blog)session.getAttribute("bg"); 
	
%>
	<form:form method="POST" modelAttribute="blog" enctype='multipart/form-data'>
<%-- 	<form:input path="thumbs" type="hidden" value="<%=(blog.getThumbs()!=null && blog.getThumbs()>0)?String.valueOf(blog.getThumbs()):0%>" /> --%>
		 
<%-- 	 <form:input path="views" type="hidden" value="<%=(blog.getViews()!=null && blog.getViews()>0)?String.valueOf(blog.getViews()):0 %>"/> --%>
	 <form:input path="identify" type="hidden" value="blog"/>
	 
	 
	 
		<fieldset class="updateform">
			<legend class="title">部落格文章上傳</legend>
			<p>
				<label class="t1" for="">上傳者:</label>
				<form:input type="text" path="member" value="${member.name}" disabled='true' />
			</p>
<!-- 			<p> -->
<!-- 				<label for="blogCategory" class="t1">文章分類:</label>  -->
<%-- 				<form:input type="text" path="blogCategory" id="blogCategory"/> --%>
<%-- 				<form:select path="blogCategory" id="category"> --%>
<%-- 					onchange="alert(this.options[this.selectedIndex].text)" --%>
<%-- 					<form:option value="" disabled selected hidden>選擇類別</form:option> --%>
					
<%-- 					<form:option value="保養教學">保養教學</form:option> --%>
<%-- 					<form:option value="美照分享">美照分享</form:option> --%>
<%-- 					<form:option value="心得隨筆">心得隨筆</form:option> --%>

<%-- 			</form:select> --%>
				
<!-- 			</p> -->
<!-- 			文章封面 -->
			<p>
			
			<img id="demo" class="preview" name="icon"
								src=<c:if test='${not empty blog.picture}'>
							<c:out value="${pageContext.request.contextPath}/pic/${blog.picture}"/>
							
							</c:if>
								<c:if test='${empty blog.picture}'>
							<c:out value=""/>
							</c:if>
								alt=<c:out value='${blog.title}'/>
								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
							
				
				<label for="file" style="font-weight: bold; font-size: 20px;margin-left:0px;margin-bottom:20px">上傳封面照</label>
				<input type="file" name="file" id="file" style="font-size:15px"/>	
			
			</p>
			
			<p>
				<label for="" class="t1">文章標題:</label> 
				<form:input type="text" id="title" name="title" path="title" value="${title}"/>
			</p>
			
			
			<label for="reflection">文章內文:</label>
		
			 <div class="blog__details__text">
                            <form:textarea id="editor"  path="reflection"/>
                       </div>
			
			
			
			<!--隱藏選項共4個 -->
	

			

			<p>
				<input type="hidden" name="memberID" value="${member.id}"/>
			</p>
		
			<input type="submit" name="confirmupdate" value="送出">

		</fieldset>
	</form:form>
</div>
<%@include file="../jspf/footer.jspf"%>

    	<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
	
<script>
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
<script>
$('#file').change(function() {

	var file = $('#file')[0].files[0];
	var reader = new FileReader;
	reader.onload = function(e) {
		$('#demo').attr('src', e.target.result);
	};
	reader.readAsDataURL(file);
});
</script>

</body>
</html>