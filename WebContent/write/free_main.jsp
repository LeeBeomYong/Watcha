<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 메인 페이지</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script type="text/javascript">

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
<style type="text/css">



	/* 전체 콘테이너 */
	#con{
		margin-left: 13%;
		margin-right: 13%;
	}

	/* 탭 메뉴 */
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
	  list-style: none;
	}
	
	/* 탭 메뉴 글 */
	ul.tabs li{
	  background: none;
	  color: #222;
	  display: inline-block;
	  padding: 10px 15px;
	  cursor: pointer;
	}
	
	
	ul.tabs li.current{
	  background: #ededed;
	  color: #222;
	  border-radius: 0px 0px 0px 0px;
	}
	
	/* 탭 콘텐츠 영역 */
	.tab-content{
	  display: none;  
	}
	
	.tab-content.current{
	  display: inherit;
	}
	
	/* 테이블 리스트 제목 */
	.tt{
		height: 50px;
		vertical-align:middle;	 /* 세로 가운데 정렬 */
	}
	
	/* 문의 등록 버튼 */
	#btn1{
		border: none;
		width: 90px;
		height: 40px;
		border-radius: 5px;
		margin-left: 39%;
		margin-top: 5px;
	}
	
	/* 문의 등록 버튼 글씨 */
	#btn1 > a{
		text-decoration: none;
		color: #000;
	}
		
	/* 문의 등록 버튼 글씨 */
	#btn1:hover{
		background-color: #ABABAB;
	}
	
	/* 검색 기능 폼 큰 틀 div */
	#btnId{
		margin-bottom: 10px;
	}
	
	/* 검색 버튼 */
	#btn2{
		height: 35px;
		margin-top: 5px;
	}
	
	#sel{
		margin-top: 5px;
	}

	/* 두번째 탭 영역 div */
	#tab2{
		margin-left: 25%;
	}
	
/* --------1:1 작성 문의 부분 ----------------------------------------*/	
	
	/* 1:1 작성 양식에서 등록 비행기 버튼 */
	#img_a{
		width: 30px;
		height: 30px;
		margin-left: 10px;
	}

	/* 1:1 작성 양식에서 등록 span 태그 */
	#img_text{
		font-size: 20px;
		margin-left: 340px;
	}
	
	/* 전체 목록 클릭 버튼 a태그 */
	.total{
		text-decoration: none;
		color: #000;
		margin-top: 5px;
		margin-left: 15px;
	}
	
	/* 전체 목록 클릭 버튼 a태그 */
	.total:hover{
		font-weight: bold;
		color: #000;
	}
	
		
	/* 게시판 정렬 */
	/*조회수*/
	.hit{
		width: 120px;
		text-align: center;
	}
	
	/* 작성일자 */
	.date{
		width: 150px;
		text-align: center;
	}
	
	/* 번호 */
	.no{
		width:150px;
		text-align: center;
	}
	
	/* 작성자 */
	.wrt{
		width:150px;
		text-align: center;
	}
	
	/* 제목 */
	.tit{
		text-align: center;
	}
	
	/* 관리자 제목 */
	.admin_tit{
		text-decoration: underline;
		font-weight: 900;
		color: #000;
	}
	.admin_tit:hover{
		color: #000;
	}

	
/* 페이징 css 부분------------------------------------------*/	

	/* 번호 클릭하는 부분 */
	#link{
	 color: #000;
	 z-index: 0;
	}

	.page-item.active
	.page-link {
	 z-index: 0;
	 color: #555;
	 font-weight:bold;
	 background-color: #f1f1f1;
	 border-color: #ccc;	 
	}
	
	.page-link:focus, 
	.page-link:hover {
	  color: #000;
	  background-color: #fafafa; 
	  border-color: #ccc;
	}
	
/* ----------------------------------------------------*/		
	#img{
		width: 1000px;
		height: 500px;
	}
	
	#reply_num{
		color: red;
		font-weight: bold;
	}

