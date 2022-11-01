<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기 페이지</title>
<style type="text/css">

	#table_1{
		width: 70%;
	}
	
	#con_1{
		margin-left: 25%;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}
	
	#tit_btn{
		margin-left: 690px;
		border: none;
		font-size: 18px;
		font-weight: normal;
		border-radius: 10px;
		width: 70px;
		height: 30px;
	}
	#tit_btn:hover {
		background-color: #ABABAB;
		font-weight: bold;
	}
	
	
</style>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
			<c:set var="dto" value="${Cont }" />
			<header>
				<c:if test="${member_id eq dto.getMember_id() }">
					<h2>게시글 상세조회<button id="tit_btn" onclick="location.href='<%=request.getContextPath()%>/write_modify.do?num=${dto.getWrite_num() }'">수정</button></h2>				
				</c:if>
				
				<c:if test="${member_id ne dto.getMember_id() }"> 
					<h2>게시글 상세조회</h2>
				</c:if>
				<br>
			</header>
			
			<table class="table table-bordered" id="table_1">
				<tr id="tr_1">
					<th id="th_1" style="width: 100px;">제목</th>
					<td colspan="3"> ${dto.getWrite_title() } </td>
					<th id="th_1">등록일</th>
					<td colspan="3"> ${dto.getWrite_date() } </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">작성자</th>
					<td> ${dto.getMember_id() } </td>
					<th id="th_1">글자수</th>
					<td> (${dto.getWrite_cont().length() }자 / 1000자) </td>
					<th id="th_1">조회수</th>
					<td> ${dto.getWrite_hit() } </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">내용</th>
					<td colspan="6">
						<textarea id="content" rows="17" cols="120" readonly>${dto.getWrite_cont() }</textarea>
					</td>
				</tr>
			</table>
			<%-- 여기서 관리자가 답변을 주었다면 관리자 답변도 함께 띄워주고 / 답변이 없다면 null이라면 콘텐츠만 띄워준다. --%>
			<div id="con_2">
			<c:set var="rdto" value="${Reply }" />
				<c:if test="${dto.getWrite_num() eq rdto.getWrite_num() }">
					<table class="table table-bordered" id="table_1">
						<tr>
							<th style="width: 100px;">↳ 답변</th>
							<td><span style="font-weight: bold; font-style: italic; font-size: 23px;">WATCHA</span><br>
								안녕하세요. 왓챠피디아입니다.<br><br>
								${rdto.getReply_cont() }<br><br>
								궁금하신 내용에 대해 도움이 되셨길 바랍니다.<br><br>
								감사합니다.😄<br>
							</td>
						</tr>
					</table>
				
				</c:if>
			
			</div>

		</div>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>
