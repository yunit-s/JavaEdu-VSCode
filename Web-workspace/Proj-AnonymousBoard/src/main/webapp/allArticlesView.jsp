<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.vo.Member, board.vo.Board, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 글 보기</title>
</head>
<body>

	<%
	// input data
	// data from session
	Member loginMember = (Member)session.getAttribute("loginMember");
//	try {
//		loginMember = (Member)session.getAttribute("loginMember");
//	} catch (Exception e) {
//		System.out.println("!!! allArticlesView.jsp에서 session오류 발생");
//		response.sendRedirect("sessionError.jsp");
//	}
	if (loginMember == null) {
		System.out.println("!!! Session Expiration! (allArticlesView.jsp)");
		response.sendRedirect("sessionError.jsp");
	}
	
	// data from request
	List<Board> bList = (List<Board>)request.getAttribute("bList");
	
	%>
	
	<header>
		<div style="text-align: right">
			login : <%= loginMember.getMemberName() %>
		</div>
		<form action="logout" method="post" style="text-align: right">
			<button type="submit">로그아웃</button>
		</form>
	</header>
	
	
	
	<h3 style="text-align: center">전체 글 보기</h3>
	
	<!-- 새 글 작성 -->
	<form action="newArticleCall" method="post" style="text-align: center">
		<button type="submit">새 글 작성</button>
	</form>

	<!-- 게시글 목록 -->
	<table border="2" style="text-align: center; margin-left:auto; margin-right:auto;">
		<thead>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글 작성자</th>
			<th>작성일</th>
			<th>좋아요 수</th>
		</thead>
		<tbody>
			<%
			if (!bList.isEmpty()) {
				for (Board article : bList) {
					int bNum = article.getBoardNum();
					String bTitle = article.getBoardTitle();
					String bAuthor = article.getBoardAuthor();
					String bDate = article.getBoardDate();
					int bLike = article.getBoardLike();
			%>
				<tr>
					<td><%= bNum %></td>
					<td>
						<a href="articleDetailsCall?bNum=<%= bNum %>">
							<%= bTitle %>
						</a>
					</td>
					<td><%= bAuthor %></td>
					<td><%= bDate %></td>
					<td><%= bLike %></td>
				</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>

</body>
</html>