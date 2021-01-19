<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">





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
<!-- 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> -->


<title>註冊</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div style="position: relative; top: 10px;">
	<!-- 	<fieldset -->
	<!-- 		style="margin: auto; border: 3px solid black; border-radius: 20px; width: 550px;"> -->
	<!-- 		<legend -->
	<!-- 			style="background-color: lightgray; border-radius: 3px; width: 60px; margin: 0 auto; text-align: center;">註冊</legend> -->

	<form:form action="memberConfirm" method="POST" modelAttribute="member" enctype='multipart/form-data'>

		<div class="d-flex justify-content-center" style="font-size: 300px">

			<p style="font-size: 15%;">註冊會員</p>
		</div>



		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px" >姓名</label>
			<form:input type="account" id="realname" path="name"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:210px"  required="required" />


			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">帳號</label>
			<form:input type="account" id="acc" path="account"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				 style="width:235px" placeholder="請輸入6-12英文數字" required="required" />
			<label for="account" id="accountcheck" ></label>

		</div>



		<br>





		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">密碼</label>
			<form:input type="password" id="pwd" path="password"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" placeholder="請輸入6到12英數混合" required="required"/>
			<label for="passwordcheck" id="passwordcheck"></label> 
			<label for="inputPassword6" style="font-weight: bold; font-size: 25px">確認密碼</label>
			<form:input type="password" id="cpwd" path=""
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" required="required"/>
				<label for="passwordcheck" id="pwd2"></label> 
				
				

			<br>
			<!--           <small id="passwordHelpInline" class="text-muted"> -->
			<!--             Must be 8-20 characters long. -->
			<!--           </small> -->
		</div>
		<br>


		<div class="d-flex justify-content-center">



			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px;margin-left:80px">信箱</label>
			<form:input type="email" id="emailcheck" path="email" class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px; " required="required" />
				<label for="emailck" id="emailck"></label> 
<!-- 			<label for="inputPassword6" -->
<!-- 				style="font-weight: bold; font-size: 25px">性別</label> -->

<%-- 			<form:radiobutton style="height:30px; width:30px;" path="gender" --%>
<%-- 				id="Male" value="男" /> --%>
<!-- 			<label style="font-weight: bold; font-size: 25px" for="inlineRadio1">男</label> -->
<%-- 			<form:radiobutton style="height:30px; width:30px;" path="gender" --%>
<%-- 				id="FE" value="女" /> --%>
<!-- 			<label style="font-weight: bold; font-size: 25px" for="inlineRadio2">女</label> -->
		<label for="icon" style="font-weight: bold; font-size: 20px;margin-left:30px" >上傳頭像</label>
			<input type="file" name="icon" id="icon" style="font-size:15px"/>	

		</div>



		<br>

		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">電話</label>
			<form:input type="phone" pattern="[0-9]{10}" id="phone" path="phone"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:210px" placeholder="請輸入手機號碼" required="required" />

			<label for="phone" id="phonecheck"></label> <label
				for="inputPassword6" style="font-weight: bold; font-size: 25px">生日</label>
			<form:input type="date" id="bday" path="birth"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:235px"  required="required"/>


		</div>
		<br>

		<div class="d-flex justify-content-center">



			<label for="address"
				style="font-weight: bold; font-size: 25px">地址</label>
			<form:input type="address" id="address" path="address" blur="address"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:360px" placeholder="請輸入完整地址"  required="required"/>
			<label for="address" id="addresscheck"></label>
					
				<label for="gender"
				style="font-weight: bold; font-size: 25px">性別</label>

			<form:radiobutton style="height:30px; width:30px;" path="gender"
				id="gender" value="男" />
			<label style="font-weight: bold; font-size: 25px" for="inlineRadio1">男</label>
			<form:radiobutton style="height:30px; width:30px;" path="gender"
				id="gender" value="女" />
			<label style="font-weight: bold; font-size: 25px" for="inlineRadio2">女</label>
<!-- 			<label for="icon" style="font-weight: bold; font-size: 20px">頭像</label> -->
<!-- 			<input type="file" name="icon" id="icon" style="font-size:13px"/>	 -->
		</div>
		
		<div class="d-flex justify-content-center">



			<label for="introduce"
				style="font-weight: bold; font-size: 25px">自我介紹</label>
		</div>
		<div class="d-flex justify-content-center">			
			<form:textarea id="introduce" path="introduce" cols="70" rows="10" />

		</div>
		
		<label for="address" id="addresscheck"
			class="col-sm-3 col-form-label col-form-label-lg"></label>



		<div style="margin-left: 830px">
			<input type="submit" id="send" value="註冊"
				style="padding: 5px 15px; font-weight: bold; background: #ccc; border: 0 none; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px; width: 250px">

		</div>
		<!-- 		<div style="margin-left: 1000px"> -->
		<!-- 				<button style="width: 50px;" class="sb" type="submit" name="submit">註冊</button> -->
		<!-- 			<input type="submit" value="註冊"> -->
		<!-- 						<button type="submit" name="submit"><a href='memberConfirm'>確認</a></button> -->
		<!-- 		</div> -->
	</form:form>
	<!-- 	</fieldset> -->
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"> </script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>

