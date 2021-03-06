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

<div class="container">
	<form id="fm" action="<c:url value="/login"/>" onsubmit='gogo()' method="post" >
		<fieldset class="loginfs" style="margin-left: 200px">
			<!-- 		<div style="margin-top: 20px; margin-left: 580px; width: 700px"> -->

			<legend style="margin-left: 300px; font-size: 22px">會員登入</legend>
			<div class="d-flex justify-content-center">
				<button type="button" id="btnSignIn" class="btn btn-info"
					style="width: 380px">Google登入</button>
				<!-- 			 <button type="button" class="btn btn-danger" id="btnDisconnect" style="width:130px">Google登出 </button> -->
			</div>
			<br>

			<div style="margin-left: 280px;">

				<%
					if (request.getAttribute("msg") != null) {
				%>
				<p style="color: #595959; font-size: 25px;font-weight:bolder"><%=request.getAttribute("msg")%></p>
				<%
					}
				%>

			</div>
			<hr>
			<div>
				<input class="bbb" type="text" name="user" id="ac" required
					placeholder="請輸入帳號" onblur="Ckac();" style="outline: none;">
				<span id="idsp" style="color: red;"></span>
			</div>
			<div>
				<input class="bbb" type="password" required name="pwd" id="pwd"
					placeholder="請輸入(6-20數字英文混合)" onblur="Ckpwd();"
					style="outline: none;"> <span id="idsp1"
					style="color: red;"></span> <label for="password" id="passwordeye"><img
					src="${pageContext.request.contextPath}/image/openeye.png" id="eye"></label><br>
			</div>


			<div style="height:15px" class="row">
				<div style="margin-left: 180px;" class="col"  style="display:inline block" >
					<input type="checkbox" class="custom-control-input form-control"
						id="customControlAutosizing" name="rememberme">
						 <label style="font-size: 15px" class="custom-control-label"
						for="customControlAutosizing">記住我</label>
				</div>
				<div  class="col" style="display:inline block">
					<button style="width:100px" data-toggle="modal" data-target="#forgot"
						class="btn btn-link form-control" role="button"
						aria-pressed="true">忘記密碼?</button>
				</div>
			</div>

	

			<div class="d-flex justify-content-center">
				<img src="<c:url value="/captcha"/>"> <input name="Qcode"
					required
					style="font-size: 10px; outline: none; height: 28px; margin-top: 15px; margin-left: 20px">


			</div>
<button class="btn btn-dark" type="submit" name="button1" id="button1"
				style="width: 390px; height: 40px; color:snow; margin-left: 150px;">登入</button>


			<br>

			<div style="margin-left: 300px">
				<a href="<c:url value="/register"/>" class="btn" style="width:90px;margin-top:15px"
					role="button" aria-pressed="true"><b>立即註冊</b></a>

			</div>
			
			<div style="margin-left: 155px">
			<input type="button" class="btn btn-success" id="yukai" value="凱凱">	
			<input type="button" class="btn btn-success" id="julia" value="Julia">		
			<input type="button" class="btn btn-success" id="leader" value="子雲">	
			<input type="button" class="btn btn-success" id="jack" value="博淞">	
		    <input type="button" class="btn btn-success" id="main" value="管理員">	
		    <input type="button" class="btn btn-success" id="oo" value="停權">	
		    
			<br>
</div>
			<div class="modal fade" id="forgot" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="Title">找回密碼</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="caption">
								<label>請輸入您註冊的email</label> <input type="email" id="email"
									name="email">

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal" style="width: fit-content;"
									onclick="forgotPassword()">送出確認信</button>

							</div>
						</div>
					</div>
				</div>

			</div>



		


			<br> <br>


			<!--      <div id="content" style="background-color: orange;"></div> -->

		</fieldset>
	</form>
	<form id="test" action="<c:url value="/index" />"></form>
	
	

</div>
<%@include file="../jspf/footer.jspf"%>

</body>


<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!--CLIENT_ID請自己改成從 後端組態檔讀取，例如：ASP.net的Web.config-->
<script type="text/javascript">
    let CLIENT_ID = "533526937203-8qath3ljf58sr4kk48ffijbo26p0b7lm.apps.googleusercontent.com";
    //let API_KEY = '';//Javascript SDK無須 API 金鑰
    // Array of API discovery doc URLs for APIs
    let DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/people/v1/rest"];
    
    
    

</script>
<!--執行Google API必須的.js，callback function名稱請自訂 -->
<!--↓https://apis.google.com/js/platform.js 或 https://apis.google.com/js/api.js 兩者網址都行得通 這裡採用跟官網寫法一樣-->
<script async defer src="https://apis.google.com/js/api.js"
	onload="this.onload=function(){};GoogleClientInit()"
	onreadystatechange="if (this.readyState === 'complete') this.onload()">
</script>

