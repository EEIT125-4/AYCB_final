<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/member.css"
	TYPE="text/css">
<link rel="icon" href="image/logo.ico" type="image/x-icon">
<title>登入</title>
</head>
<%@include file="../jspf/header.jspf"%>
<form action="<c:url value="/login"/>" method="post">
	<fieldset class="loginfs">
		<div style="margin-top: 200px; margin-left: 500px; width: 700px">
			<legend style="margin-left: 310px; font-size: 22px">會員登入</legend>


			<input class="bbb" type="text" name="user" id="ac" placeholder="請輸入帳號or名稱" onblur="Ckac();" style="outline:none;">
			<span id="idsp" style="color: red;"></span>
			 <input class="bbb"
				type="password" name="pwd" id="pwd" placeholder="請輸入密碼(6-20數字英文混合)"
				onblur="Ckpwd();" style="outline: none;"> 
				<span id="idsp1"
				style="color: red;"></span>
				<label for="password" id="passwordeye"><img src="${pageContext.request.contextPath}/image/closeeye.png" id="eye"></label>	
				
				 <br> <input class="aaaa"
				type="checkbox" style="margin-left: 160px;"><span>記住我</span>

			<button type="submit" name="button1" id="button1"
				style="width: 100px; background-color: rgba(0, 0, 0, 0.753); height: 30px; color: snow; margin-left: 73px;">登入</button>
			<a href="<c:url value="/register"/>" style="margin-left: 80px;">新註冊</a>
			
		</div>
	</fieldset>
</form>
<%@include file="../jspf/footer.jspf"%>
<script>
	function Ckac() {
		let ac = document.getElementById("ac").value
		let aclen = ac.length;
		let sp = document.getElementById("idsp")
		var rex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/;
		if (ac.length >= 2 && rex.test(ac)) {
			sp.innerHTML = "正確"

		} else if (ac.length < 2) {
			sp.innerHTML = "錯誤格式"

		}
	}

	function Ckpwd() {
		let pwd = document.getElementById("pwd").value
		let pwdlen = pwd.length;
		let sp = document.getElementById("idsp1")
		var rex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/;
		if (pwd.length >= 6 && rex.test(pwd)) {
			sp.innerHTML = "正確"

		} else if (pwd == "") {
			sp.innerHTML = "請輸入密碼"

		}else{
			sp.innerHTML = "";
		}
		
	}
		
		let p=0;
		document.getElementById("passwordeye").addEventListener("click",function(){
			if(p==0){
				document.getElementById("pwd").type="text";p=p+1;
				document.getElementById("eye").src="${pageContext.request.contextPath}/image/openeye.png";
				
			}
			else{
				document.getElementById("pwd").type="password";p=0;
				document.getElementById("eye").src="${pageContext.request.contextPath}/image/closeeye.png";
			}
		
		
	});
</script>


</body>

</html>