var p1 = false;
var p2 = false;
var p3 = false;
var p4 = false;
var p5 = false;
var p6 = false;
var p7 = false;



setInterval(function(){ 
	let phone = /^[09]{2}[0-9]{8}$/;//手機判斷
	document.getElementById("phone").addEventListener("change",function(){
		
		if (!phone.test(document.getElementById("phone").value)){
			document.getElementById("phonecheck").innerHTML="<img src='image/cross.png'>";
		}
		else{
			document.getElementById("phonecheck").innerHTML="<img src='image/correct.png'>";
         p1=true;
		}
	});
	
	let password=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
	document.getElementById("pwd").addEventListener("change",function(){

		if (!password.test(document.getElementById("pwd").value)){
			document.getElementById("passwordcheck").innerHTML="<img src='image/cross.png'>";
			
		}
		else{
			document.getElementById("passwordcheck").innerHTML="<img src='image/correct.png'>";
			p2=true;
		} 
	});
	
	let address=/^[\u4e00-\u9fff]+\d+/;//地址
	document.getElementById("address").addEventListener("change",function(){

		if (!address.test(document.getElementById("address").value)){
			document.getElementById("addresscheck").innerHTML="<img src='image/cross.png'>";
			

		}
		else{
			document.getElementById("addresscheck").innerHTML="<img src='image/correct.png'>";

			p3=true;
		}
	});

	
	
}, 8);

	//檢查帳戶
    $('#acc').blur(function() {
    	console.log("blur");
	
	let account = document.getElementById("acc").value;

	let accountlen = account.length;
	console.log("acc:"+account+"len="+accountlen);
 	let sp = document.getElementById("accountcheck")
	
 	let rex=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;

		
 	 if (rex.test(account) && accountlen >= 6 && check()) {
 		p4=true;
		
	sp.innerHTML = "<img src='image/correct.png'>"
 	} else {
		sp.innerHTML = "<img src='image/cross.png'>";
		
 	}
	
});


function check(){
    	let account = document.getElementById("acc").value;
    	
    	let accountlen = account.length;
     	let sp = document.getElementById("accountcheck")
    	let aza= $("#acc").val();
     	console.log("aza:"+aza);
     	let confirm=false;

    	$.ajax({
    		async : false,
    		type : 'post',
    		url :   "accountcheck"  ,
    		dataType : "json",
    		contentType : "application/json;charset=utf-8",
    		success : function(data) {
    		
    			$.each(data,function(i,n){
    			
    				
    				
    				if(aza!=n.account){

    					p5=true;

    					confirm=true;
    					
    					return;
    					
    					
    				}else{

    					
    					confirm=false;
    					return false;
    				}    			   				
    			});
    		}    		  		
    	});
    	return confirm;
}


//檢查email
$('#emailcheck').blur(function() {
	console.log("blur");

let email = document.getElementById("emailcheck").value;
let emaillen = email.length;
if(emaillen >=4 && emailcheck!='')
	{
	
	let sp = document.getElementById("emailck");

	console.log("email:"+email);



	$.ajax({
		async : false,
		type : 'post',
		url :   "emailcheck"  ,
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		success : function(data) {
		
			$.each(data,function(i,n){
				
				if(email!=n.email){
					console.log("member email"+n.email);
					
					
					sp.innerHTML = "<img src='image/correct.png'>";
						p6=true;
						
					return;
									
				}else{

				 	
					sp.innerHTML = "<img src='image/cross.png'>";
				p6=false;
				return false;
					
				}    			   				
			});
		}    		  		
	});
	

	}else{
		sp.innerHTML = "<img src='image/cross.png'>";
		p6=false;
		return false;
	}


} );


$('#cpwd').blur(function() {
	var pwd = document.getElementById("pwd").value
	let cpwd = document.getElementById("cpwd").value
	sp = document.getElementById("pwd2")
	if (pwd == cpwd && cpwd != "") {
	sp.innerHTML = "<img src='image/correct.png'>"
	p7 = true;
	} else {
	sp.innerHTML = "<img src='image/cross.png'>"
	p7=false;
	}
	})


    	$('#send').click(function(){
    		if(p1!=true || p2!=true || p3!=true || p4!=true || p5!=true || p6!=true || p7!=true){
    			

    			
    			swal.fire({
    				  title: "oops",
    				  text: "資料輸入有誤",
    				  icon: "error",
    				  button: "OK",
    				});
    			
    			return false;
    		}else{
    			$('form').submit();
    			return true;
    		}
    			
    	});
    		
</script>



</body>
</html>