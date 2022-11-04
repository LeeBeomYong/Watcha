<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	function showPopUp() {
		if('<%=session.getAttribute("memberId")%>' != ""){
			 //창 크기 지정
		    var width = 500;
		    var height = 500;
		
		    //pc화면기준 가운데 정렬
		    var left = (window.screen.width / 2) - (width/2);
		    var top = (window.screen.height / 4);
		
		       //윈도우 속성 지정
		    var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		       //연결하고싶은url
		    const url = "${pageContext.request.contextPath}/content/MyOpinion.jsp?movie_num=${movie_dto.getMovie_num()}&member_Id=${sessionScope.member_Id}&chk=1";
		       
		    //등록된 url 및 window 속성 기준으로 팝업창을 연다.
		    window.open(url, "hello popup", windowStatus);
		}else{
			alert("로그인 부터 ㅠㅠ");
		}
	}


	//좋아요 세션 버튼
	function likethis(movie_num,coment_num,coment_num_son) {
		//alert(movie_num +" "+ coment_num+ " "+coment_num_son);	
		
		if('<%=session.getAttribute("member_Id")%>' != null ){
			let memberId = '<%=session.getAttribute("member_Id")%>';
			$.ajax({
				url : "/WatchaProject/content/CoComentUpdate.jsp",
				data : {Mn : movie_num,
						Cn : coment_num,
						Cns : coment_num_son,
						member : '<%=session.getAttribute("member_Id")%>'},
				datatype : "text",	// 결과 데이터 타입
				success : function(data) {
					window.location.reload();
					//getList();
				},
				error : function() {
					alert("데이터 오류");
					
				}
			});
		}else{
			alert("세션이 널 값이에요.");
		}
	}
	
	function deleteThis(movie_num,coment_num,coment_num_son,member_id) {
		
		//alert(movie_num +" "+ coment_num+ " "+coment_num_son +","+member_id);	
		if('<%=session.getAttribute("member_Id")%>' != null){
		$.ajax({
			url : "/WatchaProject/content/CoComentDelete.jsp",
			data : {Mn : movie_num,
					Cn : coment_num,
					Cns : coment_num_son,
					Mi : member_id },
			datatype : "text",	// 결과 데이터 타입
			success : function(data) {
				window.location.reload();
				//getList();
			},
			error : function() {
				alert("데이터 오류");
				
			}
		});
		
		}else{
			alert("세션이 널 값이에요.");
		}
		
	}

	
	$(function(){

	let cnt=0;
	
	function getList(){
	      let chkcoComent=0;
	      $.ajax({
	         url : "/WatchaProject/content/DoubleComent.jsp",
	         data : {movie_num : ${movie_dto.getMovie_num()},
	               coment_num :${coment_dto.getComent_num()} },
	         datatype : "xml",   // 결과 데이터 타입
	         success : function(data) {
	            cnt=0;
	            //$("#toggleDiv").html('<div class="card-header bg-light"> <i class="fa fa-comment fa"></i> 댓글</div><div class="card-body2" id="hidenDiv"></div>');
	            let tmp = $(data).find("coment").each(function(){
	            	let tmpId = $("member_id",this).text();
	            	
	            	let result = "<div class=\"card-body\"><ul class=\"list-group list-group-flush\">"+
		               "<li class=\"list-group-item\">"+ 
		               "<div><img alt=\"없\" src=\"\" width=\"20px\" height=\"20px\">"+$("member_id",this).text()+"</div><hr><textarea class=\"form-control\" rows=\"3\" readonly=\"readonly\">"+$("movie_coment",this).text()
		               +"</textarea><div id=\"togglediv\"><div><button type=\"button\" id=\"likethis1\" class=\"btn btn-secondary\" onclick= \"likethis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+")\"><img src=\"${pageContext.request.contextPath}/image/contImg/likeIt.png\" width=\"20px\" height=\"20px\">"+$("coment_hit",this).text()+"</button></div>"+
		               "<div class=\"btn-group\"><img alt=\"\" src=\"${pageContext.request.contextPath}/image/contImg/morelook.png\" width=\"20px\" height=\"20px\" class=\" btn-secondary btn-sm dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">"+
		               "<ul class=\"dropdown-menu\">";
	               
	               if( tmpId == '${sessionScope.member_Id}'){
	            	   result+="<li><a class=\"dropdown-item\" onclick=\"deleteThis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+",'"+$("member_id",this).text()+"')\">삭제</a></li>"+"</ul></div></div></li></ul></div>";
	               }else{
	            	   result+="<li><a class=\"dropdown-item\" onclick=\"alert('신고가 접수 되었습니다.')\">신고</a></li>"+"</ul></div></div></li></ul></div>";
	               }
	               $("#toggleDiv").append(result);
	               
	               
	               cnt++;
	               
	            });
	            $("#cocomentcnt").html("댓글 "+cnt+"개");

	         },
	         error : function() {
	            alert("데이터 오류");
	         }
	         
	      });
	      
	   }
	

	
	//좋아요
	$("#btncheck1").on("click",function(){
		
		// 임의의 세션 값
		let id ='<%=session.getAttribute("member_Id")%>';
		if(id){
			$.ajax({
				url : "/WatchaProject/content/ComentLike.jsp",
				data : {movie_num : ${movie_dto.getMovie_num()},
						coment_num :${coment_dto.getComent_num()},
						member_Id : id
						},
				datatype : "text",	// 결과 데이터 타입
				success : function(data) {
					location.href="<%=request.getContextPath()%>/wacha_coment.do?movie_num=${movie_dto.getMovie_num()}&coment_num=${coment_dto.getComent_num()}&member_Id=<%=session.getAttribute("member_Id")%>";
					
					
				},
				error : function() {
					alert("데이터 오류");
				}
				
			});
		
		}else{
			alert("로그인");
		}
	});
	
	let chk=0;
	//댓글
	$("#btncheck2").on("click",function(){
		// 임의의 세션 값
		let id ='<%=session.getAttribute("member_Id")%>';
		if(id){
			if(chk==0){
				$("#hidenDiv").append("<ul class=\"list-group list-group-flush\"> <li class=\"list-group-item\"><div><img alt=\"없\" src=\"\" width=\"20px\" height=\"20px\"><span><%=session.getAttribute("member_Id")%></span></div><textarea class=\"form-control\" id=\"area1\" rows=\"3\"></textarea><div align=\"right\"><button type=\"button\" id=\"btn3\" class=\"btn btn-secondary\">댓글달기</button></div></li></ul>");
				chk=1;
				$("#btn3").on("click",function(){
						
						$.ajax({
							url : "/WatchaProject/content/addComent.jsp",
							data : {movie_num : ${movie_dto.getMovie_num()},
									coment_num :${coment_dto.getComent_num()},
									member_Id : id,
									cocoment : $("#area1").val()},
							datatype : "text",	// 결과 데이터 타입
							success : function(data) {
								window.location.reload();
								//	getList();
							},
							error : function() {
								alert("데이터 오류");
							}
							
						});
						getList();
					
				});
			}else{
				$("#hidenDiv").html("");
				chk=0;
			}
		}else{
			alert("로그인부터 하세요");
		}	
	});
	//싫어요
	$("#btncheck3").on("click",function(){
		// 임의의 세션 값
		let id ='<%=session.getAttribute("member_Id")%>';
		if(id){
	
		$.ajax({
			url : "/WatchaProject/content/ComentHate.jsp",
			data : {movie_num : ${movie_dto.getMovie_num()},
					coment_num :${coment_dto.getComent_num()},
					member_Id : id
					},
			datatype : "text",	// 결과 데이터 타입
			success : function(data) {
				location.href="<%=request.getContextPath()%>/wacha_coment.do?movie_num=${movie_dto.getMovie_num()}&coment_num=${coment_dto.getComent_num()}&member_Id=<%=session.getAttribute("member_Id")%>";

			},
			error : function() {
				alert("데이터 오류");
			}
			
		});
		
		}else{
			alert("로그인");
		}
	});

	
	getList();
});


