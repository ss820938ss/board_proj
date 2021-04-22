<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/delete.css">

</head>
<body>
<%-- ${page }<br>${board_num } --%>

	<section >
		<form name="deleteForm" method="post" action="boardDeletePro.do" >
			<input type="hidden" name="page" value="${page }" />
			<input type="hidden" name="board_num" value="${board_num }">
			<fieldset id="passForm">
				<legend>게시글 삭제</legend>
				<ul>
					<li>
						<label for="pass">글 비밀번호 :</label>
						<input type="password" name="BOARD_PASS" size="20" id="pass" autofocus required>
					</li>
					<li id="btn">
						<input type="submit" value="삭제" /> &nbsp;&nbsp; 
						<input type="button" value="돌아가기" onClick="javascript:history.go(-1)" />
					</li>
				</ul>
			</fieldset>
		</form>
	</section>
</body>
</html>