<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


<style type="text/css">
	
	* {
	  box-sizing: border-box;
	}
	body {
	  font-family: "Montserrat", sans-serif;
	  margin: 0;
	  padding: 0;
	}

/* 	textarea { */
/* 	  background: #eee; */
/* 	  padding: 16px; */
/* 	  margin: 8px 0; */
/* 	  width: 85%; */
/* 	  border: 0; */
/* 	  outline: none; */
/* 	  border-radius: 20px; */
/* 	  box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;		 */
/* 	} */
/* 	button { */
/* 	  border-radius: 20px; */
/* 	  border: none; */
/* 	  outline: none; */
/* 	  font-size: 12px; */
/* 	  font-weight: bold; */
/* 	  padding: 15px 45px; */
/* 	  margin: 14px; */
/* 	  letter-spacing: 1px; */
/* 	  text-transform: uppercase; */
/* 	  cursor: pointer; */
/* 	  transition: transform 80ms ease-in; */
/* 	} */
	
/* 	#di { */
/* 		width: 1100px; */
/* 		height: 900px; */
/* 		margin-top: 100px; */
/* 		margin-bottom: 100px; */
/* 		border:1px solid lightgray; */
/* 	} */
	
	#aa {
		margin-left: 800px;
		margin-right: 800px;
	}
	
</style>
</head>
<body>
	<jsp:include page = "../include/user_top.jsp" />
	<c:set var="dto" value="${profileList }"/>
	<div id="aa">
	      	<div id="di">
			      <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/profile_update.do" style="width: 500px; margin-top: 50px;">
					  <div class="mb-3">
					    <label for="member_id" class="form-label">아이디</label>
					    <input name="pr_id" type="text" class="form-control" id="member_id" value="${dto.getMember_id()}" readonly style="background-color: #fff">
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_name" class="form-label">이름</label>
					    <input name="pr_name" type="text" class="form-control" id="member_name" value="${dto.getMember_name()}">
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_password" class="form-label">비밀번호</label>
					    <input name="pr_pwd" type="password" class="form-control" id="member_password" value="${dto.getMember_pwd()}">
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_intro" class="form-label">자기소개</label>
					    <textarea rows="7" cols="25" name="pr_intro" class="form-control" id="member_intro">${dto.getMember_profile()}</textarea>
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_birth" class="form-label">생년월일</label>
					    <input name="pr_birth" type="text" class="form-control" id="member_birth" value="${dto.getMember_birth()}">
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_img" class="form-label">프로필이미지</label>
					    <input name="pr_img" type="file" class="form-control" id="member_img" value="${dto.getMember_image()}">
					  </div>
					  
					  <div class="mb-3">
					    <label for="member_email" class="form-label">이메일</label>
					    <input name="pr_email" type="text" class="form-control" id="member_email" value="${dto.getMember_email()}">
					  </div>
					  
					  <diV align="center">
					  <br><br>
					  <button type="submit" class="btn btn-primary">수정</button>
					  </diV>
				  </form>
 	   		</div>
 	</div>
 	<br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>