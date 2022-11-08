<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
			<c:set var="dto" value="${Cont }" />
			<header>
					<h2> ${dto.getFree_title() } </h2>
				<br>
				<img id="pro_img" src="./image/profileupload/프로필_로고.png">
				<div>
					<b style="font-size: 19px;"> ${dto.getMember_id() } </b>
					<br>
					<a style="font-size: 13px; pointer-events: none; color: #757575;">${dto.getFree_date().substring(0,16) } &nbsp; 조회 : ${dto.getFree_hit() } </a>
					<c:if test="${dto.getMember_id() eq session_id }">
						<a id="tag_1"style="margin-left: 66%;" href="<%=request.getContextPath()%>/free_modify.do?num=${dto.getFree_num() }">수정</a> / <a id="tag_1" href="<%=request.getContextPath() %>/free_delete.do?num=${dto.getFree_num() }" onclick="return confirm('정말 삭제 하시겠습니까 ?')">삭제</a>					
					</c:if>
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
				
					<p>${dto.getFree_cont() }</p>
				
				</div>
				<p style="float: right; font-size: 12px;">(${dto.getFree_cont().length() }자 / 1000자)</p>
		
		<br>
		
		<hr style="width: 100%;">
			
		<%-- 댓글 폼 영역입니다. --%>
		<div id="divReloadLayer"><h5>댓글&nbsp;
		<c:if test="${dto.getFree_reply_num() eq 0 }"><span></span></c:if>
		<c:if test="${dto.getFree_reply_num() ne 0 }"><span>${dto.getFree_reply_num() }</span></c:if>
		</h5></div>
		<br>
		<div>
			<table id="list_id" class="list" cellspacing="0" width="400">
				
				<tr>
					<td colspan="2"></td>		
				</tr>
				
				<tr class="line">
					<td></td> 
				</tr>
				<tr>
					<td><input type="button" id="det" value="삭제"></td>
				</tr>

			</table>
		</div>
		
		<%-- 로그인 안했을때 댓글 작성 불가능 --%>
		<c:if test="${session_id eq null }">
			<div style="border: 2px solid #c6c6c6;padding: 16px; border-radius: 5px; width: 100%; ">		
				<table>
					<tr>
						<td>
							<input name="re_id" id="re_writer" value="로그인 후 댓글 이용해 주세요.">
						</td>
					</tr>	
					<tr>
						<td>
							<textarea name="re_content" id="re_content" cols="500" placeholder="댓글을 입력하세요." readonly></textarea>
						</td>
					</tr>
					<tr>
						<td>
						<input type="button" id="replyBtn" value="등록" style="pointer-events: none;">
						</td>
					</tr>	
				</table>
			</div>
		</c:if>
		
		<%-- 로그인 하면 댓글 작성 가능 --%>
		<c:if test="${session_id ne null }">
			<div style="border: 2px solid #c6c6c6;padding: 16px; border-radius: 5px; width: 100%; ">
				<table>
					<tr>
						<td>
							<input name="re_id" id="re_writer" value="${session_id }">
						</td>
					</tr>	
					<tr>
						<td>
							<textarea name="re_content" id="re_content" cols="500" placeholder="댓글을 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<td>
						<input type="button" id="replyBtn" value="등록">
						</td>
					</tr>		
	
				</table>
			</div>
		</c:if>

	</div> <%-- 전체 컨테이너 div --%>

	<%-- 하단 include 바 --%>
	<jsp:include page="../include/user_bottom.jsp" />
	
	
<script type="text/javascript">

$(function(){
	// ajax에서 동일하게 사용되는 속성 설정
	$.ajaxSetup({
		// ajax에서 한글 깨짐 문제 해결
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
	let rr_no;
	
	// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
	function getList() {
		
		$.ajax({
			url : "/WatchaProject/write/free_reply.jsp",
			data : {rno : ${dto.free_num }},
			datatype : "xml", 		// 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
				$(".list tr:gt(1)").remove();
				
				let table = "";
				
				$(data).find("reply").each(function() {
					
					table += "<tr>";
					table += "<td colspan='2' style='font-weight: bold;'>" + $(this).find("member_id").text() + "<input type='button' id='det' value='삭제' rno = '"+$(this).find("free_num").text()+"' r_no = '"+$(this).find("r_free_num").text() + "'></td>";
					table += "</tr>";	
					
					table += "<tr>";
					table += "<td>" + $(this).find("r_free_cont").text() + "</td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td style='font-size: 13px; color:gray; width: 300px;'>" + $(this).find("r_free_date").text().substring(0,16) + "</td>";
					table += "</tr>";

					table += "<tr>";
					table += "<td><hr width='950'></td>";
					table += "</tr>";
				});
				
				$(".list tr:eq(1)").after(table);	//두번재 인덱스임.
			},
			
			error : function() {
				alert('데이터 통신 에러');
			}
		});
	}	// getList() 함수 end

	
	// 삭제 버튼을 클릭했을 때 이벤트 적용
	// 삭제 버튼처럼 동적으로 생성된 요소는 
	// 제이쿼리에서 on() 함수를 이용해야 함.
	// 형식) on("click" 이나 "change" 같은 이벤트,
	//         "이벤트 적용 선택자 또는 태그", 동작함수(무명함수))
	
	$(document).on("click", "#det", function() {
	
		$.ajax({
			url : "/WatchaProject/free_reply_delete.do",
			data : {no : $(this).attr("r_no"),
					nno : $(this).attr("rno")
					},
			datatype : "text",
			success : function(data) {
				if(data > 0) {
					alert('삭제 완료');
					
					getList();
					reloadDivArea(); //함수 실행
				}else {
					alert('삭제 실패');
				}
			},
			
			error : function() {
				alert('데이터 통신 오류');
			}
		});
	});	 
	
	
	// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
	$("#replyBtn").on("click", function(){
		
		$.ajax({
			url : "/WatchaProject/free_reply_insert.do",
			datatype : "text",
			data : {
					writer : $("#re_writer").val(),	
					content : $("#re_content").val(),
					bno : ${dto.free_num }
					},
			success : function(data) {
				if(data > 0){
					
					reloadDivArea(); //함수 실행

					// 댓글 작성 후 다시 전체 댓글 리스트를 화면에 뿌려주면 됨.					
					getList();

					// input 태그에 입력된 내용을 지워줌.
					$("textarea").each(function(){
						$(this).val("");	// 입력된 값 지우기.
					});
				}else{
					alert('댓글 추가가 실패 하였습니다.');
				}
			},
			
			error : function() {
				alert('데이터 통신 오류입니다.');
			}
		});
	});		// 댓글 등록하기 end
	 
	function reloadDivArea() {
	    $('#divReloadLayer').load(location.href+' #divReloadLayer');
	}
	
	
	getList(); // 전체 리스트 호출 함수 호출

	reloadDivArea(); //함수 실행
	
	});

	
</script>	

</body>
</html>
