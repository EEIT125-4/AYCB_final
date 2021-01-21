<%@page import="message.model.MessageBean"%>
<%@page import="message.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%><!-- 標準寫法,詳細參考網站https://www.javatpoint.com/jstl-sql-setdatasource-tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>廣告編輯</title>


</head>
<%@include file="../jspf/header.jspf"%>

<div class="mid">
	<c:set var="adv" value="${adv}" />
	<c:choose>
	<c:when test='${not empty adv.getAdvid() }'>
	<c:set var='action' value='update' />
		<c:set var="hint" value="更新" />
	
	</c:when>
	<c:otherwise>
	<c:set var='action' value='insert' />
		<c:set var="hint" value="新增廣告" />
	</c:otherwise>
	</c:choose>


	<main>
		<div>
			
			<form:form method="POST" modelAttribute="adv" enctype='multipart/form-data'>
				<fieldset>
<!-- 				隱藏資料 -->
				<input type="hidden" name="memberID" value="${member.id}"/>
				<input type="hidden" name="advcount" value="${adv.advcount}"/>
				<input type="hidden" name="advid" value='${adv.getAdvid()}'>
				
					<legend>
						<c:out value='${hint}' />
					</legend>
					<table>
						<tr>
							<td><label for="title">廣告標題</label></td>
							<td><form:input id="title" type="text" placeholder="${adv.advtitle}" path="advtitle" /></td>
						</tr>

						<tr>
							<td><label for="sourcetype">格式</label></td>	
							<td>
							
<!-- 							<input id="sourcetype" type="text" name="sourcetype" value="image"  /> -->
							<form:select id="sourcetype" path="advsourcetype">

							<form:option value="0" label="image"/>
							<form:option value="1" label="video"/>
							<form:option value="2" label="youtube"/>
							<form:option value="3" label="url"/>
							</form:select>
							
								</td>
						</tr>
						<tr>
							<td>
							<label for="advOwner">廣告業主</label>
							</td>
							<td>
							<form:input id="advOwner" type="text" path="owner"/>
							
							</td>
						</tr>
						<tr>
							<td>
							<label for="advCategory">廣告分類</label>
							</td>
							<td>
							
							<form:select id="advCategory" path="advcategory">

							<form:option value="保養品廣告" label="保養品廣告"/>
							<form:option value="活動廣告" label="活動廣告"/>
							<form:option value="合作店家" label="合作店家"/>
							<form:option value="其他" label="其他"/>
							</form:select>
							
							
							</td>
						</tr>
						
						<tr>
							<td>
							<label for="link" >廣告連結</label>
							</td>
							<td>
							<textarea id="link" name="link" cols="50" rows="5"></textarea>
							
							</td>
						</tr>
						
						<tr>
							<td>
							<label for="advLength">廣告長度(秒)</label>
							</td>
							<td>
							<form:input id="advLength" type="number" path="advlength" min="1" max="10" value="5"/>
							
							</td>
						</tr>
						
						<tr>
							<td><label for="adsDesc">廣告說明</label></td>
							<td><form:textarea id="adsDesc" path="advdesc" cols="50"
									rows="5" /></td>

						</tr>
						
						<tr>
							<td><label for="postDate">發布日期</label></td>
							<td>
							<input type="date" id="postDate" name="postDate"  />
							</td>

						</tr>
							<tr>
							<td><label for="endDate">結束日期</label></td>
							<td>
							<input type="date" id="endDate" name="endDate" />
							</td>

						</tr>
						<tr>
							<td><label for="width">廣告欄寬</label></td>
							<td><form:input type="number" id="width" path="width" min="100" max="600"/></td>

						</tr>
						<tr>
							<td><label for="height">廣告高度</label></td>
							<td><form:input type="number" id="height" path="height" min="100" max="600"/></td>

						</tr>
						<tr id="videoRow">
							<td>上傳影片</td>
							<td><input id="videofile" type="file" name="video" class='videofile' accept='video/*' /></td>
							
						</tr>
						<tr id="drag">
						
						<td>上傳檔案</td>
						<td id='dropbox' style='background:red;min-height: 300px;'	></td>
						</tr>
						
						<tr>
						<td></td>
						<td>
	
						<video autoplay muted controls='controls' style='display:none' class="video_show" >
						<source src="" id="video_here">
						</video>
						</td>
						</tr>
						
						<tr id="imageRow">
							<td>上傳圖片</td>
							<td><input id="file" type="file" name="file" /></td>
						</tr>
						<tr id="previewRow">
							<td>檔案預覽</td>
							
							
							<td id='preview'></td>
