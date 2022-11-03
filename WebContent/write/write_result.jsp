<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A / 1:1문의내역 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/write/write_css/write_result_css.css" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script type="text/javascript">

	// 탭 바 두개 콘텐츠 보여주는 함수.
	$(document).ready(function(){
		   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
		 
	})


</script>
</head>
<body>
	
	<jsp:include page="../include/user_top.jsp" />
	
	<br>
	
	<div id="con">
	<br>
	<br>
	 
	  <ul class="tabs">
	    <li class="tab-link current" data-tab="tab1">Q&A문의내역</li>
	    <li class="tab-link" data-tab="tab2">1:1문의내역</li>
	  </ul>
	 
	  <div id="tab1" class="tab-content current">
	  <br>
	  	<header>
			<h2>${session_id }님의 Q&A문의 내역</h2>
		</header>
	    <br>	
	 	<br>
	 	
	    <p>문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.
	    <br>* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00</p>
	    
		<br>
		<table class="table table-hover">
			<thead class="table-secondary">
			<tr class="tt">
				<th class="no">번호</th>
				<th class="wrt">작성자</th>
				<th class="tit">문의제목</th>
				<th class="date">작성일자</th>
				<th class="del">삭제하기</th>
				<th class="now">처리상태</th>
			</tr>		
			</thead>
			
			<c:set var="list" value="${List }" />
				<c:forEach items="${list }" var="dto">
					<c:if test="${session_id eq dto.getMember_id() }">
					<tr class="tt" onclick="location.href='<%=request.getContextPath() %>/write_content.do?num=${dto.getWrite_num() }'">
						<td class="no"> ${dto.getWrite_num() } </td>
						<td class="wrt"> ${dto.getMember_id() } </td>
						<td> ${dto.getWrite_title() } </td>
						<td class="date"> ${dto.getWrite_date().substring(0, 16) } </td>
						<td class="del" onclick="event.cancelBubble=true;">
							<a href="<%=request.getContextPath() %>/write_delete.do?num=${dto.getWrite_num() }" onclick="return confirm('정말 삭제 하시겠습니까 ?')" style="text-decoration: none; color:red;">삭제</a>
						</td>
						<td class="now">
							<%-- 게시글 번호랑 가지고 있는 게시글 번호랑 같고, 내용이 있을때 나와라. --%>
							<c:if test="${dto.getWrite_reply() eq '1'}">
								<button id="fin_a">답변완료</button>
							</c:if>
							<c:if test="${dto.getWrite_reply() ne '1' }">
								<button id="fin_b">답변 대기중</button>
							</c:if>
						</td>
						
					
<%-- 							<!-- 삭제확인 알림창 -->
							<button type="button" id="delete_btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  삭제
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">⚠확인</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body" align="left">
							        삭제한 글은 답변을 받을 수 없습니다.<br>
							        정말 삭제 하시겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/write_delete.do?num=${dto.getWrite_num() }'">삭제하기</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							      </div>
							    </div>
							  </div>
							</div>
 --%>							
						

					</tr>								
					</c:if>
			</c:forEach>
	  </table>
	  </div>
	  
	  <%-- 탭 2번째 콘텐츠 부분 --%>
	  <div id="tab2" class="tab-content">
	  <br>
	  	<header>
			<h2>${session_id }님의 문의 내역</h2>
		</header>
	  <br>	
	  <br>
	  
	  <p>문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.
	  <br>* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00</p>
	  
	  <br>
		
		<%-- 테이블 시작 부분 리스트 --%>
		<table class="table table-hover">
			<c:set var="rlist" value="${RList }" />
				<thead class="table-secondary">
				<tr class="tt">
					<th class="no">번호</th>
					<th>문의내용</th>
					<th class="date">날짜</th>
					<th class="del">삭제</th>
					<th class="now">처리상태</th>
				</tr>
				</thead>
			<c:forEach items="${rlist }" var="rdto">
				<c:if test="${session_id eq rdto.getW_id() }">
				<tr class="tt" onclick="location.href='<%=request.getContextPath() %>/w_write_content.do?num=${rdto.getW_num() }'">	<%-- 이부분 블럭 자체를 클릭하였을때 글 전체를 제대로 볼 수 있음. --%>
					<td class="no"> ${rdto.getW_num() } </td>
					<td> ${rdto.getW_cont() } </td>	
					<td class="date"> ${rdto.getW_date() } </td>
					<td class="del" onclick="event.cancelBubble=true;">
						<a href="<%=request.getContextPath() %>/w_write_delete.do?num=${rdto.getW_num() }" onclick="return confirm('정말 삭제 하시겠습니까 ?')" style="text-decoration: none; color:red;">삭제</a>
					</td>
					<td class="now">
						<%-- 게시글 번호랑 가지고 있는 게시글 번호랑 같고, 내용이 있을때 나와라. --%>
						<c:if test="${rdto.getW_reply() eq '1'}">
							<button id="fin_a">답변완료</button>
						</c:if>
						<c:if test="${rdto.getW_reply() ne '1' }">
							<button id="fin_b">답변 대기중</button>
						</c:if>
					</td>
					
<%-- 							<!-- 삭제확인 알림창 -->
							<button type="button" id="delete_btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  삭제
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">⚠확인</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body" align="left">
							        삭제한 글은 답변을 받을 수 없습니다.<br>
							        정말 삭제 하시겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/write_delete.do?num=${dto.getWrite_num() }'">삭제하기</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							      </div>
							    </div>
							  </div>
							</div> --%>
										
					
				</tr>
				</c:if>
			</c:forEach>

	  </table>
	  </div>
	 
	</div>
	<br>
	<br>
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>