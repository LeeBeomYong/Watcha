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
	
	.CommentWriter {
	    margin: 12px 0 29px;
	    padding: 16px 10px 10px 18px;
	    border: 2px solid #C6C6C6;
	    width: 70%;
	    border-radius: 6px;
	    box-sizing: border-box;
	    background: var(--skinCommentWriterBg);
	}
	.CommentWriter .comment_inbox_text {
    overflow-x: hidden;
    overflow-y: auto;
    display: block;
    width: 100%;
    min-height: 17px;
    padding-right: 1px;
    border: 0;
    font-size: 13px;
    -webkit-appearance: none;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    color: var(--skinTextColor);
    outline: 0;
}
	
	.CommentWriter .comment_inbox {
    position: relative;
    margin-bottom: 10px;
	}
	
	.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
	}

	.CommentWriter .register_box .button {
    display: inline-block;
    min-width: 46px;
    height: 34px;
    line-height: 36px;
    font-size: 13px;
    color: var(--skinCommentWriterText);
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
}

textarea.comment_inbox_text[data-v-3b426d7d] {
    max-height: 500px;
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
	border: none;
	background-color: white;
}

</style>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
		<form method="post" action="<%=request.getContextPath()%>/free_modify_ok.do">
			<c:set var="dto" value="${Modify }" />
			<input type="hidden" name="free_num" value="${dto.getFree_num() }">
			<header>
				<p style="color: red;">[ 수정중 ]</p>
					<h2><input name="free_title" value="${dto.getFree_title() }"></h2>
				<br>
				<img id="pro_img" src="./image/profileupload/프로필_로고.png">
				<div>
					<b style="font-size: 19px;"> ${dto.getMember_id() } </b>
					<br>
					<a style="font-size: 13px; pointer-events: none; color: #757575;">${dto.getFree_date().substring(0,16) } &nbsp; 조회 : ${dto.getFree_hit() } </a>
					<input id="tag_1" type="submit" value="수정완료" style="margin-left: 69%;">
				</div>
				<hr>
			</header>
			
				<div id="con_2">
					<p>
					📢 본 게시판은 왓챠 회원님들의 영화 정보 공유게시판입니다.<br>
					📢 욕설이나 비난글을 작성할 시 활동정지, 영구강퇴 될 수 있음을 알려드립니다.</p>
				</div>
				<br>
				<div id="con_3">
				
					<p><textarea name="free_cont">${dto.getFree_cont() }</textarea></p>
				
				</div>
				<p style="float: right; font-size: 12px;">(${dto.getFree_cont().length() }자 / 1000자)</p>
		
		<br>
		
		<hr style="width: 100%;">
		</form>
	</div> <%-- 전체 컨테이너 div --%>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />
	
	
</body>
</html>