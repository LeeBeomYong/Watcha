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
<script type="text/javascript" defer="defer">

	function toggleList() {
		$("#toggleDiv").html("");
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
			               "<div><img class=\"marginimg\" alt=\"${pageContext.request.contextPath}/image/contImg/defualtImg.png\" src=\""+$("coment_image",this).text()+"\" width=\"20px\" height=\"20px\">"+$("member_id",this).text()+"</div><hr><textarea class=\"form-control\" rows=\"3\" readonly=\"readonly\">"+$("movie_coment",this).text()
			               +"</textarea><div id=\"togglediv\"><div><button type=\"button\" id=\"likethis1\" class=\"btn btn-secondary\" onclick= \"likethis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+")\"><img src=\"${pageContext.request.contextPath}/image/contImg/likeIt.png\" width=\"20px\" height=\"20px\"><font color=\"black\"> "+$("coment_hit",this).text()+"</font></button></div>"+
			               "<div class=\"btn-group\"><img alt=\"\" src=\"${pageContext.request.contextPath}/image/contImg/morelook.png\" width=\"20px\" height=\"20px\" class=\" btn-secondary btn-sm dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">"+
			               "<ul class=\"dropdown-menu\">";
		               
		               if( tmpId == '${sessionScope.session_id}'){
		            	   result+="<li><a class=\"dropdown-item\" onclick=\"deleteThis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+",'"+$("member_id",this).text()+"')\">삭제</a></li>"+"</ul></div></div></li></ul></div>";
		               }else{
		            	   let idd=<%=session.getAttribute("session_id")%>
		            	   result+="<li><a class=\"dropdown-item\" onclick=\" ";
		            	   result+="if('"+idd+"' != 'null'){ alert('신고가 접수 되었습니다.'); location.href='singo_update.do?member_id="+$("member_id",this).text()+"&coment_num=${coment_dto.getComent_num()}&movie_num=${coment_dto.getMovie_num()}&coment_id=${coment_dto.getMember_id()}'; }else{alert('로그인 후 이용해 주시기 바랍니다.');}\" >신고하기</a></li>"+"</ul></div></div></li></ul></div>";
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
	
	function likethis(movie_num,coment_num,coment_num_son) {
		//alert(movie_num +" "+ coment_num+ " "+coment_num_son);	
		
		if('<%=session.getAttribute("session_id")%>' != "null" ){
			let memberId = '<%=session.getAttribute("member_Id")%>';
			$.ajax({
				url : "/WatchaProject/content/CoComentUpdate.jsp",
				data : {Mn : movie_num,
						Cn : coment_num,
						Cns : coment_num_son,
						member : '<%=session.getAttribute("session_id")%>'},
				datatype : "text",	// 결과 데이터 타입
				success : function(data) {
					 toggleList();
				},
				error : function() {
					alert("데이터 오류");
					
				}
			});
		}else{
			alert("로그인 후 이용해 주시기 바랍니다.");
		}
	}
	
	function deleteThis(movie_num,coment_num,coment_num_son,member_id) {
		
		//alert(movie_num +" "+ coment_num+ " "+coment_num_son +","+member_id);	
		if('<%=session.getAttribute("session_id")%>' != "null"){
		$.ajax({
			url : "/WatchaProject/content/CoComentDelete.jsp",
			data : {Mn : movie_num,
					Cn : coment_num,
					Cns : coment_num_son,
					Mi : member_id },
			datatype : "text",	// 결과 데이터 타입
			success : function(data) {
				 toggleList();
			},
			error : function() {
				alert("데이터 오류");
				
			}
		});
		
		}else{
			alert("로그인 후 이용해 주시기 바랍니다.");
		}
		
	}
	
	
	
	$(function(){

		$(".btn-open-popup2").on("click",function(){  
	    	$(".modal_body2").css("display","block");
	    	$(".modal2").css("display","block");
	    });
		
		$(".btn-close").on("click",function(){
	    	$(".modal_body2").css("display","none");
	    	$(".modal2").css("display","none");
	    });
		
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
		               "<div><img class=\"marginimg\" alt=\"\" src=\"${pageContext.request.contextPath}/image/contImg/defualtImg.png\" width=\"20px\" height=\"20px\">"+$("member_id",this).text()+"</div><hr><textarea class=\"form-control\" rows=\"3\" readonly=\"readonly\">"+$("movie_coment",this).text()
		               +"</textarea><div id=\"togglediv\"><div><button type=\"button\" id=\"likethis1\" class=\"btn btn-secondary\" onclick= \"likethis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+")\"><img src=\"${pageContext.request.contextPath}/image/contImg/likeIt.png\" width=\"20px\" height=\"20px\"><font color=\"black\"> "+$("coment_hit",this).text()+"</font></button></div>"+
		               "<div class=\"btn-group\"><img alt=\"\" src=\"${pageContext.request.contextPath}/image/contImg/morelook.png\" width=\"20px\" height=\"20px\" class=\" btn-secondary btn-sm dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">"+
		               "<ul class=\"dropdown-menu\">";
	               
	               if( tmpId == '${sessionScope.session_id}'){
	            	   result+="<li><a class=\"dropdown-item\" onclick=\"deleteThis("+$("movie_num",this).text()+","+$("coment_num",this).text()+","+$("coment_num_son",this).text()+",'"+$("member_id",this).text()+"')\">삭제</a></li>"+"</ul></div></div></li></ul></div>";
	               }else{
	            	   let idd=<%=session.getAttribute("session_id")%>
	            	   result+="<li><a class=\"dropdown-item\" onclick=\" ";
	            	   result+="if('"+idd+"' != 'null'){ alert('신고가 접수 되었습니다.'); location.href='singo_update.do?member_id="+$("member_id",this).text()+"&coment_num=${coment_dto.getComent_num()}&movie_num=${coment_dto.getMovie_num()}&coment_id=${coment_dto.getMember_id()}'; }else{alert('로그인 후 이용해 주시기 바랍니다.');}\" >신고하기</a></li>"+"</ul></div></div></li></ul></div>";
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
		let id ='<%=session.getAttribute("session_id")%>';
		if(id !="null"){
			$.ajax({
				url : "/WatchaProject/content/ComentLike.jsp",
				data : {movie_num : ${movie_dto.getMovie_num()},
						coment_num :${coment_dto.getComent_num()},
						member_Id : id
						},
				datatype : "text",	// 결과 데이터 타입
				success : function(data) {
						$("#liketag").html(data+' 개');
						if($("#btncheck1").hasClass("active") == true){
							$("#btncheck1").removeClass("active");
							
						}else{
							$("#btncheck1").addClass("active");
						}		
				},
				error : function() {
					alert("데이터 오류");
				}
				
			});
		
		}else{
			alert("로그인 후 이용해 주시기 바랍니다.");
		}
	});
	
	let chk=0;
	//댓글
	$("#btncheck2").on("click",function(){
		// 임의의 세션 값
		let id ='<%=session.getAttribute("session_id")%>';
		if(id !="null"){
			if(chk==0){
				$("#hidenDiv").append("<ul class=\"list-group list-group-flush\"> <li class=\"list-group-item\"><div><img class=\"marginimg\" alt=\"없\" src=\"${pageContext.request.contextPath}/image/contImg/defualtImg.png\" width=\"20px\" height=\"20px\"><span><%=session.getAttribute("session_id")%></span></div><textarea class=\"form-control\" id=\"area1\" rows=\"3\"></textarea><div id=\"btn3div\" align=\"right\"><button type=\"button\" id=\"btn3\" class=\"btn btn-secondary\">댓글달기</button></div></li></ul><hr>");
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
								$("#hidenDiv").html("");
								$("#toggleDiv").html("");
								
								getList();
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
			alert("로그인 후 이용해 주시기 바랍니다.");
		}	
	});
	//싫어요
	$("#btncheck3").on("click",function(){
		// 임의의 세션 값
		let id ='<%=session.getAttribute("session_id")%>';
		if(id !="null"){
	
		$.ajax({
			url : "/WatchaProject/content/ComentHate.jsp",
			data : {movie_num : ${movie_dto.getMovie_num()},
					coment_num :${coment_dto.getComent_num()},
					member_Id : id
					},
			datatype : "text",	// 결과 데이터 타입
			success : function(data) {
				$("#hatetag").html(data+' 개');
				if($("#btncheck3").hasClass("active") == true){
					$("#btncheck3").removeClass("active");
					
				}else{
					$("#btncheck3").addClass("active");
				}
			},
			error : function() {
				alert("데이터 오류");
			}
			
		});
		
		}else{
			alert("로그인 후 이용해 주시기 바랍니다.");
		}
	});

	
	getList();
});

	
	
    $(document).mouseup(function (e){
		if($(".modal2").has(e.target).length === 0) {
			$(".modal_body2").css("display","none");
	    	$(".modal2").css("display","none");
		}
    });
    
  