<!--以下請另外放置到 *.js檔案-->
<script type="text/javascript">
    //jQuery處理button click event 當畫面DOM都載入時....
    var p1=false;
    var p2=false;
    var p3=false;
    var p4=false;
    
    var result="";
    
    $(function () {
        $("#btnSignIn").on("click", function () {
        	console.log("btn click");
            $("#content").html("");//清空顯示結果
            GoogleLogin();//Google 登入
        });
        
        $("#btnDisconnect").on("click", function () {
            Google_disconnect();//和Google 
        });
    });
    
    function forgotPassword(){
    	console.log("執行忘記密碼流程")
    	let input=document.getElementById('email');
    	
    	let email=input.value;
    	
    	
    	 $.ajax({
     		
     		type : 'post',
     		url :   "forgot" ,
      		datatype:"text",
     		data : {"email":email},
//      		contentType : "application/json;charset=utf-8",
     		
     		success : function(data) {
     			if(data=="ok"){
     				
     				swal.fire({
      				  title: "請到信箱收信",
      				  text: "成功",
      				  icon: "success",
      				  button: "OK",
      				});
     				
     			}else{
     			
     				swal.fire({
      				  title: "oops",
      				  text: "寄送過程發生錯誤,請稍後再試或撥打客服電話",
      				  icon: "error",
      				  button: "OK",
      				});
     				
     			}
     			
     			
     		},
     		error:function(){
     			alert("controller error");
     			
     		}
     		
         })
    	
    }

    function GoogleClientInit() {
        //官網範例寫client:auth2，但本人實測由於待會要呼叫gapi.client.init而不是gapi.auth2.init，所以給client即可
        gapi.load('client', function () {
        	 console.log("client_id:"+CLIENT_ID);
            gapi.client.init({
                //client_id 和 scope 兩者參數必填
               
                clientId: CLIENT_ID,
                //scope列表參考：https://developers.google.com/people/api/rest/v1/people/get
                //"profile"是簡寫，要用完整scope名稱也可以
                scope: "profile",//"https://www.googleapis.com/auth/userinfo.profile",
                discoveryDocs: DISCOVERY_DOCS
            });


        });//end gapi.load
    }//end GoogleClientInit function


    function GoogleLogin() {
        let auth2 = gapi.auth2.getAuthInstance();//取得GoogleAuth物件
        auth2.signIn().then(function (GoogleUser) {
            console.log("Google登入成功");
            let user_id = GoogleUser.getId();//取得user id，不過要發送至Server端的話，為了資安請使用id_token，本人另一篇文章有範例：https://dotblogs.com.tw/shadow/2019/01/31/113026
            console.log(`user_id:${user_id}`);
            let AuthResponse = GoogleUser.getAuthResponse(true) ;//true會回傳包含access token ，false則不會
            let id_token = AuthResponse.id_token;//取得id_token
            //people.get方法參考：https://developers.google.com/people/api/rest/v1/people/get
            gapi.client.people.people.get({
                'resourceName': 'people/me',
                //通常你會想要知道的用戶個資↓
                'personFields': 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
            }).then(function (res) {

                    //success
                    let str = JSON.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
                    result=JSON.stringify(res.result);
                    //顯示授權你網站存取的用戶個資
//                     document.getElementById('content').innerHTML = str;
                    console.log(res.result);
                     console.log(res.result.names[0].displayName);
//                   console.log(res.result.genders[0].value);
                     console.log(res.result.emailAddresses[0].value);
//                      console.log(res.result.residences[0].value);
//                      console.log(res.result.occupations[0].value);
         
                     // 你變數宣告在這 下面的方法當然拿不到
                   
                     // 但是你下面兩個變數是宣告在這裏面
                     let googlename= res.result.names[0].displayName;
//                      let googlegender= res.result.genders[0].value;
                     let googlemail=res.result.emailAddresses[0].value;
//                      let googledate=res.result.birthdays[0].date;
//                      let birthyear=res.result.birthdays[0].year;
//                      let birthmonth=res.result.month;
//                      let birthday=res.result.day;
//                       console.log("googlebirth"+googledate);
                     
                     
                    //↑通常metadata標記primary:true的個資就是你該抓的資料

                    //請再自行Parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/


                    //最終，取得用戶個資後看要填在畫面表單上或是透過Ajax儲存到資料庫(記得是傳id_token給你的Web Server而不是明碼的user_id喔)，本範例就不贅述，請自行努力XD

                    googlelogin2(googlename,googlemail);
                    
                    
                    

            });
        },
            function (error) {
                console.log("Google登入失敗");
                
            });

    }//end function GoogleLogin
    
    function googlelogin2(a, b){
    	
    	console.log("result"+result);
    	
    	console.log("a="+a);
    	console.log("b="+b);
    
    	
    	let req = JSON.stringify({
    		"name":a,

    		"email":b
    		
    		});
    	
    	
        $.ajax({
    		async : false,
    		type : 'post',
    		url :   "google" ,
     		datatype:"json",
    		data : {"googlename":a,
    			"googleemail":b},
//     		contentType : "application/json;charset=utf-8",
    		
    		success : function(data) {
    			
    			alert("登入成功"+data);
    			$('#test').submit();
    			return true;
    			
    		},
    		error:function(){
    			alert("error2222222");
    			
    		}
    		
        })
        
	
    }

    function Google_disconnect() {
        let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件

        auth2.disconnect().then(function () {
            console.log('User disconnect.');
        });
    }
    
    

    
