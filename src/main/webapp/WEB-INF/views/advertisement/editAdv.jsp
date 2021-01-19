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
							<label for="advLength">廣告長度</label>
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
						<tr id="imageRow">
							<td>上傳圖片</td>
							<td><input id="file" type="file" name="file" /></td>
						</tr>
						<tr id="previewRow">
							<td>圖片預覽 
							</td>
							<td>
							<img id="demo" class="preview"
								src=
								<c:if test='${not empty adv.source}'>
							<c:out value='"${adv.source}"'/>
	
							</c:if>	
							<c:if test='${empty adv.source}'>
							<c:out value="''"/>
							</c:if>
							
							onerror="javascript:this.src='${pageContext.request.contextPath}/image/noImage.jpg'"/>
							</td>
						</tr>

						<tr>

							<td colspan="2">
							
							 				
								<input type="submit" name="submit" value='${action}'> 
								<input type="reset" value="清除"></td>
						</tr>
					</table>
				</fieldset>

			</form:form>
			
		</div>
	</main>
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