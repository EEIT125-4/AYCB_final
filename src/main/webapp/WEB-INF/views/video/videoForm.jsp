<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // 不想要暫存 Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css">

<title>編輯影片</title>

<style>

.t1{

   			padding: 5px;
            border-radius: 10px;
            border: black 1px outset;
			width:100%;
/*             width: fit-content; */

/*             height: fit-content; */
            background-color: yellow;
            text-align: center;
/*             padding-left: 20px; */
/*             padding-right: 20px; */
/*             margin: 5px; */
/*             min-width: 100px; */
			color:blue;

}

</style>
</head>



<%@include file="../jspf/header.jspf"%>

<section style="background-image: url(${pageContext.request.contextPath}/image/backstage2.jpg);background-size: cover;">>


	<div class="updateform">

		<form:form method="POST" modelAttribute="video"
			enctype='multipart/form-data'>
			<fieldset>
				<legend class="title">影片編輯</legend>
	
				
				<input type='hidden' value='${member.id}' name='memberId'/>
				<form:input type='hidden' path="videoId" value='${video.videoId}' />
				<p>
					<label for="title" class="t1">影片標題:</label>
					<br>
					<form:input type="text" id="title" path="title" value="${video.title}" placeholder="影片標題"/>

				</p>
				<p>
				<label for="category" class="t1">影片分類</label>
				<br>
				<form:select id="category"  path="category" value="${video.category }">

							<form:option value="開箱影片" label="開箱影片"/>
							<form:option value="保養教學" label="保養教學"/>
							<form:option value="業配推廣" label="業配推廣"/>
							<form:option value="其他" label="其他"/>
							</form:select>
				
				</p>
				<p>
				<label for="description" class="t1" value="${video.description }">影片簡介</label>
				<br>
				<form:textarea id="description" path="description" cols="50" rows="5" placeholder="向大家介紹你的影片"></form:textarea>
				
				</p>
				
		
				
						<p>上傳圖片:
						<input id="imagefile" type="file" name="imagefile" accept="image/*">
						</p>
					
						<p>圖片預覽:
						<img id="imageDemo" class="demo" style="width: 320;height: 240;" src="${video.coverUrl}" onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">

					
						</p>

			

				<p>上傳影片:
				
					<input id="videofile" name="videofile"  type="file"   accept="video/*">
					
				</p>
				<p>
				
				
<!-- 					style='display:none' -->
<%-- src="${video.url }" --%>
				<video width="320" height="240	"  muted controls='controls'  id="video_show" >
						<source src="${video.url }" id="video_here">
						</video>
				
				
				
				
				</p>				
				

				<input type="submit" name="confirmupdate" value="送出">
				<button type="button" class="test" onclick="autoInput()">TEST</button>


			</fieldset>


		</form:form>
	</div>
</section>


<%@include file="../jspf/footer.jspf"%>


<!-- Blog Section End -->

<!-- Js Plugins -->
<!-- 	Kevin:這裡非常奇怪,header已經載入過的js失效,且必須在body末端加入才有效?? -->
<%-- <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>




<script>
//一鍵輸入

function autoInput(){
	console.log('使用一鍵輸入');
	$('#title').val('保養品推薦');
	
	
	$('#category').val('開箱影片');
	
	$('#description').text(
			
			"｜簡介｜"
			+"我的膚質是混合肌偏乾、T字油、兩頰乾燥還會小敏感<br>"
			+"回憶我皮膚最好的時期是國高中<br>"
			+"上大學後皮膚越來越差、粉刺發芽的速度又猛又急！從沒停過是怎樣！<br>"
			+"幾年前我膚況超慘超爛<br>"
			+"滿滿粉刺、容易發紅、換季發癢<br>"
			+"試了超多保養品不是沒用就是一開始不錯、擦到一半又變差了<br>"
			+"我也看過皮膚科，擦過A酸也吃過A酸好久，都沒太大的改變<br>"
			+"的確還是有控制一些沒錯，但也不是完全～很快就打回原形<br>"

			+"後來我才檢視自己的習慣：<br>"
			+"1.保養品太多瓶瓶罐罐！NONO<br>"
			+"2.亂做臉！別人說厲害的就都做都打？<br>"
			+"(曾經去一家模特兒界流傳的厲害美容室做臉，越做越慘...)<br>"
			+"3.作息如何？有沒有愛喝動物性鮮奶呢？<br>"

			+"開始改變習慣，極簡保養對你來說可能就非常足夠了唷<br>"
			+"當然肌膚不會一下子就給你回饋<br>"
			+"要慢慢養、耐心養！好皮膚會回來的！！<br>"
			+"雖然我現在也不是仙女肌，不過跟以前比真的好太多了！非常感動<br>"
			+"上這支影片時，我近期最常使用組合是：Dailyme凍膜、輕鬆美膚乳液、ipsa流金水<br>"
			+"給你們參考歐:D<br>"
			
			
			);
	
	



//		$('#videoFile').
	
	
}

//圖片預覽
$('#imagefile').change(function() {

	var imagefile = $('#imagefile')[0].files[0];
	var reader = new FileReader;
	reader.onload = function(e) {
		$('#imageDemo').attr('src', e.target.result);
	};
	reader.readAsDataURL(imagefile);
});

//影片預覽
	$(document).on("change", "#videofile", function(evt) {
		
	  let $source = $('#video_here');

	  
	  $('#video_show').show();
	  $source[0].src = URL.createObjectURL(this.files[0]);
	  $source.parent()[0].load();
	});






</script>


<script>
// 	var link_area = document.getElementById('link');
// 	var file_area = document.getElementById('file');

// 	function refresh() {

// 		let choice = document.getElementById("option");
// 		let result = choice.value;
// 		console.log("value=" + result);

// 		if (choice.value == 1) {
// 			link_area.style.display = "block";
// 			file_area.style.display = "none";

// 		} else {
// 			link_area.style.display = "none";
// 			file_area.style.display = "block";

// 		}

// 	}
</script>

</body>
</html>