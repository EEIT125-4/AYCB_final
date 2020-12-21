  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content='3; url=DisplayBoard.jsp' http-equip='refresh'  >
<link rel="stylesheet" href="../css/comment.css" />
<%@include file="../jspf/header.jspf"%>
<title>留言未完成</title>
<script>
window.alert("請重新留言,3秒後跳轉至留言介面");
// setTimeout("location.href=select", 3000);
setTimeout(function(){location.href="select"} , 3000);  
</script>

</head>
<form class="arrow_box">
請重新留言!
</form>

</body>
</html>