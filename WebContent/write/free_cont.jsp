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
		width: 70%;
	}
	
	#con_1{
		margin-left: 25%;
		margin-top: 50px;
		margin-bottom: 50px;
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
</style>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
		
		<div id="con_1">
			<c:set var="dto" value="${Cont }" />
			<header>
					<h2>게시글 상세조회</h2>
				<br>
			</header>
			
			<table class="table table-bordered" id="table_1">
				<tr id="tr_1">
					<th id="th_1" style="width: 100px;">제목</th>
					<td colspan="3"> ${dto.getFree_title() } </td>
					<th id="th_1">등록일</th>
					<td colspan="3"> ${dto.getFree_date() } </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">작성자</th>
					<td> ${dto.getMember_id() } </td>
					<th id="th_1">글자수</th>
					<td> (${dto.getFree_cont().length() }자 / 1000자) </td>
					<th id="th_1">조회수</th>
					<td> ${dto.getFree_hit() } </td>
				</tr>
				
				<tr id="tr_1">
					<th id="th_1">내용</th>
					<td colspan="6">
						<textarea id="content" rows="17" cols="120" readonly>${dto.getFree_cont() }</textarea>
					</td>
				</tr>
			</table>
		
		<br>
		
		<hr style="width: 70%;">
			
		<%-- 댓글 폼 영역입니다. --%>
		<h5>댓글</h5>	

		<div>
			<table class="list" cellspacing="0" width="400">
				<tr>
					<td colspan="2"></td>				
				</tr>
				
				<tr class="line">
					<td></td> 
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>

		<div style="border: 2px solid #c6c6c6;padding: 16px; border-radius: 5px; width: 70%; ">
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

			
<%-- 		<div>
			<div data-v-3b426d7d="" class="CommentWriter">
				<div data-v-3b426d7d="" class="comment_inbox">
					<strong data-v-3b426d7d="" class="blind">댓글을 입력하세요</strong>
					<em data-v-3b426d7d="" class="comment_inbox_name" id="r_write">${session_id }세션아이디 나옴</em>
						<textarea id="re_content" data-v-3b426d7d="" placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 17px;"></textarea>
				</div>
				
				<div data-v-3b426d7d="" class="comment_attach">
					<div data-v-3b426d7d="" class="attach_box">
						<label data-v-60755c74="" data-v-3b426d7d="" for="attach3" class="button_file"></label>
							<div data-v-3b426d7d="" class="register_box">
								<a data-v-3b426d7d="" href="#" id="replyBtn" role="button" class="button btn_register">등록</a>
							</div>
					</div>
				</div>
			</div>
		</div> --%>
			
			

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
	
	// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
	function getList() {
		
		$.ajax({
			url : "/WatchaProject/write/free_reply.jsp",
			data : {rno : ${dto.free_num } },
			datatype : "xml", 		// 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
				$(".list tr:gt(1)").remove();
				
				let table = "";
				
				$(data).find("reply").each(function() {
					table += "<tr>";
					table += "<td colspan='2' style='font-weight: bold;'>" + $(this).find("member_id").text() + "</td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td>" + $(this).find("r_free_cont").text() + "</td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td style='font-size: 13px; color:gray;'>" + $(this).find("r_free_date").text().substring(0,16) + "</td>";
					table += "</tr>";
					
					
					table += "<tr>";
					table += "<td><hr width='1000'></td>";
					table += "</tr>";
				});
				
				$(".list tr:eq(1)").after(table);	//두번재 인덱스임.
			},
			
			error : function() {
				alert('데이터 통신 에러');
			}
		});
	}	// getList() 함수 end
	
	
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
					alert('댓글 작성 완료!!!');
					
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
	
	
	
	
	getList(); // 전체 리스트 호출 함수 호출
	});

	
	
</script>	

</body>
</html>
