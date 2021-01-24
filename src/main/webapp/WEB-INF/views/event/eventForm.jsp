<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventpage.css">
<meta charset="UTF-8">
<title>新增活動</title>
</head>
<%@include file="../jspf/header.jspf"%>

<div class='container' style="margin-bottom: 80px"> 
	<form:form method="POST" modelAttribute="event" enctype='multipart/form-data'>
		<fieldset>
			<legend>
				<h2>新增活動</h2>
			</legend>
			<div class="form-inline ">
					<img id="imageDemo" class="preview" name="icon"
								src=<c:if test='${not empty member.getId()}'>
							<c:out value="'${pageContext.request.contextPath}/image/noImage.jpg'"/>
							
							</c:if>
								<c:if test='${empty member.id}'>
							<c:out value=""/>
							</c:if>
								alt=""
								onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'">
				</div>
			<div>
				<label class="label1" >活動名稱:</label> 
				<form:input type='text' path="eventname" id="eventname"/>
				<form:errors path="eventname" cssStyle="font-size:15px; color:red"/><br>					
			</div>
 			<div>
 				<label class="label1" >活動類別:</label> 
				<form:select type='text' path="eventcategory" id="eventcategory">					
				<form:option value="NONE"  label="請選擇"/>					
				<form:option value="體驗"    label="體驗"/>					
				<form:option value="教學"    label="教學"/>					
				<form:option value="新品發表"    label="新品發表"/>					
				<form:option value="促銷"     label="促銷"/>					
				<form:option value="其他"     label="其他"/>
				</form:select>
				<form:errors path="eventcategory" cssStyle="font-size:15px; color:red"/><br>					
 			</div> 
			<div>
				<label class="label1">活動日期:</label> 
				<form:input type='date'  path="eventdate" id="eventdate"/>
				<form:errors path="eventdate" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div >
				<label class="label1">活動地點:</label> 
				<form:input type='text' path="eventlocation" id="eventlocation"/>
				<form:errors path="eventlocation" cssStyle="font-size:15px; color:red"/><br>
			</div>			
			<div>
				<label class="label1">活動聯絡人:</label> 
				<form:input type='text' path="host" id="host"/>
				<form:errors path="host" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div>
				<label class="label1">聯絡電話:</label> 
				<form:input type='text' path="hostphone" id="hostphone"/>
				<form:errors path="hostphone" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div>
				<label class="label1">名額:</label> 
				<form:input type='text' path="totalpax" id="totalpax"/>
				<form:errors path="totalpax" cssStyle="font-size:15px; color:red"/><br>					
			</div>

			<div>
				<label class="label1">活動簡介:</label> 
				<form:textarea type='text' path="eventdescription" id="eventdescription"/><br>
			</div>
			<div>
				<label class="label1">活動圖片:</label> 
				<input name="file" type="file"  id="imageFile"/>
				<form:errors path="filename" cssStyle="font-size:15px; color:red"/><br>
			</div>
			<div class="sub">
				<input type='submit' name='name' value='提交'> 
				<input type='reset' name='name' value='還原'><br>
				
					
			</div>
                 <input type="button" id="express" value="一鍵輸入">	
		</fieldset>
	</form:form>
</div>
<%@include file="../jspf/footer.jspf"%>
<script src="${pageContext.request.contextPath}/js/preview.js"></script>
</body>
<script>

 $('#express').click(function(){
	 $('#eventname').val('2021-01-24')
	 $('#eventcategory').val('促銷')
	 $('#eventdate').val('2021-03-22')
	 $('#eventlocation').val('台北101')
	 $('#host').val('Linda')
	 $('#hostphone').val('0977777777')
	 $('#totalpax').val('32')
	 $('#eventdescription').val('【新品促銷】 #PR話題推薦 PR敏感肌限定！網友真心認證”神盾級的防護果然不一樣！” 膚況再也不會大崩潰！ / CLARINS 克蘭詩 身為敏感肌族群一員的小編很懂每次肌膚無預警鬧脾氣的苦，面對因為肌膚表皮保護功能不佳、碰上刺激就過度反應的神經感受失調而造成各種敏感問題，像皮膚乾燥、臉脫皮、緊繃只是家常便飯，皮膚乾癢、臉頰泛紅甚至刺痛等關卡又是更大的考驗，一旦稍有不慎，肌膚狀況可以想見將會是慘到崩潰！跟勝負欲超強的小編一樣只想贏！？沒問題，就用CLARINS克蘭詩快樂鼠尾草舒敏系列的神盾級防護力讓敏感肌更穩定、更健康吧！')
	 
 })



</script>
</html>