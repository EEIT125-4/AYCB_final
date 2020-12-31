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

<div class="contentoutbox">
	<div class="contentbox">
		<div class="leftside">
			<div class="condition">會員中心</div>
			<div class="category">
				
				<ul class="list-group">
					<li class="list-group-item list-group-item-light">會員中心</li>
					<li class="list-group-item list-group-item-light">
					<a href="update">修改會員資料</a></li>
						
					<li class="list-group-item list-group-item-light"><a href="<c:url value='/orderManagement' />">訂單查詢</a></li>
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

			<p style="font-size: 10% ;margin-left:250px;margin-top:40px"></p>
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
			<button name="update" type="submit" class="btn btn-dark" style="width:180px;margin-left:230px" >更新</button>
<!-- 				<input type="submit" name="update" value="確認更新" -->
<!-- 					style="margin-left: 280px"> -->
				<!-- 		</fieldset> -->

			</form>
		</div>
	</div>
	<%@include file="../jspf/footer.jspf"%>
</div>
<!-- 	</div> -->



</body>


</html>