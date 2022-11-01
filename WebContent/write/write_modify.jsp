<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/write/write_css/write_modify_css.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	// textarea에서 입력한 글자 만큼 세주는 함수.	
	$(document).ready(function() {
	    $('#content').on('keyup', function() {
	        $('#cnt').html("("+$(this).val().length+" / 1000)");
	 
	        if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('#cnt').html("(1000 / 1000)");
	        }
	    });
	});

</script>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
		<form method="post" action="<%=request.getContextPath() %>/write_modify_ok.do">
			<c:set var="dto" value="${Modify }" />
			<input type="hidden" name="write_num" value="${dto.getWrite_num() }">
			<header>
				<h2>게시글 수정 <input type="reset" id="tit_btn1" value="초기화"><input type="submit" id="tit_btn" value="수정완료"></h2>
				<br>
			</header>
			
			<table class="table table-bordered" id="table_1">
				<tr>
					<th>제목</th>
					<td colspan="3"> <input name="write_title" id="tit" value="${dto.getWrite_title() }" style="width: 100%;"> </td>
					<th>등록일</th>
					<td colspan="3"> ${dto.getWrite_date() } </td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td> ${dto.getMember_id() } </td>
					<th>글자수</th>
					<td><span id="cnt">(${dto.getWrite_cont().length() }자 / 1000자)</span></td>
					<th>조회수</th>
					<td> ${dto.getWrite_hit() } </td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="6">
						<textarea id="content" name="write_cont" rows="20" cols="120">${dto.getWrite_cont() }</textarea>
					</td>
				</tr>
			</table>
			
		</form>
		</div>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>
