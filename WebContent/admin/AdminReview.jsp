<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
a{
	color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;

}

table {
  border-collapse: separate;
  border-spacing: 0;
  width: 80%; 
}
th,
td {

  padding: 6px 15px;
}
th {

  background: #3fa46a;
  color: #fff;

  
}
.th-3{
width:30px;
}

.th-4{
width:180px;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}

  .b-blue, .b-blue:before {
    background: rgba(5,118,255,1);
    background: -moz-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(5,118,255,1)), color-stop(100%, rgba(36,248,255,1)));
    background: -webkit-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -o-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0576ff', endColorstr='#24f8ff', GradientType=1 );
  }

.button {
  display: inline-block;
  position: relative;
  border-radius: 3px;
  text-decoration: none;
  padding: .5em;
  margin: .5em;
  font-size: 5px;
  font-weight: bold;
  transition: all .5s;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color: red;
}
.button:hover {
  text-shadow: 0px 0px 0px rgba(255, 255, 255, .75);
}
.button:hover:after {
  left: 100%;
  top: 100%;
  bottom: 100%;
  right: 100%;
}
.button:before {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  border-radius: 5px;
  transition: all .5s;
}

.coment_btn {
  display: inline-block;
  font-size: 10px;
  margin: .5em;
  padding: .5em;
  border-radius: 5px;
  transition: all .5s;
  filter: hue-rotate(0deg);
  color: #FFF;
  text-decoration: none;
  border: none;
  
}
.coment_btn2{
 display: inline-block;
  font-size: 10px;
  margin: .5em;
  padding: .5em;
  border-radius: 5px;
  transition: all .5s;
  filter: hue-rotate(0deg);
  color: #FFF;
  text-decoration: none;
  border: none;
}
.th-4{
width:200px;
text-align: center;
}


.rot-135:hover {
  filter: hue-rotate(135deg);
}
	.pagination {
		justify-content: center;
		color: green;
}
/*END ROTATE*/
.dbtn{
width: 70px;

}

.search {
  position: relative;
  width: 300px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}

</style>

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
	<br><br><br>
	<div>
		<!-- 코멘트 리스트  -->
		<div>
			<div>코멘트 리스트</div>
		  <div class="tbl-header">
				<table  id="table" >
					<thead align="center">
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
					<button class="coment_btn b-blue rot-135" value="${i.count }">${i.count}</button>
				</c:forEach>
			</div>
		</div>
		<!-- 자유게시판 리스트 -->
		<div>
			<div>자유게시판 리스트</div>
			<div>
				<table id="table2" >
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
					<button class="coment_btn2 b-blue rot-135" value="${i.count }">${i.count}</button>
				</c:forEach>
			</div>
		</div>
		
		<!-- 회원별 신고 리스트 -->
		<div>
			<div>회원 신고 리스트</div>
			<div>
				<table  id="table2" >
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