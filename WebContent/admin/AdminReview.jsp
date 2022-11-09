<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	$(function() {
		let getPage=1;
		function getComentList() {
			
			$.ajax({
		         url : "/WatchaProject/admin/ajax/ComentPageList.jsp",
		         data : {page : getPage},
		         datatype : "text",   // 결과 데이터 타입
		         success : function(data) {
		        	$("#table tr:gt(0)").remove();
					$("#table").append(data);
					
					$(".delete_btn").on("click",function(){
						if(confirm('해당 게시글을 블라인드 처리 하시겠습니까?')){
							let str = "#coment"+this.value;
							// 해당 게시글 번호 가져옴.
							location.href="<%=request.getContextPath()%>/admin_coment_update.do?coment_num="+$(str).html();
						}else{
							return;
						}
					});
		         },
		         error : function() {
		            alert("데이터 오류");
		         }
		         
		      });
			
		}
		$(".coment_btn").on("click",function(){
			$("#table tr:gt(0)").remove();
			getComentList2(this.value);
			
		});
		
		function getComentList2(p) {
			let pp=p
			$.ajax({
		         url : "/WatchaProject/admin/ajax/ComentPageList.jsp",
		         data : {page : pp},
		         datatype : "text",   // 결과 데이터 타입
		         success : function(data) {
					$("#table").append(data);
					
					$(".delete_btn").on("click",function(){
						if(confirm('해당 게시글을 블라인드 처리 하시겠습니까?')){
							let str = "#coment"+this.value;
							// 해당 게시글 번호 가져옴.
							location.href="<%=request.getContextPath()%>/admin_coment_update.do?coment_num="+$(str).html();
						}else{
							return;
						}
					});
		         },
		         error : function() {
		            alert("데이터 오류");
		         }
		         
		      });
		}
		
		
		
		
		
		function getFreeList() {
			
			$.ajax({
		         url : "/WatchaProject/admin/ajax/FreePageList.jsp",
		         data : {page : getPage},
		         datatype : "text",   // 결과 데이터 타입
		         success : function(data) {
		        	$("#table2 tr:gt(0)").remove();
					$("#table2").append(data);
					$(".delete_btn2").on("click",function(){
						if(confirm('해당 게시글을 블라인드 처리 하시겠습니까?')){
							let str = "#free"+this.value;
							// 해당 게시글 번호 가져옴.
							location.href="<%=request.getContextPath()%>/admin_free_update.do?free_num="+$(str).html();
						}else{
							return;
						}
					});
					
		         },
		         error : function() {
		            alert("데이터 오류");
		         }
		         
		      });
			
		}
		
		$(".coment_btn2").on("click",function(){
			$("#table2 tr:gt(0)").remove();
			getFreeList2(this.value);
			
		});
		
		function getFreeList2(p) {
			let pp=p
			$.ajax({
		         url : "/WatchaProject/admin/ajax/FreePageList.jsp",
		         data : {page : pp},
		         datatype : "text",   // 결과 데이터 타입
		         success : function(data) {
					$("#table2").append(data);
					$(".delete_btn2").on("click",function(){
						if(confirm('해당 게시글을 블라인드 처리 하시겠습니까?')){
							let str = "#free"+this.value;
							// 해당 게시글 번호 가져옴.
							location.href="<%=request.getContextPath()%>/admin_free_update.do?free_num="+$(str).html();
						}else{
							return;
						}
					});
		         },
		         error : function() {
		            alert("데이터 오류");
		         }
		         
		      });
		}
		
		getComentList();
		getFreeList();
		
	});

</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	
	<div>
		<!-- 코멘트 리스트  -->
		<div>
			<div>코멘트 리스트</div>
			<div>
				<table border="1" cellspacing="0" id="table">
					<tr>
						<th>영화 번호</th>
						<th>게시글 번호</th>
						<th>아이디</th>
						<th>내용</th>
						<th>삭제</th>
					</tr>
	
				</table>
			</div>
			<div align="center">
				<c:forEach begin="1" end="${coment_size/10+1}" varStatus="i">
					<button class="coment_btn" value="${i.count }">${i.count}</button>
				</c:forEach>
			</div>
		</div>
		<!-- 자유게시판 리스트 -->
		<div>
			<div>자유게시판 리스트</div>
			<div>
				<table border="1" cellspacing="0" id="table2">
					<tr>
						<th>자유 게시판 번호</th>
						<th>아이디</th>
						<th>내용</th>
						<th>삭제</th>
					</tr>
	
				</table>
			</div>
			<div align="center">
				<c:forEach begin="1" end="${free_size/10+1}" varStatus="i">
					<button class="coment_btn2" value="${i.count }">${i.count}</button>
				</c:forEach>
			</div>
		</div>
		
		<!-- 회원별 신고 리스트 -->
		<div>
			<div>회원 신고 리스트</div>
			<div>
				<table border="1" cellspacing="0" id="table2">
					<tr>
						<th>회원 아이디</th>
						<th>신고받은 횟수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty singo_list }">
							<c:forEach items="${singo_list }" var="dto" varStatus="i">
								<tr>
									<td>${dto.getMember_Id()}</td>
									<td>${dto.getSingo_Count() }</td>
								</tr>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="2">신고받은 회원이 없습니다.</td>
							</tr> 
							
						</c:otherwise>
					</c:choose>
				</table>
			
			
			</div>
		
		</div>
	
	
	
	</div>
	
	
	
	
	<jsp:include page="../include/admin_bottom.jsp" />
	
</body>
</html>

<%-- 				<c:choose>
					<c:when test="${not empty coment_list }">
						<c:forEach items="${coment_list }" var="com_dto">
							<tr>
								<td>${com_dto.getMovie_num() }</td>
								<td>${com_dto.getComent_num() }</td>
								<td>${com_dto.getMember_id() }</td>
								<td>${com_dto.getMovie_coment() }</td>
								<td><button>삭제</button></td>
							</tr>
						</c:forEach>
						

					</c:when>	
					
					<c:otherwise>
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
					</c:otherwise>
						
				</c:choose> --%>