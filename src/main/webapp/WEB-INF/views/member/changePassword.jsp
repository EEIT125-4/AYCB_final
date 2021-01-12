<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<style>

.swal2-confirm {

width:100px;
}
.form-control{
font-size:20px
}

</style>


<link REL=STYLESHEET
	HREF="${pageContext.request.contextPath}/css/inside2.css"
	TYPE="text/css">

<title>登入</title>
</head>
<jsp:useBean id="member" class="member.MemberBean" scope="session" />
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentbox">
		<%@include file="../jspf/memberPanel.jspf"%>

		<div class="rightoutbox">
		
			<form action="passwordgo" method="post">

 
				<div style="font-size: 300px">

					<p style="font-size: 10%; margin-left: 295px; margin-top: 0px; font-weight:bold">密碼更改</p>
				</div>
                  <br>
				
			
 
				<div class="form-inline">
					<label for="oldpwd" style="font-weight: bold; font-size: 20px; margin-left:320px">舊密碼 </label>
					</div>
					<div class="form-inline" style=" margin-left:220px">
					<input type=password name="oldpwd" class="form-control mx-sm-3"  id="oldpwd"
						     style="width: 250px"  aria-describedby="passwordHelpInline" required/>
						     <label for="oldpwd1" id="oldpwd1"></label> 
						 
						</div>
					<br>	




					<div class="form-inline">
					<label for="pw2" style="font-weight: bold; font-size: 20px;margin-left:320px">新密碼 </label>
                      </div>
                      <div class="form-inline" style=" margin-left:220px">
					<input type=password placeholder="請輸入6-12數英混合" name="pwd2" id="pwd2" class="form-control mx-sm-3"
						style="width: 250px" aria-describedby="passwordHelpInline" required/>
						<label for="newpwd2" id="newpwd2"></label> 
						</div>
						<br>
						
						
						
						
							<div class="form-inline">
					<label for="pwd3" style="font-weight: bold; font-size:20px;;margin-left:320px">確認密碼</label>
                 </div>
                 
                  <div class="form-inline"   style=" margin-left:220px">
					<input type=password name="pwd3" id="pwd3" class="form-control mx-sm-3"
						style="width: 250px" aria-describedby="passwordHelpInline" required/><span for="newpwd3" id="newpwd3"></span>
						
						</div>

				<br>
				
				<button name="update" type="submit" id="sendd" class="btn btn-dark"
					style="width: 180px; margin-left: 270px">更新</button>
<!-- 								<input type="submit" name="update" value="確認更新" -->
<!-- 									style="margin-left: 300px"> -->
			
			</form>
			
		</div>
	</div>


</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>

var p1=false;
var p2=false;
var p3=false;
var p4=false;


	$('#oldpwd').blur(function(){
		console.log("blur");
	let oldpwd = document.getElementById("oldpwd").value;
 	let sp = document.getElementById("oldpwd1")
	let aza= $("#oldpwd").val();
 	console.log("oldpwd"+oldpwd);


	$.ajax({
		async : false,
		type : 'post',
		url :   "changeComplete" ,
		dataType : "json",
		data :     {"old":oldpwd}  ,
		//contentType : "application/json;charset=utf-8",
		success : function(data) {
				console.log("type:"+typeof(data));	
				if(data){
					console.log("56+6"+data);
					sp.innerHTML = "<img src='${pageContext.request.contextPath}\\image/correct.png'>"
					p1 = true;
					return true;
					
					
				}else{

					sp.innerHTML = "<img src='${pageContext.request.contextPath}\\image/cross.png'>"
						return false;
		
				}    			   				
			}
		});    		  		
	});


	setInterval(function(){ 
		
		let password=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
		document.getElementById("pwd2").addEventListener("change",function(){

			if (!password.test(document.getElementById("pwd2").value)){
				document.getElementById("newpwd2").innerHTML="<img src='${pageContext.request.contextPath}\\image/cross.png\'>";
			
			}
			else{
				document.getElementById("newpwd2").innerHTML="<img src='${pageContext.request.contextPath}\\image/correct.png\'>";
				p2=true;
			} 
		});
		
		
		let password2=/[a-zA-Z]+\d|\d+[a-zA-Z]+/;
		document.getElementById("pwd3").addEventListener("change",function(){

			if (!password2.test(document.getElementById("pwd3").value)){
				document.getElementById("newpwd3").innerHTML="<img src='${pageContext.request.contextPath}\\image/cross.png\'>";
				
			}
			else{
				document.getElementById("newpwd3").innerHTML="<img src='${pageContext.request.contextPath}\\image/correct.png\'>";
				p3=true;
			} 
		});
		
		
	

	}, 8);
	
	
	
	
	
	
	
	
	$('#pwd3').blur(function(){
		console.log("blur");
		
	let pwd2 = document.getElementById("pwd2").value;
	let pwd3 = document.getElementById("pwd3").value;
 	let sp = document.getElementById("newpwd3")
	let aza= $("#pwd3").val();
 	
 	console.log("pwd2"+pwd2);
 	console.log("pwd3"+pwd3);


	$.ajax({
		async : false,
		type : 'post',
		url :   "newpassword" ,
		dataType : "json",
		data :     {"new2":pwd2,"new3":pwd3}  ,
		//contentType : "application/json;charset=utf-8",
		success : function(data) {
				console.log("type:"+typeof(data));	
				if(data){
					console.log("56+6"+data);
					sp.innerHTML = "<img src='${pageContext.request.contextPath}\\image/correct.png'>"
						p4=true;
                       return true;
					
				}else{

					sp.innerHTML = "<img src='${pageContext.request.contextPath}\\image/cross.png'>"
						return false;
				}    			   				
			}
		});    		  		
	});
	
	$('#sendd').click(function(){
		if(p1!=true || p2!=true || p3!=true || p4!=true ){

		

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