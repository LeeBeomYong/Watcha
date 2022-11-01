<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#con1{
		width: 50%;
		margin-left: 25%;
		margin-top: 3%;
	}
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}	

</style>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	
	<div id="con1">
		<header>
			<h2>1:1 답변</h2>
			<br>
		</header>	
			
		<c:set var="rdto" value="${RCont }" />
			<table class="table table-bordered">
				<tr>
					<th>작성자</th>
					<td>${member_id }</td>
					<th>작성일</th>
					<td>${rdto.getW_date() }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<c:if test="${rdto.getW_file() ne null }">
						<td colspan="4">${rdto.getW_file() }</td>					
					</c:if>
					
					<c:if test="${rdto.getW_file() eq null }">
						<td colspan="4"><h6>첨부파일이 없습니다.</h6></td>					
					</c:if>
				</tr>
				<tr>
					<th>문의내용</th>
					<td colspan="4"><textarea id="content" rows="10" cols="90" readonly>${rdto.getW_cont() }</textarea>
				</tr>
				
			
			</table>

			<c:set var="dto" value="${RRCont }" />
			<table class="table table-bordered">
				<tr>
					<th style="width: 100px;">↳ 답변</th>
					<td><span style="font-weight: bold; font-style: italic; font-size: 23px;">WATCHA</span><br>
						안녕하세요. 왓챠피디아입니다.<br><br>
						${dto.getR_cont() }<br><br>
						궁금하신 내용에 대해 도움이 되셨길 바랍니다.<br><br>
						감사합니다.😄<br>
					</td>				
				</tr>
			</table>


	</div>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>