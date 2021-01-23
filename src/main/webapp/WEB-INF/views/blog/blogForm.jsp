<%@page import="org.hibernate.graph.CannotContainSubGraphException"%>
<%@page import="blog.model.Blog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>部落格上傳</title>
<style>
.updateform {
	top: 100px;
	margin: auto;
	text-align: center;
	width: 80%;
	border: 1px inset brown;
	border-radius: 10px;
}

.preview {
	width: 200px;
	height: 200px;
	background-size: cover;
}

/* 背景圖 */
body {
  background-image: url('${pageContext.request.contextPath}/image/leaves.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed; 
  background-size: 100% 100%;
}

fieldset{
background-color:white;
}
</style>

</head>


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link href="${pageContext.request.contextPath}/css/editor.css"
	rel="stylesheet">

<%@include file="../jspf/header.jspf"%>



<!-- 	Breadcrumb Section Begin -->
<section class="breadcrumb-blog set-bg"
	data-setbg="${pageContext.request.contextPath}/image/breadcrumb-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>文章撰寫</h2>
			</div>
		</div>
	</div>
</section>
<!-- 	Breadcrumb Section End -->

<div style="text-align: center;background-image: url('pink-bg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;">

	<%
		Blog blog = (Blog) session.getAttribute("bg");
	%>
	<form:form method="POST" modelAttribute="blog"
		enctype='multipart/form-data'>
		<%-- 	<form:input path="thumbs" type="hidden" value="${blog.thumbs}" /> --%>
		<%-- 		<form:input path="blogId" type="hidden" value="${blog.blogId}" />  --%>
		<%-- 		<form:input path="picture" type="hidden" value="${blog.picture}" />  --%>
		<%-- 		<form:input path="commentTime" type="hidden" value="${blog.commentTime}" /> --%>
		<%-- 	 <form:input path="views" type="hidden" value="${blog.views}"/> --%>
		<form:input path="identify" type="hidden" value="blog" />


		<fieldset class="updateform">
			<legend class="title">部落格文章上傳</legend>
			<p>
				<label class="t1" for="">上傳者:</label>
				<form:input type="text" path="member" value="${member.name}"
					disabled='true' />
			</p>
			<!-- 			<p> -->
			<!-- 				<label for="blogCategory" class="t1">文章分類:</label>  -->
			<%-- 				<form:input type="text" path="blogCategory" id="blogCategory"/> --%>
			<%-- 				<form:select path="blogCategory" id="category"> --%>
			<%-- 					onchange="alert(this.options[this.selectedIndex].text)" --%>
			<%-- 					<form:option value="" disabled selected hidden>選擇類別</form:option> --%>

			<%-- 					<form:option value="保養教學">保養教學</form:option> --%>
			<%-- 					<form:option value="美照分享">美照分享</form:option> --%>
			<%-- 					<form:option value="心得隨筆">心得隨筆</form:option> --%>

			<%-- 			</form:select> --%>

			<!-- 			</p> -->
			<!-- 			文章封面 -->
			<p>
				<img id="demo" class="preview" name="icon"
					src=<c:if test='${not empty blog.picture}'>
							<c:out value="${pageContext.request.contextPath}/pic/${blog.picture}"/>
							
							</c:if>
					<c:if test='${empty blog.picture}'>
							<c:out value=""/>
							</c:if>
					alt=<c:out value='${blog.title}'/>
					onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">

				<label for="file"
					style="font-weight: bold; font-size: 20px; margin-left: 0px; margin-bottom: 20px">上傳封面照</label>
				<input type="file" name="file" id="file" style="font-size: 15px" />

			</p>

			<p>
				<label for="" class="t1">文章標題:</label>
				<form:input type="text" id="title" name="title" path="title"
					value="${title}" />
			</p>


			<label for="reflection">文章內文:</label>

			<div class="blog__details__text">
				<form:textarea id="editor" path="reflection" placeholder="請在這裡書寫文章" />
			</div>

			<!--隱藏選項共4個 -->

			<p>
				<input type="hidden" name="memberID" value="${member.id}" />
			</p>

			<input type="submit" name="confirmupdate" value="送出">
			<input type="button" id="onebutton" value="一鍵輸入">

		</fieldset>
	</form:form>
</div>
<%@include file="../jspf/footer.jspf"%>

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<!-- ckedit4 -->
<script src="//cdn.ckeditor.com/4.15.1/full/ckeditor.js"></script>

<!-- ckedit5 -->
<!-- <script -->
<!-- 	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script> -->

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



<script>
let one = CKEDITOR.replace( 'editor' );
$('#onebutton').on('click',function(){

	$('#title').val('Olay 高效透白光塑淡斑精華*美白精華');
	one.setData('<p><a href="+"https://yiping1228.pixnet.net/album/photo/252220058"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917119-764931698_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>開架網友默默狂屯的淡斑光感小白瓶&rarr;Olay 高效透白光塑淡斑精華*開架淡斑推薦、美白精華</p>'
		
		+'<p>很多朋友詢問我開架哪一項精華液跟專櫃一樣好用，CP值最高！媲美同個家族的K牌</p>'

		+'<p>我非常推薦Olay 高效透白光塑淡斑精華</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220012"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580916985-1565960051_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>連續三年開架銷售No.1不是浪得虛名</p>'

		+'<p><img alt="/tmp/phpTgbEz2" src="https://pic.pimg.tw/yiping1228/1580920653-37774632_l.jpg" title="/tmp/phpTgbEz2" />&nbsp;</p>'

		+'<p>獲得URCOSME美妝平台票選第二名</p>'

		+'<p><img alt="/tmp/php7Cw2Wl" src="https://pic.pimg.tw/yiping1228/1581470678-2903856810.jpg" title="/tmp/php7Cw2Wl" />&nbsp;&nbsp;</p>'

		+'<p>有著專櫃等級美白精華般的神級美白精華稱號</p>'

		+'<p>私底下網友暱稱開架必買小白瓶</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220040"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917053-1158275963_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;&nbsp;</p>'

		+'<p>專櫃的效果，開架的價格，讓我可以天天用不心疼！</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220016"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580916990-3907587890_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>市面上有眾多美白淡斑產品，但用起來很無感</p>'

		+'<p>這瓶Olay 高效透白光塑淡斑精華</p>'

		+'<p>水乳精華的質地，質地非常細緻~</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220650"><img alt="/tmp/phpdC5ajX" src="https://pic.pimg.tw/yiping1228/1580922180-1671287277_l.jpg" title="/tmp/phpdC5ajX" /></a>&nbsp;</p>'

		+'<p>裡面成分有著經過全新研發出的「日本光の學－珍珠光學科技」</p>'

		+'<p>添加最近爆紅成分99%煙醯胺B3與透白複合精華配方</p>'

		+'<p>能有效加速角質層更新，改善膚色暗沉</p>'

		+'<p>除此之外，還能幫助修護肌膚屏障，使肌膚健康又亮白</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220652"><img alt="/tmp/phppHXv4t" src="https://pic.pimg.tw/yiping1228/1580922180-2864465553_l.jpg" title="/tmp/phppHXv4t" /></a>&nbsp;</p>'

		+'<p>肌膚亮白的關鍵除了有效的美白成分還要搭配加強保濕</p>'

		+'<p>這瓶OLAY小白瓶除了主打的美白成分還有水分滲透調節精華</p>'

		+'<p>以智能水分調節因子提升肌膚內水分，全面提升肌膚水潤度</p>'

		+'<p>肌膚不僅要保濕更要閃閃發亮=///=</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220654"><img alt="/tmp/phpZDAv7d" src="https://pic.pimg.tw/yiping1228/1580922180-2505828992_l.jpg" title="/tmp/phpZDAv7d" /></a>&nbsp;&nbsp;</p>'

		+'<p>不像其它它牌精華液只能晚上使用</p>'

		+'<p>OLAY小白瓶早晚都可以使用（但早上大家還是要記得防曬喔），讓肌膚無間斷的美透亮</p>'

		+'<p>一次使用一滴管的量就可以擦完全臉</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220020"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580916999-2066608196_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>親膚性很好，用起來不油膩、不黏膩~</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220018"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580916999-703148633_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>精華的質地清爽好吸收，不會讓肌膚感到厚重油膩！</p>'

		+'<p>透過用手輕拍＋按摩，讓精華吸收更全面</p>'

		+'<p>帶著清新的香味，好喜歡它的味道</p>'

		+'<p>聞著聞著神經都放鬆了~</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220050"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917085-1369328632_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>吸收完後，我發現肌膚潤澤感更豐沛</p>'

		+'<p>光感小白瓶擁有日本珍珠光科學&nbsp;</p>'

		+'<p>能有效提升肌膚淨白跟透白度</p>'

		+'<p>幫助抵抗肌膚暗沉，提升透亮度</p>'
		

		+'<p>使用多天後淨白與透亮度也提升</p>'

		+'<p>像珍珠一樣，由內往外透出360度的柔潤光澤感~</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220014"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580916988-1370398979_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>對於比較蠟黃暗沉與斑點膚色不均的區域</p>'

		+'<p>我會再使用一滴管來加強改善並提升透亮度</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220048"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917083-464140691_l.jpg" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>敏弱肌的我用起來也覺得很舒適不刺激</p>'

		+'<p>終於找到一瓶開架有感的美白精華</p>'

		+'<p>給予肌膚深度亮白，令肌膚光度從底層全面透亮</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220036"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917042-104311378_l.jpg" style="height:658px; width:987px" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;&nbsp;</p>'

		+'<p>像我肌膚有一點暗沉不均勻，近看好像小花貓&gt; &lt;</p>'

		+'<p><img alt="/tmp/phpN17Nj1" src="https://pic.pimg.tw/yiping1228/1580921228-1744239876_l.jpg" title="/tmp/phpN17Nj1" />&nbsp;&nbsp;</p>'

		+'<p>每天兩滴OLAY高效透白光塑淡斑精華</p>'

		+'<p>小資價格讓我完全不心疼的用完一罐馬上再補</p>'

		+'<p>感覺我獲得更新還原</p>'

		+'<p>尤其膚色更均勻細緻，呈現出白裏透光的好膚質</p>'

		+'<p><img alt="/tmp/phpYi8hF1" src="https://pic.pimg.tw/yiping1228/1581597039-908173124_l.jpg" title="/tmp/phpYi8hF1" />&nbsp;&nbsp;</p>'

		+'<p>讓熬夜的肌膚不管再疲累，都能隱藏起來</p>'

		+'<p>肌膚亮到朋友都以為我去美容SPA</p>'

		+'<p><a href="https://yiping1228.pixnet.net/album/photo/252220054"><img alt="Olay 高效透白光塑淡斑精華" src="https://pic.pimg.tw/yiping1228/1580917115-3850777031_l.jpg" style="height:658px; width:987px" title="Olay 高效透白光塑淡斑精華" /></a>&nbsp;</p>'

		+'<p>天天使用Olay 高效透白光塑淡斑精華</p>'

		+'<p>比一個月去美容SPA，效果更好！</p>'


		)
})

</script>
</body>
</html>