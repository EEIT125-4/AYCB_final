<%@page import="message.model.MessageBean"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.RowSet"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!-- 標準寫法,詳細參考網站https://www.javatpoint.com/jstl-sql-setdatasource-tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	boolean editable = false;
if (session.getAttribute("member") != null) {

	MemberBean member = (MemberBean) session.getAttribute("member");
	String userName = member.getName();

	System.out.println("msgPage got user" + userName);

	editable = true;

}
List<MessageBean> list = (List<MessageBean>) request.getAttribute("allMessage");

List<String> types = new ArrayList<>();
types = (List<String>) request.getAttribute("types");
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://use.edgefonts.net/arizonia:n4:default.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/message.css">
<title>MsgPage</title>
<style>
.reply {
	border: 1px solid black;
	border-radius: 15px;
	background-color: gray;
}
</style>
</head>

<%@include file="../jspf/header.jspf"%>

<div class="mid">
	<aside id="left">
		<ul class="mid_ul">
			<li class="mid_ul_li"><a href="<c:url value='/message/new'/>">新增訊息</a></li>
			<li class="mid_ul_li"><select name="type" id="type"
				class="msgTypes">
					<%--onchange="alert(this.options[this.selectedIndex].text)" --%>
					<option value="" disabled selected hidden>選擇訊息類別</option>
					<!-- 					<option value="">All</option> -->
					<%--disabled selected hidden --%>
					<%--
						for (String type : types) {
					--%>
					<%-- 					<option value="<%=type%>"><%=type%></option> --%>

					<%--
						} ;
					--%>

			</select></li>
			<li class="mid_ul_li"><select name="sort" id="sort">
					<option value="" disabled selected hidden>依時間排序
						<%--sql_sort--%></option>
					<option value="">All</option>
					<%--disabled selected hidden --%>
					<option value="asc">舊到新</option>
					<option value="desc">新到舊</option>


			</select></li>
			<li class="mid_ul_li"><select name="count" id="count">
					<option value="" disabled selected hidden>訊息筆數
						<%--sql_count --%></option>
					<option value="">All</option>
					<%--disabled selected hidden --%>
					<option value="top 5">顯示5筆</option>
					<option value="top 10">顯示10筆</option>
					<option value="top 50">顯示50筆</option>
			</select></li>
		</ul>
		<input title="檢查內文時不檢查上面條件" id="word" type="text" name="word"
			placeholder="內容搜尋" style="width: 145px">
		<%--onfocus="alert('HI')" --%>

		<input type="button" value="篩選訊息" onclick="search()"> <br>
		<!-- 實際跳轉交給javascript處理 -->
		<a href="" onclick="checkLogin()">查看訂閱設定</a>
		<br>
				<button onclick="sendEmail()">發送email</button>


	</aside>

	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<form action="<c:url value='/message/update_step'/>" method="post">
		<article class="article">
			<h3 name="title" class="t1"><%=list.get(i).getTitle()%></h3>
			<h4 name="type" class="t2"><%=list.get(i).getType()%></h4>

			<input type="hidden" name="id" value=<%=list.get(i).getId()%>>

			<input class="editbtn" type=<%=(editable) ? "submit" : "hidden"%>
				name="submit" value="edit"> <input class="editbtn"
				type=<%=(editable) ? "submit" : "hidden"%> name="submit"
				value="delete"> <input class="editbtn2"
				type=<%=(editable) ? "button" : "hidden"%> name="reply" value="我要留言">
			<%--onclick="replyClick()" --%>

			<figure class="msgfigure">
				<img class="img1" alt="圖片待補" title=<%= list.get(i).getTitle() %>
					onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'"
					src='${pageContext.request.contextPath}/pic/<%= list.get(i).getImageid() %>' />
				<%
					System.out.println("imageid:" + list.get(i).getImageid());
				%>
				<figcaption class="msgfigcaption"><%=list.get(i).getTitle()%></figcaption>
			</figure>
			<p class="msgp"><%=list.get(i).getId()%></p>
			<p class="msgp">
				<textarea class="editable" name=title disabled><%=list.get(i).getContent()%></textarea>
			</p>

			<p><%=list.get(i).getImgpath()%></p>
			<p>會員回覆列</p>

		</article>
	</form>

	<%
		}
	%>



</div>
<%@include file="../jspf/footer.jspf"%>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.js" -->
<!-- 	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" -->
<!-- 	crossorigin="anonymous"></script> -->

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>

<script>
	//
	function checkLogin() {
		var login =
<%=session.getAttribute("member")%>
	if (login == null) {

			alert('請先登入');
		} else {
			window.location.href = '/SubScriptServlet';
		}
	}

	//   
	function search() {

		//將各下拉選單中是哪一個被選到pick出來

		let select_type = type.value;//還不考慮多選
		let select_sort = sort.value;
		let select_count = count.value;
		let select_word = word.value;

		//window.alert(`type=${select_type},sort=${select_sort},count=${select_count}`);

		window.location.href = "${pageContext.request.contextPath}/message/query?type="
				+ select_type
				+ "&sort="
				+ select_sort
				+ "&count="
				+ select_count + "&word=" + select_word;

	}
	
	function sendEmail(){
		
		
		$.ajax({

			type : "get",
			url : "${pageContext.request.contextPath}/email",
			// 		contentType: "application/json; charset=utf-8",
					dataType:"text",
			success : function(data) {
				
				alert("email sent");
// 				console.log("email sent");
				console.log(data);
				console.log(typeof (data));

				
			},
			error : function() {
				alert("send fail");
			}

		})
		
		
		
		
	}

	function getTypes() {

		let type = document.getElementById('type');

		$.ajax({

			type : "get",
			url : "${pageContext.request.contextPath}/message/types",
			// 		contentType: "application/json; charset=utf-8",
			// 		dataType:"text",
			success : function(data) {
				console.log("success");
				console.log(data);
				console.log(typeof (data));

				console.log(type.innerHTML);
				$('#type').empty();
				$('#type').append(
						"<option value='' disabled='' selected='' hidden=''>選擇訊息類別</option>"
								+ "<option value=''>All</option>");

				for (let i = 0; i < data.length; i++) {
					console.log("data:" + i + data[i]);
					$('#type').append(
							"<option value="+data[i]+">" + data[i]
									+ "</option>");
				}

				console.log("should get types: " + data);
			},
			error : function() {
				console.log("error");
			}

		})
	}

	$(document).ready(function() {

		var type = document.getElementById('type');
		var sort = document.getElementById('sort');
		var count = document.getElementById('count');
		var word = document.getElementById('word');
		$('.editbtn2').click(function() {
			$("p").append('<p>test</p>');

			console.log('is click');

		})
	})

	$('.msgTypes').on('focus', getTypes());
</script>
</body>
</html>