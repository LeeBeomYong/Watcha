<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	div {
		display: flex;
		justify-content: center;
		align-content: center;
		top: 50%;
	} 
	
	body {
		margin-top: 30%;
	}
	
</style>
</head>
<body>
	<div align="center">
		<form method="post" action="<%=request.getContextPath()%>/delete_ok.do">
			<table border="1" cellspacing="0">
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="pwd"> 
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>