<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
</head>
<body>
	<!-- 게시판 등록 -->
	<section id="writeForm">
		<h2>게시판글등록</h2>
		<form action="boardWritePro.do" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tbody>
					<tr>
						<td class="td_left">
							<label for="BOARD_NAME">글쓴이</label>
						</td>
						<td >
							<input type="text" name="BOARD_NAME" id="BOARD_NAME" required />
						</td>
					</tr>
					<tr>
						<td class="td_left">
							<label for="BOARD_PASS">비밀번호</label>
						</td>
						<td>
							<input name="BOARD_PASS" type="password" id="BOARD_PASS" required />
						</td>
					</tr>
					<tr>
						<td class="td_left">
							<label for="BOARD_SUBJECT">제 목</label>
						</td>
						<td >
							<input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required />
						</td>
					</tr>
					<tr>
						<td class="td_left">
							<label for="BOARD_CONTENT">내 용</label>
						</td>
						<td>
							<textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required></textarea>
						</td>
					</tr>
					<tr>
						<td class="td_left">
							<label for="BOARD_FILE"> 파일 첨부 </label>
						</td>
						<td >
							<input name="BOARD_FILE" type="file" id="BOARD_FILE" required /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" id="commandCell">
							<input type="submit" value="등록">&nbsp;&nbsp; 
							<input type="reset" value="다시쓰기" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>