</script>
<style type="text/css" >
	#cocomentDiv{
		margin: 0 10%;
	}
	img{
		margin: 0  0 !important;
	}

	#ComentDiv{
		margin:  0 10%; 
		display: flex;
		flex-direction: column;
	}
	#Coment_member{
		display: flex;
		flex-direction: row;
	}
	#ComentTop{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	
	}
	img{
     	vertical-align: top !important;
	}
	#likeTag{
		display: flex;
		justify-content: center;
		align-items: center;
	
	}
	#likeTag > button{
		display : flex;
		align-content: center;
		justify-content: center;
		padding-right: :100px;
	}
	li{
		list-style: none;
	}
	#togglediv{
		display: flex;
		justify-content: space-between;
	
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	<div align="left" class="">
		<button type="button" class="btn btn-danger" onclick="location.href='wacha_content.do?movie_num=${coment_dto.getMovie_num()}'"><img src="${pageContext.request.contextPath}/image/contImg/back.png" width="10px" height="15px"></button>
	</div>
	<hr>
	<div id="ComentDiv">
	
		<!-- 상단 회원 정보 등 -->
		<div id="ComentTop">
				<div>
					<a>
						<div id="Coment_member">
							<img alt="없" src="">
							<div>
								${coment_dto.getMember_id()}
							</div>
						</div>
					</a>
					<a>
						<div>
							<div>
								${movie_dto.getMovie_title() }
							</div>
							<div>
								${movie_dto.getMovie_genre()} 
								${movie_dto.getMovie_date()}
							</div>
							<div>
								★
								${star_dto.getMovie_star() }
							</div>
						</div>
					</a>
				</div>
				<div>
					<img alt="" src="" width="70" height="114">
					<div class="btn-group">
					   <img alt="" src="${pageContext.request.contextPath}/image/contImg/morelook.png" width="20px" height="20px" class=" btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					  <ul class="dropdown-menu">
					  <c:choose>
						  <c:when test="${coment_dto.getMember_id() == sessionScope.member_Id}">
						  	<li><a class="dropdown-item" onclick="if('<%=session.getAttribute("member_Id")%>' == null){return;}else{ javascript:showPopUp()}">게시글 수정</a></li>
						    <li><a class="dropdown-item" onclick="if(confirm('정말로 삭제하시겠습니까?')){ location.href='wacha_coment_delete.do?movie_num=${movie_dto.getMovie_num()}&coment_num=${coment_dto.getComent_num()}';  alert('삭제되었습니다.');}else{ return;}">게시글 삭제</a></li>
						  </c:when>
						   <c:otherwise>
						    <li><a class="dropdown-item" href="">게시글 신고</a></li>
						   </c:otherwise>
					   </c:choose>
					    
					  </ul>
					</div>
				</div>		
		</div>
		
		<!-- 중단 게시글 내용 -->
		<div>
			<hr>
				${coment_dto.getMovie_coment()}
			<hr>
		</div>
		
		<!-- 좋아요 댓글 수 파악 -->
		<div>
			<span>좋아요 ${coment_dto.getComent_hit() } 개</span>
			<span>싫어요 ${coment_dto.getComent_nohit() } 개</span>
			<span id="cocomentcnt">댓글</span>
		</div>
		<hr>
		<div id="likeTag">
					<c:forEach items="${id_hit }" var="likeHate" varStatus="i">
						<c:choose>
							<c:when test="${i.index ==0}">
								<c:choose>
									<c:when test="${likeHate == 0}">
										<button type="button" class="btn btn-outline-primary" id="btncheck1" ><img src="${pageContext.request.contextPath}/image/contImg/likeIt.png" width="20px" height="20px">좋아요</button>
									</c:when>
									<c:otherwise>
											<button type="button" class="btn btn-outline-primary active" id="btncheck1" ><img src="${pageContext.request.contextPath}/image/contImg/likeIt.png" width="20px" height="20px">좋아요</button>
									</c:otherwise>
								</c:choose>							
							</c:when>
							<c:otherwise>
									<c:choose>
										<c:when test="${likeHate == 0}">
											<button type="button" class="btn btn-outline-danger" id="btncheck3"><img src="${pageContext.request.contextPath}/image/contImg/nono.png" width="20px" height="20px">싫어요</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-danger active" id="btncheck3"><img src="${pageContext.request.contextPath}/image/contImg/nono.png" width="20px" height="20px">싫어요</button>
										</c:otherwise>
									</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
              
              <button type="button" class="btn btn-outline-secondary" id="btncheck2"><img src="${pageContext.request.contextPath}/image/contImg/talk.png" width="20px" height="20px">댓글</button>    
         </div>
		</div>
		<hr>
		

	<div class="card mb-2" id="cocomentDiv">
		<div class="card-header bg-light">
		        <i class="fa fa-comment fa"></i> 댓글
		</div>
		<div class="card-body2" id="hidenDiv">

		</div>
		<div id="toggleDiv">
		
		</div>
	</div>
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>

