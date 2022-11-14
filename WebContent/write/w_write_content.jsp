<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#table_1{
		
	}
	
	#con_1{
		margin-left: 23%;
		margin-top: 30px;
		margin-bottom: 50px;
		border: 1px solid #c6c6c6;
		width: 55%;
		padding: 40px 30px 30px 30px;
		border-radius: 10px;
	}
	
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}

	
	
	#re_writer{
		border: none;
		pointer-events: none;
		font-weight: bold;
		width: 500px;
	}	
	
	#re_content{    
		width: 100%;
	    border: none;
	    resize: none;
	    outline: none;
	}
	
	#replyBtn{
		border: none;
	    font-size: 15px;
	    border-radius: 6px;
	    text-align: center;
	    background-color: white;
	    float: right;
	}
	
	#con_2{
		border: 1px solid #c6c6c6;
		border-radius: 10px;
		padding: 25px 10px 10px 25px;
		background-color: #F0F0F0;
	}
	
	#con_3{
		padding: 10px;
	}
	
	#con_4{
	}
	
	#pro_img{
	
		width: 35px;
		height: 35px; 
		margin: 0; 
		float: left; 
		margin-top: 10px;
		margin-left: 10px; 
		margin-right: 10px;
	}
	
	#tag_1{
		font-weight: bold; 
		color: #000; 
		text-decoration: none;
	}
	
</style>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	
	<div id="con_1">
		<c:set var="rdto" value="${RCont }" />
<%-- 		<c:set var="dto1" value="${userProfile }" /> --%>
		<header>
			<h2>1:1 답변</h2>
				<br>
				<img id="pro_img" src="${pageContext.request.contextPath }/image/profileupload/${dto.getW_image()}">
				<div>
					<b style="font-size: 19px;"> ${session_id } </b>
					<br>
					<a style="font-size: 13px; pointer-events: none; color: #757575;">${rdto.getW_date().substring(0,16) }</a>
				</div>
				<hr>
		</header>	
		

			<div id="con_2">
				<p>
				📢 본 게시판은 왓챠 회원님들의 영화 정보 공유게시판입니다.<br>
				📢 욕설이나 비난글을 작성할 시 활동정지, 영구강퇴 될 수 있음을 알려드립니다.</p>
			</div>
			<br>		
						
			<div id="con_4">
				<c:if test="${rdto.getW_file() ne null }">
					<a href="<%=request.getContextPath() %>/w_write_file/${rdto.getW_file() }">📂${rdto.getW_file() }</a>			
				</c:if>
			</div>
			<br>
			
			<div id="con_3">
			
				<p>${rdto.getW_cont() }</p>
			
			</div>

			<hr>

			<c:set var="dto" value="${RRCont }" />
			<c:if test="${rdto.getW_num() eq dto.getR_num() }">
					<table id="table_1">
						<tr>
							<th style="font-size: 20px;">↳ 답변</th>
						</tr>
						<tr>
							<td><br><span style="font-weight: bold; font-style: italic; font-size: 23px;">WATCHA</span><br>
								안녕하세요. 왓챠피디아입니다.<br><br>
								${dto.getR_cont() }<br><br>
								궁금하신 내용에 대해 도움이 되셨길 바랍니다.<br><br>
								감사합니다.😄<br>
							</td>
						</tr>
					</table>
			</c:if>
			
	</div>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>