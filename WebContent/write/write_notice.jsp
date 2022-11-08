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

	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
			<c:set var="ndto" value="${NCont }" />
			
			<header>
				<h2>❗ 공지사항 ❗</h2>
				<br>
				<h4>${ndto.getNotice_title() }</h4>
				<br>
				<img id="pro_img" src="./image/profileupload/프로필_로고.png">
				<div>
					<b style="font-size: 18px;">관리자</b>
					<br>
					<a style="font-size: 13px; pointer-events: none; color: #757575;">${ndto.getNotice_date() } &nbsp; 조회 : ${ndto.getNotice_hit() } </a>				
				</div>
				<hr>
			</header>
				<div id="con_2">
					<p>
					📢 본 공지사항을 필독 부탁드립니다.<br>
					📢 욕설이나 비난글을 작성할 시 활동정지, 영구강퇴 될 수 있음을 알려드립니다.</p>
				</div>
				<br>
				<div id="con_3">
				
					<p>${ndto.getNotice_content() }</p>
				
				</div>
				<p style="float: right; font-size: 12px;">(${ndto.getNotice_content().length() }자 / 1000자)</p>
		
		<br>
		
				
		</div>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />



</body>
</html>