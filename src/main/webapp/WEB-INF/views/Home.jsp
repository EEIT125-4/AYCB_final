<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="member.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" /> --%>
<%-- <sql:query sql="select distinct product_category from profinal" var="rs" --%>
<%-- 	dataSource="${ds}" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!-- <script src="js/Home.js" defer="defer"></script> -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" 
 rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" 
 crossorigin="anonymous">
<title>All You Can Buy (home)</title>
</head>
<%@include file="jspf/header.jspf"%>
<div class="adbox">
	<ul class="adbox_slides">
		<li><img src="image/ad1.jpg"></li>
		<li><img src="image/ad2.png"></li>
	</ul>
	<ul class="adbox_dot">
		<li id="1"></li>
		<li id="2"></li>
	</ul>
	<div id="prevbtn" class="adbox_btn">
		<i class="fa fa-chevron-left"></i>
	</div>
	<div id="nextbtn" class="adbox_btn">
		<i class="fa fa-chevron-right"></i>
	</div>
</div>
<%@include file="jspf/footer.jspf"%>
</body>
</html>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>