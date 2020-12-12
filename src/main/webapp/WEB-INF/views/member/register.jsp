<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link REL=STYLESHEET HREF="css/member.css" TYPE="text/css">
<link rel="icon" href="image/logo.ico" type="image/x-icon">
<title>註冊</title>
</head>
<%@include file="../jspf/header.jspf"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="position: relative; top: 200px;">
	<fieldset
		style="margin: auto; border: 3px solid black; border-radius: 20px; width: 550px;">
		<legend
			style="background-color: lightgray; border-radius: 3px; width: 60px; margin: 0 auto; text-align: center;">註冊</legend>
		<form action="../RegisterServlet" method="post">
			<table>
				<br>
				<tr>
					<td>*姓名</td>
					<td><input class="abc" type="text" name="name" id="realname">
					</td>
				</tr>
				<tr>
					<td>*性別</td>
					<td><input type="radio" name="gender" value="男">先生 <input
						type="radio" name="gender" value="女">小姐</td>
				</tr>
				<tr>
					<td>*帳號</td>
					<td><input class="ddd" type="text" name="acc" id="acc"
						onblur="Ckac();"></td>
						<span id="idsp" style="color: red;"></span> 
				</tr>
				<tr>
					<td>*密碼</td>
					<td><input class="ddd" type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>*確認密碼</td>
					<td><input class="ddd" type="password" name="cpwd" id="cpwd">
					</td>
				</tr>
				<tr>
					<td>*信箱</td>
					<td><input class="ccc" type="text" name="email" id="email"></td>
				</tr>
				<tr>
					<td>*生日</td>
					<td><div>
							<input type="date" class="bb" name="bday" id="bday">
								

						</div></td>
			</table>
			<div style="margin-left: 250px">
				<button style="width: 50px;" class="sb" type="submit" name="submit">註冊</button>
			</div>
		</form>
	</fieldset>
</div>




</body>
</html>