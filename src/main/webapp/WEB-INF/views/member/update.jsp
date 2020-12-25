<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/member.css"
	TYPE="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous">
	
</script>

<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/inside2.css"
	TYPE="text/css">

<title>登入</title>
</head>
<jsp:useBean id="member" class="member.MemberBean" scope="session" />
<%@include file="../jspf/header.jspf"%>
<!-- <div style="position: relative; top: 200px;"> -->

<!-- 		<fieldset -->
<!-- 			style="margin: auto; border: 3px solid black; width: 550px;border-radius: 6px;"> -->
<!-- 			<legend -->
<!-- 				style="background-color: lightgray; border-radius: 3px; width: 100px; margin: auto;">會員資料更新</legend> -->
<!-- 			<table> -->



<!-- 		<div class="d-flex justify-content-center"> -->

<!-- 			<label for="inputPassword6" -->
<!-- 				style="font-weight: bold; font-size: 25px">姓名</label> -->
<!-- 			<form:input type="account" id="realname" path="name" -->
<!-- 				class="form-control mx-sm-3" aria-describedby="passwordHelpInline" -->
<!-- 				style="width:200px" /> -->
<!-- 		</div> -->
<!-- 		<br> -->
<div class="contentoutbox">
	<div class="contentbox">
		<div class="leftside">
			<div class="condition">會員中心</div>
			<div class="category">
				<!-- 		<div  class="container" > -->

				<!-- 		<div class="row justify-content-start;col-4" > -->
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">會員中心</li>
					<li class="list-group-item list-group-item-light"><a
						href="update">修改會員資料</a></li>
					<li class="list-group-item list-group-item-light">訂單查詢</li>
					<li class="list-group-item list-group-item-light">活動查詢</li>
					<li class="list-group-item list-group-item-light">訊息查詢</li>
				</ul>
			</div>
		</div>
		<div></div>
		<div class="rightoutbox">
			<form action="${pageContext.request.contextPath}/member/updateComplete"
				method="post">
				
				<div  style="font-size: 300px">

			<p style="font-size: 10% ;margin-left:250px">會員更新</p>
		</div>
				
		
				
		
				<div class="form-inline">
				<label for="inputPassword6"
					style="font-weight: bold; font-size: 20px">帳號</label>
				<input disabled name="account" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="account" />>
				 
				
			   <label for="inputPassword6" style="font-weight: bold; font-size: 20px">密碼</label>
					
				<input name="pwd" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="password" />>
            </div>
              <br>
               	<div class="form-inline">
				<label for="inputPassword6"
					style="font-weight: bold; font-size: 20px">姓名</label> 
					<input name="username" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="name" />>


				<label for="inputPassword6"
					style="font-weight: bold; font-size: 20px">電話 </label> <input 
					name="userphone" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline" 
					value=<jsp:getProperty name="member" property="phone" />> 
					</div>
					
<br>


	<div class="form-inline">
				<label for="inputPassword6"
					style="font-weight: bold; font-size: 20px">生日</label> 
					<input disabled type="date" name="birth" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline" value=<jsp:getProperty name="member" property="birth" />>
					
					 <label
					for="inputPassword6" style="font-weight: bold; font-size: 20px">信箱</label>
				<input disabled  name="email" class="form-control mx-sm-3"
					style="width: 230px" aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="email" />>
</div>
		<br>
					
					
				<div class="form-inline">
					<label
					for="inputPassword6" style="font-weight: bold; font-size: 20px">地址</label>
				<input name="useraddress" class="form-control mx-sm-3"
					style="width: 535px" aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="address" />>
					</div>
<br>
				<!-- 				<tr> -->
				<!-- 					<td>姓名:</td> -->
				<!-- 					<td>></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<td>聯絡地址:</td> -->
				<!-- 					<td><input name="useraddress" -->
				<!-- 						value=<jsp:getProperty name="member" property="address" />></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<td>聯絡電話:</td> -->
				<!-- 					<td><input name="userphone" -->
				<!-- 						value=<jsp:getProperty name="member" property="phone" />></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<td>E-mail:</td> -->
				<!-- 					<td><input name="useremail" disabled="disabled" -->
				<!-- 						value=<jsp:getProperty name="member" property="email" />></td> -->
				<!-- 				</tr> -->

				<!-- 				<tr> -->
				<!-- 					<td>密碼:</td> -->
				<!-- 					<td><input name="pwd" -->
				<!-- 						value=<jsp:getProperty name="member" property="password" />> -->
				<!-- 				<tr> -->
				<!-- 					<td> -->
				<!-- 			</table> -->
				<input type="submit" name="update" value="確認更新"
					style="margin-left: 280px">
				<!-- 		</fieldset> -->

			</form>
		</div>
	</div>
	<%@include file="../jspf/footer.jspf"%>
</div>
<!-- 	</div> -->



</body>


</html>