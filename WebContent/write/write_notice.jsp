<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 content</title>
<style type="text/css">



	#table_1{
		width: 65%;
	}
	
	#con_1{
		margin-left: 300px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}
	
</style>
</head>
<body>

	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
			<c:set var="ndto" value="${NCont }" />
			
			<header>
				<h2>공지사항</h2>
				<br>
			</header>
			
			<table class="table table-bordered" id="table_1">
				<tr id="tr_1">
					<th id="th_1">제목</th>
					<td colspan="3"> ${ndto.getNotice_title() } </td>
					<th id="th_1">등록일</th>
					<td colspan="3"> <%-- ${ndto.getNotice_date() } --%> </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">작성자</th>
					<td> 관리자 </td>
					<th id="th_1">글자수</th>
					<td> (${ndto.getNotice_content().length() }자 / 1000자) </td>
					<th id="th_1">조회수</th>
					<td> ${ndto.getNotice_hit() } </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">내용</th>
					<td colspan="6">
						<textarea id="content" rows="20" cols="120" readonly>${ndto.getNotice_content() }</textarea>
					</td>
				</tr>
			</table>
				
		</div>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />



</body>
</html>