</script>
<style type="text/css" >

	img{
		margin: 0  0 !important;
	}

	#ComentDiv{
		margin:  0 10%; 
		display: flex;
		flex-direction: column;
		border:1px solid black;
		border-radius: 2%;
	}
	#ComentDiv > div{
		padding: 2% 3%;
	}
	#Coment_member{
		display: flex;
		flex-direction: row;
	}
	#ComentTop{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding-bottom: 0 !important;
	
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
		margin-top: 1%;
	
	}
	
	.modal2 {
        display: none; /* Hidden by default */
		position: absolute; /* Stay in place */
		 /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		padding-top: 60px;
      }
      .modal2.show {
        display: block;
      }
      .modal_body2 {
       border-radius: 10px;
		width: 400px;
		height: 400px;
		z-index: 2;
		position: absolute;
		text-align: center;
		background-color: #fff;
		margin-top: -2%;
		top:50%; 
		left:50%;
		transform: translate(-50%,-50%);
		padding: 5px;
		display: none;
     }
     .modal_body2 div{
     	margin: 3% 0;
     }
	 #modal_be{
	 	display: flex;
	 	justify-content: space-between;
	 	margin: 2% 3%;
	 }
	 #modal_input{
	 	width: 390px;
	 	height: 230px;
	 	display: flex;
	 	justify-content: center;
	 	align-items: center;
	 }
	 .list-group-item div{
	 	display: flex;
	 	align-items: center;
	 }
	 
	.marginimg{
		border-radius: 50%;
		margin-right:2% !important;
	}
	
	#btn3div{
		
		display: flex;
		justify-content: flex-end;
		margin-top: 1%;
	}
	#hidenDiv{
	
		padding: 16px;
	}
	a{
		text-decoration: none !important;
		
	}
	a:hover{
		transform : none !important;
	}
	#setdiv{
		display: flex;
		
	}
	hr{
		margin: 1% 0 !important;
	}
	#cdiv{
		height: 200px;
	}
	#likethis1{
		display: flex;
		align-content : center;
		background-color: white;
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
						<c:choose>
							<c:when test="${not empty user_dto}">
								<img alt="없" src="${user_dto.getMember_image()}" width="30px" height="30px">
							</c:when>
							<c:otherwise>
								<img alt="없" src="${pageContext.request.contextPath}/image/contImg/defualtImg.png" width="30px" height="30px">
							</c:otherwise>
						</c:choose>
						
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
								<font color="red">★</font>
								${star_dto.getMovie_star() }
							</div>
						</div>
					</a>
				</div>
				<div id="setdiv">
					<img alt="" src="${images[0] }" width="70" height="114">
					<div class="btn-group">
					   <img alt="" src="${pageContext.request.contextPath}/image/contImg/morelook.png" width="20px" height="20px" class=" btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					  <ul class="dropdown-menu">
					  <c:choose>
						  <c:when test="${coment_dto.getMember_id() == sessionScope.session_id}">
						  	<li><a class="dropdown-item btn-open-popup2">게시글 수정</a></li>
						    <li><a class="dropdown-item" onclick="if(confirm('정말로 삭제하시겠습니까?')){ location.href='wacha_coment_delete.do?movie_num=${movie_dto.getMovie_num()}&coment_num=${coment_dto.getComent_num()}';  alert('삭제되었습니다.');}else{ return;}">게시글 삭제</a></li>
						  </c:when>
						   <c:otherwise>
						    <li><a class="dropdown-item" onclick="if(<%=session.getAttribute("session_id")%> != null){ alert('신고가 접수되었습니다.'); location.href='singo_update.do?member_id=${coment_dto.getComent_num()}&coment_num=${coment_dto.getComent_num()}&movie_num=${coment_dto.getMovie_num()}&coment_id=${coment_dto.getMember_id()}'; }else{ alert('로그인 후 이용해 주시기 바랍니다.');}">게시글 신고</a></li>
						   </c:otherwise>
					   </c:choose>
					    
					  </ul>
					</div>
				</div>		
		</div>
		
		<!-- 중단 게시글 내용 -->
		<div id="cdiv">
			<hr>
				${coment_dto.getMovie_coment()}
			
		</div>
		
		<!-- 좋아요 댓글 수 파악 -->
		<div>
		
			<span>좋아요 <span id="liketag">${coment_dto.getComent_hit() } 개</span></span>
			<span>싫어요 <span id="hatetag">${coment_dto.getComent_nohit() } 개</span></span>
			<span id="cocomentcnt">댓글</span>
		<hr>
		</div>
		
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
         	
			<div class="card mb-2" id="cocomentDiv">
				<div class="card-header bg-light">
				        <i class="fa fa-comment fa"></i> 댓글
				</div>
				<div class="card-body2" id="hidenDiv">
		
				</div>
				<div id="toggleDiv">
				
				</div>
			</div>
		</div>
	
	
	
	<div class="modal2">
      <div class="modal_body2">
      	<form action="<%=request.getContextPath()%>/wacha_coment_Ok.do">
      		<input type="hidden" value="${sessionScope.member_Id}" name="member_Id">
        	<input type="hidden" value="${movie_dto.getMovie_num()}" name="movie_num">
      		
      		<div id="modal_be">
      			<span>${movie_dto.getMovie_title()}</span>
      			<button type="button" class="btn-close" aria-label="Close"></button>
      		</div>
      		<div id="modal_input" class="ratio ratio-1x1">
      			<textarea rows="10" cols="9" name="content">${coment_dto.getMovie_coment() }</textarea>
      		</div>
      		<div>
				<c:if test="${!empty coment_dto }">
      				<button type="submit" class="btn btn-danger">수정</button>
				</c:if>
				<c:if test="${empty coment_dto }">
      				<button type="submit" class="btn btn-danger">등록</button>
				</c:if>
      		</div>
      		
      		<div>
      			<img src="./image/watchapedia2.png" alt="왓챠피디아 로고" title="왓챠피디아" width="250" height="50" />
      		</div>
      </form>
      </div>
  	</div>
	
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>

