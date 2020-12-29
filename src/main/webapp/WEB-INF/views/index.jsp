<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>index</title>



<!-- Css Styles -->


</head>
<%@include file="jspf/header.jspf"%>
<div class="adbox">
	<ul class="adbox_slides">
		<c:forEach var="item" varStatus='vs' items="${list}">

			<li><a href='<c:url value="/Detail" />?no=${item.productno}'><img
					src="${pageContext.request.contextPath}/pic/${item.imagepath}"
					onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
					</a></li>


		</c:forEach>
	</ul>
	<ul class="adbox_dot">
		<c:forEach var="id" varStatus='vs' items="${list}">

			<li id="${id.productno}"></li>

		</c:forEach>
	</ul>
	<div id="prevbtn" class="adbox_btn">
		<i class="fa fa-chevron-left"></i>
	</div>
	<div id="nextbtn" class="adbox_btn">
		<i class="fa fa-chevron-right"></i>
	</div>
</div>



<!--  <div class="hero__slider owl-carousel"> -->

<%--  <c:forEach var="item" varStatus='vs' items="${list}"> --%>

<%-- 			<div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath}/pic/${item.imagepath}"> --%>
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-xl-5 col-lg-7 col-md-8"> -->
<!--                             <div class="hero__text"> -->
<!--                                 <h6>Summer Collection</h6> -->
<!--                                 <h2>Fall - Winter Collections 2030</h2> -->
<!--                                 <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering -->
<!--                                 commitment to exceptional quality.</p> -->

<%--                                  <a href='<c:url value="/Detail" />?no=${item.productno}'>Shop now <span class="arrow_right"></span></a> --%>
<!--                                 <div class="hero__social"> -->
<!--                                     <a href="#"><i class="fa fa-facebook"></i></a> -->
<!--                                     <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                                     <a href="#"><i class="fa fa-pinterest"></i></a> -->
<!--                                     <a href="#"><i class="fa fa-instagram"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<%-- 		</c:forEach> --%>

<!--         </div> -->


<%@include file="jspf/footer.jspf"%>
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" -->
<!-- 	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" -->
<!-- 	crossorigin="anonymous"> -->

<!-- </script> -->


<script src="js/Home.js" defer="defer"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</body>


</html>