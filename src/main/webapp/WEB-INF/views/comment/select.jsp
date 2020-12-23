<%@page import="org.hibernate.query.criteria.internal.expression.function.LengthFunction"%>
<%@page import="comment.model.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- c核心 http://java.sun.com/jsp/jstl/sql標準寫法 -->
<%-- <sql:setDataSource var="ds" dataSource="jdbc/EmployeeDB" /> --%>
 <!-- ds定義是dataSource -->
<%-- <sql:query sql="select * from comment"  var="comment" dataSource="${ds}" />    --%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/comment.css" />

<title>留言紀錄</title>
</head>
<%@include file="../jspf/header.jspf"%>
<%@include file ="../jspf/commentSide.jspf" %>

<fieldset style="margin: auto;position: relative;top: 200px;width: 1200px;border: 1px solid transparent;">

		

<select name="category">
    <option selected>請選擇需要查詢的商品種類</option>
    <option value="serum">精華液</option>
    <option value="remover">卸妝水</option>
    <option value="lotion">乳液</option>
    <option value="mask">面膜</option>
    <option value="handcream">護手霜</option>
    <option value="suncream">防曬乳</option>
    <option value="water">保濕露</option>
</select>

	<h2>查詢留言紀錄</h2>
	<FORM ACTION=".\CommentController" method="Post">
  <table class="selectrecord">
<!--   	<th class="title1">id</th> -->
    <th class="title1" style="width:50px">name</th>
    <th class="title1">gender</th>
    <th class="title1">age</th>
<!--     <th class="title1">status</th> -->
    <th class="title1">commentTime</th>
    <th class="title1">contentBox</th>
    <th class="title1">update</th>
    <th class="title1" style="width:50px";>delete</th>
    
 </FORM>  
  	<!-- Select -->
   
<%--     <td class="row" style="text-align:center;">${row.id}</td> --%>
<%--  	<td class="row" style="text-align:center;">${row.name}</td> --%>
<%--     <td class="row" style="text-align:center;">${row.gender}</td> --%>
<%--     <td class="row" style="text-align:center;">${row.age}</td> --%>
<%--     <td class="row" style="text-align:center;">${row.status}</td> --%>
<%--     <td class="row" style="text-align:center;">${row.commentTime}</td> --%>
<%--     <td class="row" style="text-align:center;">${row.contentBox}</td> --%>
<%--     <td class="row" style="text-align:center;"><button style="width:auto; height:auto ;margin-top:0px;"name="update" value="${row.commentId}">更新</button></td> --%>
    
<%--     <td class="row" style="text-align:center;"><button style="width:auto; height:auto ;margin-top:0px;" name="delete" value="${row.name}">刪除</button></td> --%>
 
   <% 
   List<CommentBean> list=(List<CommentBean>)session.getAttribute("dis_board");
   System.out.println("list"+list);
   for(int i=0;i<list.size();i++){
	   
	   %>
	   <tr class="selectrecord">	
	   <FORM ACTION="${pageContext.request.contextPath}/comment/CommentController" method="Post">
	   <td class="selectrecord"><%=list.get(i).getName() %></td>
	   <td class="selectrecord"><%=list.get(i).getGender() %></td>
	   <td class="selectrecord"><%=list.get(i).getAge() %></td>
	   <td class="selectrecord"><%=list.get(i).getCommentTime() %></td>
	   <td class="selectrecord"><%=list.get(i).getContentBox() %></td>
	   <input type="hidden" name="commentId" value=<%=list.get(i).getCommentId() %>>
	   <td class="selectrecord"><button style="width:auto; height:auto ;margin-top:0px;"name="update" value=<%=list.get(i).getCommentId() %>>更新</button> </td>
	   <td class="selectrecord"><button style="width:auto; height:auto ;margin-top:0px;" name="delete" value=<%=list.get(i).getCommentId() %>>刪除</button></td>
	   </FORM>
	   </tr>
   <% }
   %>   
  </table>
  </fieldset>
</html>