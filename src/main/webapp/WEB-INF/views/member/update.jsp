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

<style>
.preview {
	width: 200px;
	height: 200px;
	background-size: cover;
}
</style>

<jsp:useBean id="member" class="member.MemberBean" scope="session" />
<%@include file="../jspf/header.jspf"%>

<div class="contentoutbox">
	<div class="contentbox">
	
	<%@include file="../jspf/memberPanel.jspf"%>
		<div class="rightoutbox">
			<form action="${pageContext.request.contextPath}/member/updateComplete" method="post" enctype='multipart/form-data' >
				
				
				<div class="form-inline " style="margin-left:80px;margin-bottom: 10px;">
					<img id="demo" class="preview" name="icon"
								src=<c:if test='${not empty member.getId()}'>
							<c:out value="${pageContext.request.contextPath}/pic/${member.iconid}"/>
							
							</c:if>
								<c:if test='${empty member.id}'>
							<c:out value=""/>
							</c:if>
								alt=<c:out value='${msg.getImageid()}'/>
								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
								</div>
				<div class="form-inline " style="margin-left:80px">
				<label for="file" style="font-weight: bold; font-size: 20px;margin-left:0px;margin-bottom:20px">上傳頭像</label>
				<input type="file" name="file" id="file" style="font-size:15px"/>	
				
				</div>
					
				<div class="form-inline " style="margin-left:80px">
				<label
					style="font-weight: bold; font-size: 20px">帳號</label>
				<input disabled name="account" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="account" />>
				 			

				<label for="username" 
					style="font-weight: bold; font-size: 20px">姓名</label> 
					<input id="username" name="username" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="name" />>


            </div>
              <br>
               	<div class="form-inline" style="margin-left:80px">
				
		 		<label style="font-weight: bold; font-size: 20px">信箱</label>
				<input disabled style="width: 535px"  name="email" class="form-control mx-sm-3"
					style="width: 230px" aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="email" />>

		</div>
					
<br>

	<div class="form-inline" style="margin-left:80px">
				<label style="font-weight: bold; font-size: 20px">生日</label> 
					<input disabled type="date" name="birth" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline" value=<jsp:getProperty name="member" property="birth" />>
				<label for="userphone" style="font-weight: bold; font-size: 20px">電話 </label> 
				<input id="userphone" name="userphone" class="form-control mx-sm-3" style="width: 230px"
					aria-describedby="passwordHelpInline" 
					value=<jsp:getProperty name="member" property="phone" />> 
					</div>
			

		<br>
					
					
				<div class="form-inline" style="margin-left:80px">
				<label for="useraddress" style="font-weight: bold; font-size: 20px">地址</label>
				<input id="useraddress" name="useraddress" class="form-control mx-sm-3"
					style="width: 535px" aria-describedby="passwordHelpInline"
					value=<jsp:getProperty name="member" property="address" />>
					</div>
<br>
<div class="form-inline" style="margin-left:80px">
				<label for="introduce" style="font-weight: bold; font-size: 20px">自我介紹</label>
				</div>
<div class="form-inline" style="margin-left:80px">
<textarea id="introduce" name="introduce" rows="5" cols="70" ><jsp:getProperty name="member" property="introduce" /></textarea>

									</div>
									
<br>

			<button name="update" type="submit" class="btn btn-dark" style="width:180px;margin-left:285px" >更新</button>
<!-- 				<input type="submit" name="update" value="確認更新" -->
<!-- 					style="margin-left: 280px"> -->
				<!-- 		</fieldset> -->

			</form>
		</div>
	</div>
<%-- <%@include file="../jspf/footer.jspf"%> --%>
</div>
	

<script>
$('#file').change(function() {

	var file = $('#file')[0].files[0];
	var reader = new FileReader;
	reader.onload = function(e) {
		$('#demo').attr('src', e.target.result);
	};
	reader.readAsDataURL(file);
});
</script>

</body>


</html>