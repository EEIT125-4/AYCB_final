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
			<form action="" method="post">

				<div style="font-size: 300px">

					<p style="font-size: 10%; margin-left: 295px; margin-top: 40px; font-weight:bold">密碼更改</p>
				</div>

<br>

             
				<div class="form-inline">
					<label for="oldpwd" style="font-weight: bold; font-size: 20px; margin-left:180px">舊密碼 </label>
					<input name="oldpwd" class="form-control mx-sm-3"  id="oldpwd"
						     style="width: 230px" aria-describedby="passwordHelpInline"/>
						     <label for="oldpwd1" id="oldpwd1"></label> 
						     
						     
						</div>
					<br>	

					<div class="form-inline">
					<label for="pw2" style="font-weight: bold; font-size: 20px;margin-left:180px">新密碼 </label>

					<input name="pwd2" class="form-control mx-sm-3"
						style="width: 230px" aria-describedby="passwordHelpInline"/>
						</div>
						<br>
						
							<div class="form-inline">
					<label for="pw3" style="font-weight: bold; font-size:20px;;margin-left:170px">確認密碼</label>

					<input name="pwd3" class="form-control mx-sm-3"
						style="width: 230px" aria-describedby="passwordHelpInline"/>
						</div>

				<br>
				
				<button name="update" type="submit" class="btn btn-dark"
					style="width: 180px; margin-left: 270px">更新</button>
<!-- 								<input type="submit" name="update" value="確認更新" -->
<!-- 									style="margin-left: 300px"> -->
				
			</form>
		</div>
	</div>

</div>
<script>


 
	

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
					sp.innerHTML = "密碼正確";
					

					
				}else{

					sp.innerHTML = "錯誤";
				}    			   				
			}
		});    		  		
	});





</script>






</body>








</html>