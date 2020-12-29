<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <link REL=STYLESHEET HREF="${pageContext.request.contextPath}css/member.css" TYPE="text/css"> --%>
<link rel="icon" href="image/logo.ico" type="image/x-icon">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<title>註冊</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div style="position: relative; top: 200px;">
	<!-- 	<fieldset -->
	<!-- 		style="margin: auto; border: 3px solid black; border-radius: 20px; width: 550px;"> -->
	<!-- 		<legend -->
	<!-- 			style="background-color: lightgray; border-radius: 3px; width: 60px; margin: 0 auto; text-align: center;">註冊</legend> -->

	<form:form action="memberConfirm" method="POST" modelAttribute="member">

		<div class="d-flex justify-content-center" style="font-size: 300px">

			<p style="font-size: 15%;">註冊會員</p>
		</div>



		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">姓名</label>
			<form:input type="account" id="realname" path="name"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:210px" />
				
				
			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">帳號</label>
			<form:input type="account" id="acc" path="account" 
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:235px" placeholder="請輸入6-12英文數字"/>
			<label for="account" id="accountcheck" ></label>
				
		</div>
		
		

<br>


		<!-- 				<tr> -->
		<!-- 					<td>*姓名</td> -->
		<%-- 					<td><form:input class="abc" type="text" path="name" id="realname"/>  --%>
		<!-- 					</td> -->
		<!-- 				</tr> -->

<!-- 		<div class="d-flex justify-content-center"> -->
<!-- 			<label for="inputPassword6" style="font-weight: bold; font-size: 30px">性別</label> -->
<%--  <form:radiobutton  style="height:20px; width:20px;"  path="gender" id="Male" value="男"/> --%>
<!-- <label  style="font-weight: bold; font-size: 20px" for="inlineRadio1">男</label>  -->
<!-- <br> -->
<%-- 		  <form:radiobutton  style="height:20px; width:20px;" path="gender" id="FE" value="女"/> --%>
<!-- 		  <label style="font-weight: bold; font-size: 20px" for="inlineRadio2">女</label> -->

<!-- <div> -->

<%-- 		  <form:radiobutton class="form-check-input" type="radio" path="gender" id="Male" value="男"/> --%>
<!-- 		  <label class="form-check-label" for="inlineRadio1">男</label> -->


<!-- 		</div> -->






		<!-- 				<tr> -->
		<!-- 					<td>*性別</td> -->

		<%-- <%-- 					<form:radiobuttons path="gender" items='${gender}'/></td> --%>
		<%-- 					<td><form:radiobutton  path="gender" value="男"/>先生  --%>
		<%-- 					<form:radiobutton  path="gender" value="女" />小姐</td> --%>

		<!-- 				</tr> -->
		<!-- 				<tr> -->


	




		<!-- 					<td>*帳號</td> -->
		<%-- 					<td><form:input class="ddd" type="text" path="account" id="acc" --%>
		<%-- <%-- 						onblur="Ckac();"/></td> --%>
		<%-- 						<span id="idsp" style="color: red;"></span>  --%>
		<%-- 				</tr> --%>
		<!-- 				<tr> -->
		<!-- 					<td>*密碼</td> -->
		<%-- 					<td><form:input class="ddd" type="password" path="password" id="pwd"/></td> --%>
		<!-- 				</tr> -->




		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">密碼</label>
			<form:input type="password" id="pwd" path="password"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" placeholder="請輸入6到12英數混合" />
				<label for="passwordcheck" id="passwordcheck" ></label>
				
			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">確認密碼</label>
			<form:input type="password" id="cpwd" path=""
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" />
	
		<br>
		<!--           <small id="passwordHelpInline" class="text-muted"> -->
		<!--             Must be 8-20 characters long. -->
		<!--           </small> -->
</div>
<br>

	
		<div class="d-flex justify-content-center">

		
				
				<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">信箱</label>
			<form:input type="email" id="emailcheck" path="email" blur="email"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:360px" />
							<label for="inputPassword6" style="font-weight: bold; font-size: 25px">性別</label>

 <form:radiobutton  style="height:30px; width:30px;"  path="gender" id="Male" value="男"/>
<label  style="font-weight: bold; font-size: 25px" for="inlineRadio1">男</label> 
  <form:radiobutton  style="height:30px; width:30px;" path="gender" id="FE" value="女"/>
		  <label style="font-weight: bold; font-size: 25px" for="inlineRadio2">女</label>

				
		</div>

		
		
