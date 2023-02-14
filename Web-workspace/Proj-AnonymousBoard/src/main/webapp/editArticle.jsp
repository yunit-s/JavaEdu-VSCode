<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
</head>
<body>

	<header>
		<button onclick="history.back()">뒤로가기</button>
	</header>
	
	
	
	<div style="text-align: center">
		<h3>글 수정하기</h3>
	</div>
	
	<form action="editArticleResult" method="post">
		<table style="margin-left:auto; margin-right:auto;">
			<tr>
				<td style="text-align: right">글 제목 : </td>
				<td><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<td style="text-align: right">글 작성자 : </td>
				<td><input type="text" name="boardAuthor" value="작성자id" disabled="true"></td>
			</tr>
			<tr>
				<td style="text-align: right">글 내용 : </td>
				<td><input type="text" name="boardContent"></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: right"><button type="submit">수정 완료</button></td>
			</tr>
		</table>
	</form>

</body>
</html>