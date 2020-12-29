<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET HREF="${pageContext.request.contextPath}css/member.css" TYPE="text/css">
<link rel="icon" href="image/logo.ico" type="image/x-icon">
<title>註冊</title>
</head>
<%@include file="../jspf/header.jspf"%>


<div style="position: relative; top: 70px;">
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
				style="width:210px" required="required" />


			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">帳號</label>
			<form:input type="account" id="acc" path="account"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				 style="width:235px" placeholder="請輸入6-12英文數字"  required="required" />
			<label for="account" id="accountcheck"></label>

		</div>



		<br>




		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">密碼</label>
			<form:input type="password" id="pwd" path="password"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" placeholder="請輸入6到12英數混合" required="required"/>
			<label for="passwordcheck" id="passwordcheck"></label> <label
				for="inputPassword6" style="font-weight: bold; font-size: 25px">確認密碼</label>
			<form:input type="password" id="cpwd" path=""
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:200px" required="required" />

			<br>
	
		</div>
		<br>


		<div class="d-flex justify-content-center">



			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">信箱</label>
			<form:input type="email" id="emailcheck" path="email" onblur="check()"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:360px" required="required" />
			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">性別</label>

			<form:radiobutton style="height:30px; width:30px;" path="gender"
				id="Male" value="男" />
			<label style="font-weight: bold; font-size: 25px" for="inlineRadio1">男</label>
			<form:radiobutton style="height:30px; width:30px;" path="gender"
				id="FE" value="女" />
			<label style="font-weight: bold; font-size: 25px" for="inlineRadio2">女</label>


		</div>



		<br>

		<div class="d-flex justify-content-center">

			<label for="inputPassword6"
				style="font-weight: bold; font-size: 25px">電話</label>
			<form:input type="phone" id="phone" path="phone"
				class="form-control mx-sm-3" aria-describedby="passwordHelpInline"
				style="width:210px" placeholder="請輸入手機號碼"  required="required"/>

			<label for="phone" id="phonecheck"></label> <label
				for="inputPassword6" style="font-weight: bold; font-size: 25px">生日</label>
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
				style="width:535px" placeholder="請輸入完整地址" required="required" />
			<label for="address" id="addresscheck" ></label>

		</div>
		<label for="address" id="addresscheck"
			class="col-sm-3 col-form-label col-form-label-lg"></label>
			
	<div style="margin-left: 830px">
			<input type="submit" id="submit" value="註冊"
				style="padding: 5px 15px; font-weight: bold; background: #ccc; border: 0 none; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px; width: 250px">

		
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
         p1=true;
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
			p2=true;
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
// 	if (account == "") {
// 		sp.innerHTML = "<img src='image/cross.png'>";
// 		p4=false;
// 	} else
		
 	 if (rex.test(account) && accountlen >= 6 && check()) {
 		p4=true;
		
	sp.innerHTML = "<img src='image/correct.png'>"
 	} else {
		sp.innerHTML = "<img src='image/cross.png'>";
		p4=false;
 	}
// 	let mb_Account = $('#account').val();

	
});

function check(){
    	let account = document.getElementById("acc").value
    	
    	let accountlen = account.length;
     	let sp = document.getElementById("accountcheck")
    	let aza= $("#acc").val();
     	let mail=$("#emailcheck").val();
     	console.log("aza:"+aza);
     	let confirm=false;

     	
    	$.ajax({
    		async : false,
    		type : 'post',
    		url :   "accountcheck"    ,
    		dataType : "json",
    		contentType : "application/json;charset=utf-8",
    		success : function(data) {
    		
    			$.each(data,function(i,n){
    				console.log(i+"/"+n.email);
    				
    				
    				if(aza!=n.account){
    					
    					p4=true;
//     					console.log("aza="+aza+",i="+i+"acc="+n.account+",eq?"+aza==n.account);
    					confirm=true;
    					
    					return;
    			
    				}else{
//     					console.log("aza="+aza+",i="+i+"acc="+n.account+",eq?"+aza==n.account);
    					p4=false;    	
    				
    					
    					confirm=false;
    					return false;
    				}    			   				
    			});
    		}    		  		
    	});
    	return confirm;
}
    
   
    	$('#submit').click(function(){
    		if(p1!=ture &&p2!=ture &&p3!=ture &&p4!=ture &&p5!=ture){
    			
    			alert("填寫未正確");	
    			
    		}else{
    			$('form').submit();
    		}
    			
    	});

</script>



</body>
</html>