//     $.ajax({
// 		async : false,
// 		type : 'post',
// 		url :   "accountcheck"    ,
// 		dataType : "json",
// 		contentType : "application/json;charset=utf-8",
// 		success : function(data) {}
//     });
    

    
	function Ckac() {
		let ac = document.getElementById("ac").value
		let aclen = ac.length;
		let sp = document.getElementById("idsp")
		var rex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/;
		if (ac.length >= 2 && rex.test(ac)) {
			sp.innerHTML = "正確"

		} else if (ac.length < 2) {
			

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
				document.getElementById("eye").src="${pageContext.request.contextPath}/image/closeeye.png";
				
			}
			else{
				document.getElementById("pwd").type="password";p=0;
				document.getElementById("eye").src="${pageContext.request.contextPath}/image/openeye.png";
			}
		
		
	});
		
		
//
// 			window.onload = function(){
// 		var name1 = document.getElementById("ac");
// 		var password1 = document.getElementById("pwd");
// 		var rememberme = document.getElementById("customControlAutosizing");
// 		var formm = document.getElementById('fm');
// 		if(getCookie('user') && getCookie('pwd')){
// 			name1.value = getCookie('user');
// 			password1.value = getCookie('pwd');
// 			rememberme.checked = true;
// 			}
		
// 		//
// 	        rememberme.onchange = function(){
// 			if(!this.checked){
// 			delCookie('user');
// 			delCookie('pwd');
// 			}
// 			}
// 			}
			
// 			function gogo(){
// 				if(remember.checked){ 
// 					setCookie('user',name1.value,7); //儲存帳號到cookie，有效期7天
// 					setCookie('pwd',password1.value,7); //儲存密碼到cookie，有效期7天
// 					}
// 			}
// // 			formm.onsubmit = function(){
				
// // 			};
			
				
				
// 				//
// 				function setCookie(name,value,day){
// 					var date = new Date();
// 					date.setDate(date.getDate()+day);
// 					document.cookie = name +  '=' +  value  + ';expires=' + date
// 					};
				
// 				//
// 					function getCookie(name){
// 						var reg = RegExp(name +'=([^;] )');
// 						var arr = document.cookie.match(reg);
// 						if(arr){
// 						return arr[1];
// 						}else{
// 						return '';
// 						}
// 						};
// 						//刪除cookie
// 						function delCookie(name){
// 						setCookie(name,null,-1);
// 						};	
				
				  if(getCookie('account')&& getCookie('password')){
	    	  $("#ac").val(getCookie('account'))
	    	  $("#pwd").val(getCookie('password'))
	    	  document.getElementById("customControlAutosizing").checked=true;
		}
	      
	    document.getElementById("customControlAutosizing").addEventListener("change",function(){
	    	if(document.getElementById("customControlAutosizing").checked){
		    	
		    }else{
		    	delCookie('account');
		    	delCookie('password');
		    }
	    })
	    
		function gogo(){
	    	
	    	if(document.getElementById("customControlAutosizing").checked){ 
				setCookie('account',$("#ac").val(),7); //保存帐号到cookie，有效期7天
				setCookie('password',$("#pwd").val(),7); //保存密码到cookie，有效期7天
      		}else{
      			delCookie('account');
				delCookie('password');
      		}
	    }
	     
	    function setCookie(name,value,day){
			var date = new Date();
			date.setDate(date.getDate() + day);
			document.cookie = name + '=' + value + ';expires='+ date;
		 };
		
    //获取cookie
		function getCookie(name){
			var reg = RegExp(name+'=([^;]+)');
			var arr = document.cookie.match(reg);
			if(arr){
			  return arr[1];
			}else{
			  return '';
			}
		 };
		
    //删除cookie
		function delCookie(name){
			setCookie(name,null,-1);
		 }
				
	
		$('#yukai').click(function(){
			 //$('#ac').val('pororo159')
			 //$('#pwd').val('kkk123')
			 window.location.href='/AYCB_final/fastlogin?account=pororo159';
		})		
		

		
		$('#julia').click(function(){
// 			 $('#ac').val('c19352125')
// 			 $('#pwd').val('kkk123')
			 window.location.href='/AYCB_final/fastlogin?account=c19352125';
		})		
			
			$('#leader').click(function(){
				window.location.href='/AYCB_final/fastlogin?account=pp063075';
			
		})		
				
			 $('#jack').click(function(){
				 window.location.href='/AYCB_final/fastlogin?account=ss0814';
		})		
		
			 $('#main').click(function(){
				 window.location.href='/AYCB_final/fastlogin?account=kevin0128';
		})		
// 				 $('#oo').click(function(){
// 				 window.location.href='/AYCB_final/fastlogin?account=sss78659';
// 		})		
				$('#oo').click(function(){
	 $('#ac').val('sss78659')
	 $('#pwd').val('kkk123')
				});
</script>


</body>

</html>