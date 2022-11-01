<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인 페이지</title>
<style type="text/css">
	
	.input_box{
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 21px;
	}
	
	.input_box:hover{
	background-color: #e2e2e2;
	}

	table {
	  border-collapse: separate;
	  border-spacing: 0 10px;
	}
	
	h3{
	background-color: #A1E0FF;
	width:200px;
	border-radius: 10px;
	}

</style>
</head>
<body>

	<div align="center">
		<h3>사용자 로그인 페이지</h3>	
		
		<form method="post" action="<%=request.getContextPath() %>/main.do">
			<table>
				<tr>
				    <th>사용자 아이디</th>
					<td>
						<input name="member_id" class="input_box" style="height: 20px;">
					</td>
				</tr>			
				
				<tr>
					<th>사용자 비밀번호</th>
					<td>
						<input type="password" class="input_box" name="write_pwd" style="height: 20px;">
					</td>
				</tr>
				
				<tr>
					<td>
					
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn" value="로그인"> &nbsp;
						<input type="reset" class="btn" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>