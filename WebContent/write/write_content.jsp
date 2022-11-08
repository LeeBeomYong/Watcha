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
		padding: 25px 10px 25px 25px;
		background-color: #F0F0F0;
	}
	#con_3{
		padding: 10px;
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
				<c:if test="${session_id eq dto.getMember_id() }">
					<h2>${dto.getWrite_title() }<button id="tit_btn" onclick="location.href='<%=request.getContextPath()%>/write_modify.do?num=${dto.getWrite_num() }'">수정</button></h2>				
				</c:if>
				
				<c:if test="${session_id ne dto.getMember_id() }"> 
					<h2>${dto.getWrite_title() }</h2>
				</c:if>
				<br>
				<img id="pro_img" src="./image/profileupload/프로필_로고.png">
				<div>
					<b style="font-size: 19px;"> ${dto.getMember_id() } </b>
					<br>
					<a style="font-size: 13px; pointer-events: none; color: #757575;">${dto.getWrite_date().substring(0,16) } &nbsp; 조회 : ${dto.getWrite_hit() }  </a>
				</div>
				<hr>
				
			</header>
			
			<div id="con_2">
				<p>
				📢 본 게시판은 문의 게시판입니다.<br>
				📢 궁금하신 내용이나 불편한 점을 자유롭게 문의해 주세요.</p>
				
				문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.<br>
				* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00
			</div>
			<br>
			<div id="con_3">
			
				<p>${dto.getWrite_cont() }</p>
			
			</div>
			<p style="float: right; font-size: 12px;">(${dto.getWrite_cont().length() }자 / 1000자)</p>
			
			<br>
			
			<hr style="width: 100%;">
			
			
			<%-- 여기서 관리자가 답변을 주었다면 관리자 답변도 함께 띄워주고 / 답변이 없다면 null이라면 콘텐츠만 띄워준다. --%>
			<div>
			<c:set var="rdto" value="${Reply }" />
				<c:if test="${dto.getWrite_num() eq rdto.getWrite_num() }">
					<table id="table_1">
						<tr>
							<th style="font-size: 20px;">↳ 답변</th>
						</tr>
						<tr>
							<td><br><span style="font-weight: bold; font-style: italic; font-size: 23px;">WATCHA</span><br>
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
