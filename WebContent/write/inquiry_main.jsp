<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A / 1:1문의 작성 및 목록 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/write/write_css/inquiry_css.css" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script type="text/javascript">

	// 탭 두개 콘텐츠 값 다르게 보여주는 함수.
	$(document).ready(function(){
		   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  });

	});

	// 내용 입력 textarea에서 글자수 세주는 함수.
	$(document).ready(function() {
	    $('#exampleFormControlTextarea1').on('keyup', function() {
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
	<br>
	<%-- 전체 콘테이너 --%>
	<div id="con">
	 <br>
	 

	 <%-- 탭 메뉴 --%>
	  <ul id="tabs" class="tabs">
	    <li class="tab-link current" data-tab="tab1">Q&A문의</li>
	    <c:if test="${!empty session_id }">
		    <li class="tab-link" data-tab="tab2">1:1문의</li>	    
	    </c:if>
	  </ul>
	  <%-- 탭 1 버전!!! --%>
	  <div id="tab1" class="tab-content current">
		<p>📢 본 게시판은 문의 게시판입니다.<br><br>
		* 궁금하신 내용이나 불편한 점을 자유롭게 문의해 주세요.<br>
		* 욕설이나 비난글은 자제해주세요.</p>
	 	<br>
		
		<%-- 검색 기능 폼 --%>
		<div id="btnId">
		<form class="d-flex" role="search" method="post" action="<%=request.getContextPath() %>/write_search.do">
			<select id="sel" name="search_field" style="height: 35px;">
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목&내용</option>
				<option value="writer">작성자</option>
			</select>
				&nbsp;
			<input class="form-control me-2" type="search" name="search_keyword" style="width: 500px; height: 35px;">
			<button id="btn2" class="btn btn-outline-success" type="submit">검색</button>
			<a class="total" href="inquiry_main.do">전체목록</a>
			
			<%-- 문의 등록 폼 버튼 --%>
			<button id="btn1" onclick="event.cancelBubble=true;"><a href="write_upload.do">문의등록</a></button>
		</form>
		</div>
		
		<%-- 데이터 리스트 시작!!! --%>
		<table class="table table-hover">
			<thead style="background-color: #DADADA;">
			<tr class="tt">
				<th style="text-align: center;">번호</th>
				<th class="wrt">작성자</th>
				<th class="tit">문의제목</th>
				<th style="text-align: center;">작성일자</th>
				<th style="text-align: center;">조회수</th>
				<th style="text-align: center;">상태</th>
			</tr>		
			</thead>
			
			<%-- 공지사항 받아온 것 리스트 --%>
			<c:set var="list_1" value="${List_1 }" />
				<c:forEach items="${list_1 }" var="dto_1">
				<tr class="tt" style="background-color: #F0EFEF;" onclick="location.href='<%=request.getContextPath() %>/notice_content.do?no=${dto_1.getNotice_num() }'">
					<td style="text-align: center; width: 150px;"><img src="https://cdn-icons-png.flaticon.com/512/667/667974.png" style="width: 18px; height: 18px;"><b>공지</b><img src="https://cdn-icons-png.flaticon.com/512/667/667974.png" style="width: 18px; height: 18px;"></td>
					<td class="wrt"><b>관리자</b></td>
					<td><a class="admin_tit">${dto_1.getNotice_title() }</a></td>
					<td class="date" style="width:110px;">${dto_1.getNotice_date() }</td>
					<td class="hit" style="width:100px;"><b>${dto_1.getNotice_hit() }</b></td>
					<td style="width:100px;"></td>
				</tr>
				</c:forEach>
				
			<c:set var="list" value="${List }" />	<%-- WriteListAction에서 write 테이블에서 데이터 가져옴. --%>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<c:if test="${'admin' eq session_id }">
					<tr class="tt" onclick="location.href='<%=request.getContextPath() %>/write_content.do?num=${dto.getWrite_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
							<td style="text-align: center;"> ${dto.getWrite_num() } </td>
							<td class="wrt"> ${dto.getMember_id() } </td>
							<td> 
								${dto.getWrite_title() } 
								<c:if test="${dto.getWrite_radio() eq 1}">
									🔒︎
								</c:if>						
								
							</td>
							<td style="text-align: center;"> ${dto.getWrite_date().substring(0,10) } </td>
							<td style="text-align: center;"> ${dto.getWrite_hit() } </td>
							<td style="text-align: center;">
								<c:if test="${dto.getWrite_reply() eq 1 }">
									<span style="font-size: 13px;">답변완료</span>
								</c:if>
							</td>
						</tr>													
					</c:if>
					<%-- 게시물이 비공개인데 본인회원이랑 관리자가 아닌 경우 --%>
					<c:if test="${dto.getWrite_radio() eq 1 && session_id ne dto.getMember_id() && 'admin' ne session_id }">
						<tr class="tt" onclick="alert('관리자, 작성자 외 열람 불가능'); return false;">
							<td style="text-align: center;"> ${dto.getWrite_num() } </td>
							<td class="wrt"> ${dto.getMember_id() } </td>
							<td> 
								${dto.getWrite_title() } 
								<c:if test="${dto.getWrite_radio() eq 1}">
									🔒︎
								</c:if>							
							</td>
							<td class="date"> ${dto.getWrite_date().substring(0,10) } </td>
							<td class="hit"> ${dto.getWrite_hit() } </td>
							<td style="text-align: center;">
								<c:if test="${dto.getWrite_reply() eq 1 }">
									<span style="font-size: 13px;">답변완료</span>
								</c:if>
							</td>
						</tr>			
					</c:if>
					
					
					<%-- 게시물이 비공개이면서 회원인 경우 --%>
					<c:if test="${dto.getWrite_radio() eq 1 && session_id eq dto.getMember_id() }">
					<tr class="tt" onclick="location.href='<%=request.getContextPath() %>/write_content.do?num=${dto.getWrite_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
							<td style="text-align: center;"> ${dto.getWrite_num() } </td>
							<td class="wrt"> ${dto.getMember_id() } </td>
							<td> 
								${dto.getWrite_title() } 
								<c:if test="${dto.getWrite_radio() eq 1}">
									🔒︎
								</c:if>							
							</td>
							<td class="date"> ${dto.getWrite_date().substring(0,10) } </td>
							<td class="hit"> ${dto.getWrite_hit() } </td>
							<td style="text-align: center;">
								<c:if test="${dto.getWrite_reply() eq 1 }">
									<span style="font-size: 13px;">답변완료</span>
								</c:if>
							</td>
						</tr>					
					</c:if>			
					
						
					<%-- 게시물이 비공개가 아닌 경우 --%>
					<c:if test="${dto.getWrite_radio() eq 0 && 'admin' ne session_id }">
					<tr class="tt" onclick="location.href='<%=request.getContextPath() %>/write_content.do?num=${dto.getWrite_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
						<td style="text-align: center;"> ${dto.getWrite_num() } </td>
						<td class="wrt"> ${dto.getMember_id() } </td>
						<td> 
							${dto.getWrite_title() } 
							<c:if test="${dto.getWrite_radio() eq 1}">
								🔒︎
							</c:if>						
						</td>
						<td class="date"> ${dto.getWrite_date().substring(0,10) } </td>
						<td class="hit"> ${dto.getWrite_hit() } </td>
						<td style="text-align: center;">
							<c:if test="${dto.getWrite_reply() eq 1 }">
								<span style="font-size: 13px;">답변완료</span>
							</c:if>
						</td>
					</tr>
					</c:if>
				</c:forEach>
			</c:if>
	  </table>
	  <br>
	  <br>

	<%--	=====================================================================================================--%>
		<%-- 페이징 처리 영역 --%>
		
		<nav>
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a id="link" class="page-link" href="inquiry_main.do?page=1">◀</a>
		    </li>

		    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<li class="page-item active" aria-current="page"><a id="link" class="page-link" href="inquiry_main.do?page=${i }">${i }</a></li>
				</c:if>
			
				<c:if test="${i != page }">
					<li class="page-item"><a id="link" class="page-link" href="inquiry_main.do?page=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${endBlock < allPage }">
				<li class="page-item">
					<a id="link" class="page-link" href="inquiry_main.do?page=${endBlock + 1 }">Next</a>
				</li>
				<li class="page-item">
					<a id="link"class="page-link" href="inquiry_main.do?page=${allPage }">End</a>
				</li>
			</c:if>
			  <li  class="page-item">
		      <a id="link" class="page-link" href="inquiry_main.do?page=${endBlock }">▶</a>
		    </li>
		  </ul>
		</nav>
	  </div>		
	<%--	===================================================================================================== --%> 

	  
	  <%-- 탭 두번째 1:1문의(작성양식 폼) =========================== --%>
	  <div id="tab2" class="tab-content">
	  
	  <br>
	  <br>
	  <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/w_write_upload.do">
	  
	  	<header>
			<h2>1:1문의(작성양식)<span id="img_text">등록</span><input type="image" src="https://cdn-icons-png.flaticon.com/512/46/46076.png" value="등록" id="img_a"></h2>
		</header>
		 <br>
		 <br>
	     <p>문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.
		<br>* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00</p>
	  	<br>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">아이디</label>
		  <input class="form-control" id="exampleFormControlInput1" placeholder="아이디 입력" value="${session_id }" style="width: 300px;" name="w_id">
		</div>
<!-- 		<div class="mb-3">
		  <label class="form-label">비밀번호</label>
		  <input type="password" class="form-control" id="exampleFormControlInput1" placeholder="비밀번호 입력" style="width: 300px;" name="w_pwd">
		</div> -->
		<div class="mb-3">
		  <label for="formFile" class="form-label">파일 업로드</label>
		  <input class="form-control" style="width: 400px;" type="file" id="formFile" name="w_file">
		</div>			
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="9" style="width: 700px; resize: none;" name="w_cont"></textarea>
		  <span id="cnt">(0 / 1000)자 이내로 입력</span>
		</div>	
		</form>
	  </div> 
	 <br>
	</div>
	
	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>