<!-- 							 id='preview' -->
							
						</tr>

						<tr>

							<td colspan="2">
							
							 				
								<input type="submit" name="submit" value='${action}'> 
								<input type="reset" value="清除">
								
								</td>
								
						</tr>
					</table>
<!-- 					<div id='preview'></div> -->
				</fieldset>

			</form:form>
			
		</div>
	</main>
	<button type='button' onclick='autoInput();'>一鍵輸入</button>
</div>





<script>
var dropbox;
var preview=document.getElementById('preview');

dropbox = document.getElementById("dropbox");
dropbox.addEventListener("dragenter", dragenter, false);
dropbox.addEventListener("dragover", dragover, false);
dropbox.addEventListener("drop", drop, false);


$(document).on("change", ".videofile", function(evt) {
	  var $source = $('#video_here');

	  
	  $('.video_show').show();
	  $source[0].src = URL.createObjectURL(this.files[0]);
	  $source.parent()[0].load();
	});


function drop(e) {
	  e.stopPropagation();
	  e.preventDefault();

	  var dt = e.dataTransfer;
	  var files = dt.files;

	  handleFiles(files);
	}
function dragenter(e) {
	  e.stopPropagation();
	  e.preventDefault();
	}

	function dragover(e) {
	  e.stopPropagation();
	  e.preventDefault();
	}
	
	function handleFiles(files) {
		  for (var i = 0; i < files.length; i++) {
		    var file = files[i];
		    var imageType = /image.*/;
		    var videoType= /video.*/;

		    if (file.type.match(imageType)) {
		    	var img = document.createElement("img");
			    img.classList.add("obj");
			    img.file = file;
			    preview.appendChild(img);

			    var reader = new FileReader();
			    reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result; }; })(img);
			    reader.readAsDataURL(file);
		      
		    }else if(file.type.match(videoType)){
		    	var video = document.createElement("video");
			    video.classList.add("videoObj");
			    video.file = file;
			    preview.appendChild(video);

			    var reader = new FileReader();
			    reader.onload = (function(aVideo) { return function(e) { aVideo.src = e.target.result; }; })(video);
			    reader.readAsDataURL(file);
		    	
		    }else{
		    	
		    	continue;
		    	
		    }

		    
		  }
		}


	$('#file').change(function() {

		var file = $('#file')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#demo').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	//一鍵輸入
	
	function autoInput(){
		console.log('使用一鍵輸入');
		$('#title').val('保養品開箱');
		$('#sourcetype').val('1');
		$('#advOwner').val('ROHDE');
		$('#advCategory').val('保養品廣告');
		let date=new Date();	
		$('#postDate').val(getYYYYMMDD(date));
		date.setDate(date.getDate()+30);
		
		$('#endDate').val(getYYYYMMDD(date));
		$('#adsDesc').val('這是一個不錯的廣告');

// 		$('#videoFile').
		
		
	}
	
	function getYYYYMMDD(time) {
// 			let time=new Date();
		let mm=time.getMonth()+1;
		 if(mm<10){
			mm='0'+mm;	 
		 }
		 
		let date = (
		(time.getFullYear()) + "-" +mm + "-" +(time.getDate()));
		 
		 
		 
		 return date;
// 		 time.getFullYear()+mm+time.getDate()
	
	}
	
	


	
</script>


</body>

</html>