<br>

	<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">電話</label>
			<form:input type="phone" id="phone" path="phone"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:210px" placeholder="請輸入手機號碼"/>
	
				<label for="phone" id="phonecheck" ></label>
				
					<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">生日</label>
			<form:input type="date" id="bday" path="birth"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:235px" />
				
			
		</div>
		<br>

		<div class="d-flex justify-content-center">

		
				
				<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">地址</label>
			<form:input type="address" id="address" path="address" blur="address"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:535px" placeholder="請輸入完整地址" />
				<label for="address" id="addresscheck" ></label>
				
		</div>
				<label for="address" id="addresscheck" class="col-sm-3 col-form-label col-form-label-lg"></label>


		<!-- 				<tr> -->
		<!-- 					<td>*確認密碼</td> -->
		<!-- 					<td> -->
		<%-- 						<form:input class="ddd" type="password" path="" id="cpwd"/>  --%>
		<!-- 					</td> -->
		<!-- 				</tr> -->
		<!-- 				<tr> -->


	




		<!-- 					<td>*信箱</td> -->
		<%-- 					<td><form:input class="ccc" type="text" path="email" id="email" blur="email"/></td> --%>
		<!-- 					<label for="email" id="emailcheck"></label> -->
		<!-- 				</tr> -->
		<!-- 				<tr> -->

		<br>





		<!-- 					<td>*生日</td> -->
		<!-- 					<td><div> -->
		<%-- 							<form:input type="date" class="bb" path="birth" id="bday"/> --%>


		<!-- 						</div></td> -->
		<!-- 			</table> -->
		<div style="margin-left:830px">
	    <input type="submit"  value="註冊" style="padding:5px 15px;font-weight:bold; background:#ccc; border:0 none;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; width:250px">
		
		</div>
<!-- 		<div style="margin-left: 1000px"> -->
			<!-- 				<button style="width: 50px;" class="sb" type="submit" name="submit">註冊</button> -->
<!-- 			<input type="submit" value="註冊"> -->
			<!-- 						<button type="submit" name="submit"><a href='memberConfirm'>確認</a></button> -->
<!-- 		</div> -->
	</form:form>
	<!-- 	</fieldset> -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"> </script>
	
<script>
setInterval(function(){ 
	let phone = /^[09]{2}[0-9]{8}$/;//手機判斷
	document.getElementById("phone").addEventListener("change",function(){
		
		if (!phone.test(document.getElementById("phone").value)){
			document.getElementById("phonecheck").innerHTML="<img src='image/cross.png'>";
// 			check[0]=0;
		}
		else{
			document.getElementById("phonecheck").innerHTML="<img src='image/correct.png'>";
// 			check[0]=1;
		}
	});
	
	let password=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
	document.getElementById("pwd").addEventListener("change",function(){

		if (!password.test(document.getElementById("pwd").value)){
			document.getElementById("passwordcheck").innerHTML="<img src='image/cross.png'>";
// 			check[2]=0;
		}
		else{
			document.getElementById("passwordcheck").innerHTML="<img src='image/correct.png'>";
// 			check[2]=1;
		} 
	});
	let address=/^[\u4e00-\u9fff]+\d+/;//地址
	document.getElementById("address").addEventListener("change",function(){

		if (!address.test(document.getElementById("address").value)){
			document.getElementById("addresscheck").innerHTML="<img src='image/cross.png'>";
// 			check[6]=0;
		}
		else{
			document.getElementById("addresscheck").innerHTML="<img src='image/correct.png'>";
// 			check[6]=1;
		}
	});
// 	let account=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
// 	document.getElementById("acc").addEventListener("change",function(){

// 		if (!password.test(document.getElementById("acc").value)){
// 			document.getElementById("accountcheck").innerHTML="<img src='image/cross.png'>";
// 			check[2]=0;
// 		}
// 		else{
// 			document.getElementById("accountcheck").innerHTML="<img src='image/correct.png'>";
// 			check[2]=1;
// 		} 
// 	});
	
	
	
}, 8);


$('#acc').blur(function() {
	
	let account = document.getElementById("acc").value
	let accountlen = account.length;
 	let sp = document.getElementById("accountcheck")

 	let account2=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
	if (account == "") {
		sp.innerHTML = "<img src='image/cross.png'>";
		
	} else if (checkAcc()=='ok' && accountlen >= 6) {
// 		rex.test(account) && 
		sp.innerHTML = "<img src='image/correct.png'>"
	} else {
		sp.innerHTML = "<img src='image/cross.png'>";
	}
// 	let mb_Account = $('#account').val();

	
})

function checkAcc(){
	return 'ok';
	
// 	$.ajax({
// 		async : false,
// 		type : 'GET',
// 		url :   "accountcheck"    ,
// 		dataType : "json",
// 		contentType : "application/json;charset=utf-8",
// 		success : function(data) {
// 			 {
// 				console.log("data:"+data);
			
// 				return 'ok'
// 			}else {
// 				sp.innerHTML ="<img src='image/correct.png'>"
// 				console.log("data"+data);
					
// 			}
// 		},error: function(){
// 			alert("error");
// 			return 'nok';
// 		}
// 	});
	
}







</script>



</body>
</html>