</style>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
	<br>
	<br>
	<%-- 전체 콘테이너 --%>
	<div id="con">
	
	 <%-- 탭 메뉴 --%>
	  <ul id="tabs" class="tabs">
	    <li class="tab-link current" data-tab="tab1">자유게시판</li>
	  </ul>
	  <br>
	  <%-- 탭 1 버전!!! --%>
	  <div id="tab1" class="tab-content current">
		<p>
		* 본 게시판은 왓챠 회원님들의 영화 정보 공유게시판입니다.<br>
		* 욕설이나 비난글을 작성할 시 활동정지, 영구강퇴 될 수 있음을 알려드립니다.</p>
	 	<br>
		
		<%-- 검색 기능 폼 --%>
		<div id="btnId">
		<form class="d-flex" role="search" method="post" action="<%=request.getContextPath() %>/free_search.do">
			<select id="sel" name="search_field" style="height: 35px;">
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목&내용</option>
				<option value="writer">작성자</option>
			</select>
				&nbsp;
			<input class="form-control me-2" type="search" name="search_keyword" style="width: 35%; height: 37px;">
			<button id="btn2" class="btn btn-outline-success" type="submit">검색</button>
			<a class="total" href="free_main.do" style="margin: 10px 5px 5px 15px;">전체목록</a>
			
			<%-- 문의 등록 폼 버튼 --%>
			<c:if test="${session_id ne null }">
				<button id="btn1" onclick="event.cancelBubble=true;"><a href="free_upload.do">✏️글쓰기</a></button>		
			</c:if>
		</form>
		</div>
		
		<%-- 데이터 리스트 시작!!! --%>
		<table class="table table-hover">
			<thead style="background-color: #DADADA;">
			<tr class="tt">
				<th class="no">번호</th>
				<th class="tit">제목</th>
				<th class="wrt">작성자</th>
				<th class="date">작성일자</th>
				<th class="hit">조회</th>
			</tr>		
			</thead>
			
			<%-- 공지사항 받아온 것 리스트 --%>
			<c:set var="list_1" value="${List_1 }" />
				<c:forEach items="${list_1 }" var="dto_1">
				<tr class="tt" style="background-color: #F0EFEF;" onclick="location.href='<%=request.getContextPath() %>/notice_content.do?no=${dto_1.getNotice_num() }'">
					<td class="no"><img src="https://cdn-icons-png.flaticon.com/512/667/667974.png" style="width: 19px; height: 19px;"><b>공지</b><img src="https://cdn-icons-png.flaticon.com/512/667/667974.png" style="width: 19px; height: 19px;"></td>
					<td>${dto_1.getNotice_title() }</td>
					<td class="wrt">관리자</td>
					<td class="date">${dto_1.getNotice_date() }</td>
					<td class="hit"><b>${dto_1.getNotice_hit() }</b></td>
				</tr>
				</c:forEach>
				
			<c:set var="list" value="${List }" />	<%-- FreeListAction에서 free_write 테이블에서 데이터 가져옴. --%>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				 	<%-- 관리자 인 경우 --%>
					<c:if test="${'admin' eq session_id }">
					<tr class="tt" onclick="location.href='<%=request.getContextPath()%>/free_content.do?num=${dto.getFree_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
							<td class="no"> ${dto.getFree_num() } </td>
							<td> ${dto.getFree_title() } 	
								<%-- 댓글 갯수 표시 --%>
								<c:if test="${dto.getFree_reply_num() ne 0 }">
									<span id="reply_num">[${dto.getFree_reply_num() }]</span>						
								</c:if>
							</td>
							<td class="wrt"> ${dto.getMember_id() } </td>
							<td class="date"> ${dto.getFree_date().substring(0, 10) } </td>
							<td class="hit"> ${dto.getFree_hit() } </td>
						</tr>	
					</c:if>												

			
	
			<%-- 게시물이 회원공개인데 로그인이 안되어있을 경우--%>
			<c:if test="${dto.getFree_radio() eq 1  && session_id eq null}">
				<tr id="clik" class="tt" onclick="alert('로그인 후 열람 가능합니다.'); return false; ">
					<td class="no"> ${dto.getFree_num() } </td>
					<td> ${dto.getFree_title() } 	
						<%-- 댓글 갯수 표시 --%>
						<c:if test="${dto.getFree_reply_num() ne 0 }">
							<span id="reply_num">[${dto.getFree_reply_num() }]</span>						
						</c:if>
						
						<c:if test="${dto.getFree_radio() eq 1}">
							🔒︎
						</c:if>							
					</td>
					<td class="wrt"> ${dto.getMember_id() } </td>
					<td class="date"> ${dto.getFree_date().substring(0, 10) } </td>
					<td class="hit"> ${dto.getFree_hit() } </td>
					
				</tr>			
			</c:if>			

			<%-- 게시물이 회원공개이면서 로그인 된 경우 --%>
			<c:if test="${dto.getFree_radio() eq 1 && session_id ne null}">
					<tr class="tt" onclick="location.href='<%=request.getContextPath()%>/free_content.do?num=${dto.getFree_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
					<td class="no"> ${dto.getFree_num() } </td>
					<td> ${dto.getFree_title() } 	
						<%-- 댓글 갯수 표시 --%>
						<c:if test="${dto.getFree_reply_num() ne 0 }">
							<span id="reply_num">[${dto.getFree_reply_num() }]</span>						
						</c:if>						
					</td>
					<td class="wrt"> ${dto.getMember_id() } </td>
					<td class="date"> ${dto.getFree_date().substring(0, 10) } </td>
					<td class="hit"> ${dto.getFree_hit() } </td>
				</tr>					
			</c:if>				
			
			<%-- 게시물이 전체공개 인 경우 --%>
			<c:if test="${dto.getFree_radio() eq 0 && 'admin' ne session_id }">
				<tr class="tt" onclick="location.href='<%=request.getContextPath()%>/free_content.do?num=${dto.getFree_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
					<td class="no"> ${dto.getFree_num() } </td>
					<td> ${dto.getFree_title() } 	
						<%-- 댓글 갯수 표시 --%>
						<c:if test="${dto.getFree_reply_num() ne 0 }">
							<span id="reply_num">[${dto.getFree_reply_num() }]</span>						
						</c:if>
						
						<c:if test="${dto.getFree_radio() eq 1}">
							🔒︎
						</c:if>							
					</td>
					<td class="wrt"> ${dto.getMember_id() } </td>
					<td class="date"> ${dto.getFree_date().substring(0, 10) } </td>
					<td class="hit"> ${dto.getFree_hit() } </td>
				</tr>
			</c:if>			
			</c:forEach>
		</c:if>		  
	 </table>
	<br>
	<%--	=====================================================================================================--%>
		<%-- 페이징 처리 영역 --%>
		
		<nav>
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a id="link" class="page-link" href="free_main.do?page=1">◀</a>
		    </li>

		    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<li class="page-item active" aria-current="page"><a id="link" class="page-link" href="free_main.do?page=${i }">${i }</a></li>
				</c:if>
			
				<c:if test="${i != page }">
					<li class="page-item"><a id="link" class="page-link" href="free_main.do?page=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${endBlock < allPage }">
				<li class="page-item">
					<a id="link" class="page-link" href="free_main.do?page=${endBlock + 1 }">Next</a>
				</li>
				<li class="page-item">
					<a id="link"class="page-link" href="free_main.do?page=${allPage }">End</a>
				</li>
			</c:if>
			  <li  class="page-item">
		      <a id="link" class="page-link" href="free_main.do?page=${endBlock }">▶</a>
		    </li>
		  </ul>
		</nav>
	  </div>		
	<%--	===================================================================================================== --%> 

	</div>
	<br>
	<br>
	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />



</body>
</html>
