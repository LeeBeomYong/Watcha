<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 임시 세션 로그인 -->
<%
	session.setAttribute("member_Id", "test1"); 
	System.out.println("로그인한 회원 아이디 >>> "+session.getAttribute("member_Id"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/content/contcss/contcss.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" defer="defer">

$(function() {
	let count=0;
	let look=0;		
	if('<%=session.getAttribute("member_Id")%>' !=""){
		count=${heart};
		look = ${watch};
	}
	function getMovieStar(){
		
		 $.ajax({
	            type : "post",
	            url : "/WatchaProject/content/GetMoviestar.jsp",
	            data : { movieNum : $("#croll").val()},
	            datatype : "text",
	            success : function(data){
	            	
					$("#avgs").html("평균 ★"+data+"점 ");
				},
	            error : function(){
	               alert('데이터 통신 에러');
	            }
	            
	         });
	}
	function getEvalCount() {
		 
		$.ajax({
	            type : "post",
	            url : "/WatchaProject/content/GetEvalCount.jsp",
	            data : { movieNum : $("#croll").val()},
	            datatype : "text",
	            success : function(data){
					$("#evalcount").html("("+data+"명)");
				},
	            error : function(){
	               alert('데이터 통신 에러');
	            }
	            
	            
	         });
	}
	
	
	// 그래프 출력
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
		
	function drawVisualization() {	    
	        
	         $.ajax({
	            type : "post",
	            url : "/WatchaProject/content/Graph.jsp",
	            data : { movieNum : $("#croll").val()},
	            datatype : "text",
	            success : function(res){
					let data = new google.visualization.DataTable();
					data.addColumn('string', 'Element');
				    data.addColumn('number', 'number');
					
	               	let listdata = res.split(",");
	               
					 data.addRows([
	                       ['1점',Number(listdata[0])],
	                       ['2점',Number(listdata[1])],
	                       ['3점',Number(listdata[2])],
	                       ['4점',Number(listdata[3])],
	                       ['5점',Number(listdata[4])]    
	                  ]);
	               
	               let options={
									title : '별점 그래프',
									seriesType : 'bars',
									series : {5 : {type : 'line'}}
								};
				   let chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
				   chart.draw(data,options);
	            },
	            error : function(){
	               alert('데이터 통신 에러');
	            }
	            
	            
	         });
	             
		
	}
	//별 그리기
	function star(star) {
		$.ajax({
			type : "post",
			url : "/WatchaProject/content/Star.jsp",
			data : {star : star.value,
					movieNum : ${mDto.getMovie_num()},
					member_Id : '<%=session.getAttribute("member_Id")%>'
					},
			datatype : "text",
			success : function(data){
				getMovieStar();
				getEvalCount();
				drawVisualization();
			},
			error : function(){
				alert('데이터 통신 에러');
			}
			
			
		});
	}
		let star_chk=0;
		let curent_star=0;
		$("input[name=reviewStar]").on("click",function(){
			if('<%=session.getAttribute("member_Id")%>' !=""){
				$("label").css({"text-shadow":"0 0 0 #f0f0f0" , "color":"transparent"});
				$("label").hover(function(){
					$(this).css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
				});
				$("label:hover~lable").css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
				$("input[type=radio]:checked ~ label").css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
				
				if(star_chk==0){
					star(this);
					star_chk=1;
					curent_star=this;	
				}else if(star_chk != 0 && curent_star == this){
					star_chk=0;
					$("label").css("text-shadow", "0 0 0 #f0f0f0");
					$("label").hover(function(){
						$(this).css("text-shadow","0 0 0 #f0f0f0");
					});
					star(0);
				}else{
					star(this);
					star_chk=0;

				}
			}else{
				alert("로그인 부터 ㅠㅠ");
				if(star_chk==0){
					$("label").css({"text-shadow":"0 0 0 #f0f0f0" , "color":"transparent"});
					$("label").hover(function(){
						$(this).css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
					});
					$("label:hover~lable").css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
					$("input[type=radio]:checked ~ label").css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
					
					star_chk=1;
					
					// 문제 발생 지점 구간
				}else{
					$("label").css("text-shadow", "0 0 0 #f0f0f0");
					$("input[type=radio]:checked ~ label").css("text-shadow","0 0 0 #f0f0f0");
					$("label").hover(function(){
						$(this).css("text-shadow","0 0 0 rgba(250, 208, 0, 0.99)");
					});
					
					star_chk=0;
				}
				
				
			}	
			});
		
		// 보고 싶어요 이미지 변경
		$("#topDiv_cont2_btn1").on("click",function(){
			if('<%=session.getAttribute("member_Id")%>' !=""){
			if(count ==0 && look != 1){
				$("#img1").attr("src","${pageContext.request.contextPath }/image/contImg/bookmark.png");
				count=1;
			}else if(look!=1 && count == 1){
				$("#img1").attr("src","${pageContext.request.contextPath }/image/contImg/plus.png");
				count=0;
			}else{
				$("#img1").attr("src","${pageContext.request.contextPath }/image/contImg/plus.png");
			}
				$.ajax({
					type : "post",
					url : "/WatchaProject/content/WantSee.jsp",
					data : {
							movieNum : ${mDto.getMovie_num()},
							memberId : '<%=session.getAttribute("member_Id")%>',
							countchk : count
							},
					datatype : "text",
					success : function(data){
						drawVisualization();
					},
					error : function(){
						alert('데이터 통신 에러');
					}				
			});
			}else{
				alert("로그인 부터 ㅠㅠ");
			}
			
		});
		// 코멘트 달기
		
		//보는중 색깔변경
		$("#topDiv_cont2_btn3").on("click",function(){	
			if('<%=session.getAttribute("memberId")%>' != "" ){
			if(look==0){	
				look=1;
				$("#img3").attr("src","${pageContext.request.contextPath}/image/contImg/eye.png");	
				$.ajax({
					type : "post",
					url : "/WatchaProject/content/Looking.jsp",
					data : {
							movieNum : ${mDto.getMovie_num()},
							memberId : '<%=session.getAttribute("member_Id")%>',
							lookchk : look
							},
					datatype : "text",
					success : function(data){
						drawVisualization();
					},
					error : function(){
						alert('데이터 통신 에러');
					}
				});
				
			}else{
				look=0;
				$("#img3").attr("src","${pageContext.request.contextPath}/image/contImg/checkeye.png");	
				$.ajax({
					type : "post",
					url : "/WatchaProject/content/Looking.jsp",
					data : {
							movieNum : ${mDto.getMovie_num()},
							memberId : '<%=session.getAttribute("member_Id")%>',
							lookchk : look
							},
					datatype : "text",
					success : function(data){
						drawVisualization();
					},
					error : function(){
						alert('데이터 통신 에러');
					}
					
					
				});
				
			}
				
			}else{
				alert("로그인 부터 ㅠㅠ");
			}
			
		});	
		
		if('<%=session.getAttribute("memberId")%>' != "" ){
			$("#rate${6-star_dto.getMovie_star()}").attr("checked","checked");
		}
		
		
	}); // 제이쿼리 end 부분
	
	function showPopUp() {
		if('<%=session.getAttribute("memberId")%>' != ""){
			 //창 크기 지정
		    var width = 500;
		    var height = 300;
		
		    //pc화면기준 가운데 정렬
		    var left = (window.screen.width / 2) - (width/2);
		    var top = (window.screen.height / 4);
		
		       //윈도우 속성 지정
		    var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		       //연결하고싶은url
		    const url = "${pageContext.request.contextPath}/content/MyOpinion.jsp?movie_num=${mDto.getMovie_num()}&member_Id=${sessionScope.member_Id}";
		       
		    //등록된 url 및 window 속성 기준으로 팝업창을 연다.
		    window.open(url, "hello popup", windowStatus);
		}else{
			alert("로그인 부터 ㅠㅠ");
		}
	}
	
	

	
</script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/contjs/contJs.js" defer="defer"></script>

</head>
<body>
	<jsp:include page="../include/user_top.jsp"/>
	
	
	<!-- 임시 로그인 세션 값  -->
	
	
	<input type="hidden" value="1" id="croll">
	<div id="topImg">
			<%-- 상단 예매 순위 / 개봉 날짜 / 평균 별점 --%>
			<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/black_adam_content_main.jpg" width="100%" height="400px">
			<div id="topShow">
				<div id="topDiv_img">
					<img alt="이미지 없음" src="${pageContext.request.contextPath }/image/contImg/black_adam_content_sub.jpg" width="150px">
				</div>
			<div id="topDiv_cont">
				<ul>
					<li>예매 순위 1${rank}위</li>
					<li>개봉 날짜 /10/17${movie_date.substring(0,10)}일</li>
					<li>왓챠 평점 ${avgStar }점</li>
				</ul>
			</div>
				
			</div>
		</div>
	
	
	<%-- 상단 페이지 내용  --%>
	<div id="topDiv">
			<div id="topDiv_top">
				<h4 id="title">${mDto.getMovie_title() }</h4>
				${mDto.getMovie_date()} ${mDto.getMovie_genre()} ${mDto.getMovie_country()} 	
				<div>
					<hr>
						<span id="avgs">평균 ★${avgStar}점</span><span id="evalcount">(<fmt:formatNumber value="${count}"/>명)</span>
					<hr>
				</div>
				<div id="topDiv_bottom">	
					<div class="topDiv_cont1">
						<p>평가하기</p>
						<div id="evalScore">
						
							<fieldset>
								<input type="radio" name="reviewStar" value="5" id="rate1" ><label
									for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>

						</div>
					</div>
					<div class="updown"></div>	
					<div class="topDiv_cont2">
						<button id="topDiv_cont2_btn1">
							<div class="cont2_btn">
								<c:choose>
									<c:when test="${not empty heart && heart ==1 }">
										<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/bookmark.png" width="20px" height="20px" id="img1">
									</c:when>
									<c:otherwise>
										<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/plus.png" width="20px" height="20px" id="img1">
									</c:otherwise>
								</c:choose>
								
								<span class="cont2_btn_span">보고 싶어요</span>
							</div>
						</button>
						<button id="topDiv_cont2_btn2">
							<a id ="a1" href="javascript:showPopUp()">
								<div class="cont2_btn">
									<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/pen.png" width="20px" height="20px">
									코멘트
								</div>
							</a>
						</button>
						<button id="topDiv_cont2_btn3">
							<div class="cont2_btn">
								<c:choose>
									<c:when test="${not empty watch && watch ==1 }">
										<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/eye.png" width="20px" height="20px" id="img3">
									</c:when>
									<c:otherwise>
										<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/checkeye.png" width="20px" height="20px" id="img3">
									</c:otherwise>
								</c:choose>
								
								
								
								<span class="cont2_btn_span">보는중</span>
							</div>
						</button>
						<button id="topDiv_cont2_btn4">
							<div class="cont2_btn">
					   			<img alt="" src="${pageContext.request.contextPath}/image/contImg/more.png" width="20px" height="20px" class=" btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
							  	<span>더보기</span>
							  <ul class="dropdown-menu">
								  	<li><a class="dropdown-item" >관심없어요</a></li>
							  </ul>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	<div id="graydiv">
	<div id="realTop">
	<%-- 기본 정보  || 유튜브 영상 및 갤러리 --%>
	<div id="centerDiv">
		<!-- 상세 정보 (내용/출연진/그래프/코멘트/컬렉션) Div -->
		<div id="cd_data">
			<c:if test="${!empty coment_dto}">
			<div id="cd_hiden">
				<div>
					 <img alt="" width="50px" height="50px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
					 <span>${coment_dto.getMovie_coment()}</span>
				</div>
				<div>
				 	<button  class="btn btn-danger" onclick="javascript:showPopUp()">수정</button>&nbsp;&nbsp;|&nbsp;&nbsp;
				 	<button  class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/wacha_coment_delete.do?movie_num=${coment_dto.getMovie_num()}&conment_num=${coment_dto.getComent_num() }'">삭제</button>
				</div> 
			</div>
			<hr>		
			</c:if>
		
		
		
			<div id="cd_cont1">
				<h4>기본정보</h4>
				<a href="<%=request.getContextPath()%>/wacha_contentInfo.do?movie_num=1${dto.movie_num}" class="moreCont">더보기</a>
			</div>
			
			<div id="cd_cont2">
				<span>${mDto.getMovie_date() } ${mDto.getMovie_country() } ${mDto.getMovie_genre() }</span><br>
				<span>${mDto.getMovie_time()} ${mDto.getMovie_age()}세</span><br>
				<span>
				${mDto.getMovie_cont() }
				</span>
			<hr>
			</div>
			<%-- 출연/제작 정보 영역 --%>
			<div>	
				<h4 id="director_title">출연/제작</h4>	
				<div>
					<ul>
						<li class="director_actor">
							<a href="<%=request.getContextPath()%>/wacha_director_list.do?director=${mDto.getMovie_director()}" ><img alt="없" width="30px" height="30px" id="direcImg" src="${pageContext.request.contextPath }/image/contImg/black_adam_director.jpg"></a>
							<div>
								<span>${mDto.getMovie_director()}<br>감독</span>
								
							</div>
						</li>
						<c:choose>
							
							<c:when test="${!empty movie_director }">
								<c:forEach items="${movie_director}" var="dir">
									<li class="director_actor">
										<a href="#"><img alt="없" width="56px" height="56px" src=""></a>
										<div>
											<span>${movie_director}</span><br>
											<span>${movie_director}</span>
										</div>
									</li>
						
								</c:forEach>
							</c:when>
							
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
				<hr>
			</div>			
			
			<%-- 별점 그래프 영역 --%>
			
			<div >	
			 	<div id="star_title">
			 		<div>
			 			<h4>별점 그래프</h4>
			 		</div>
			 		
			 		<div>
			 			<span>평균★${avgStar}<br>(${count})명</span>
			 		</div>
			 	</div>
			 	
			 	
			 	<%-- 그래프 영역 --%>
			 	<div id="star_graph"> 	
			 	
			 			<div class="graphBox">

							<div id="chart_div">
							
							</div>

						</div>
			 	</div>
				
				<hr>
			</div>
			
			
			
			<%-- 코멘트 영역  --%>          
            <div >
            
            <%-- 코멘트 상단 --%>
				<div id="coment_title">
			 		<div>
			 			<h4>코멘트 <span>${coment_count }+</span></h4>
			 		</div>
			 		
			 		<a href="<%=request.getContextPath()%>/wacha_comentList.do?movie_num=1" class="moreCont">더보기</a> 
			 	</div>
		<%-- 코멘트 리스트 영역 --%> 	
           <%--게시글 상단 --%>
               <div id="mainComent_div">
                  <div id="carouselExampleControlsNoTouching2" class="mh-100 carousel slide" data-bs-touch="false" data-bs-interval="false">
                  <div class="carousel-inner align-middle">
            <c:choose>
                  <c:when test="${!empty clist }">
                     <c:forEach items="${clist }" var="coment" varStatus="s">
                     <%-- 코멘트 리스트 영역 --%>
                     <c:choose>
                         <c:when test="${s.index == 0 }">
                               <div class="coment_div carousel-item active">
                                       <div class="coment_top">
                                          <div>
                                             <img alt="" width="40px" height="40px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
                                             <span>${coment.getMember_id() }</span>
                                          </div>
                                          <div>
                                             <img alt="없" src="">
                                          </div>
                                       </div>
                                       <hr>
                                       <%--게시글 중단 --%>
                                       <a href="<%=request.getContextPath()%>/wacha_coment.do?coment_num=${coment.getComent_num() }&movie_num=${coment.getMovie_num()}&member_Id=${coment.getMember_id()}">
                                       <div class="coment_midle">
                                          <span>
                                             ${coment.getMovie_coment() }
                                          </span>
                                       </div>
                                       </a>
                                       <hr>
                                       <%--게시글 하단 --%>
                                       <div>
                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/likeIt.png" width="15px" height="15px">&nbsp; <span>${coment.getComent_hit()}</span>
                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/talk.png" width="15px" height="15px">&nbsp; <span>${coment.getCocoment_count()}</span>
                                       </div>
                                       <hr>
                                       <div>
                                          <a href="#">좋아요</a>
                                       </div>
                              </div>   
                         
                         </c:when>
                         <c:otherwise>
                              <%--게시글 상단 --%>
                              <div class="coment_div carousel-item">
                                 <div class="coment_top">
                                    <div>
                                       <img alt="" width="40px" height="40px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
                                       <span>${coment.getMember_id() }</span>
                                    </div>
                                    <div>
                                       <img alt="없" src="">
                                    </div>
                                 </div>
                                 <hr>
                                 <%--게시글 중단 --%>
                                 <a href="<%=request.getContextPath()%>/wacha_coment.do?coment_num=${coment.getComent_num() }&movie_num=${coment.getMovie_num()}&member_Id=${coment.getMember_id()}">
                                 <div class="coment_midle">
                                    <span>
                                       ${coment.getMovie_coment() }
                                    </span>
                                 </div>
                                 </a>
                                 <hr>
                                 <%--게시글 하단 --%>
                                 <div>
                                    <img alt="" src="${pageContext.request.contextPath }/image/contImg/likeIt.png" width="15px" height="15px">&nbsp; <span>${coment.getComent_hit()}</span>
                                    <img alt="" src="${pageContext.request.contextPath }/image/contImg/talk.png" width="15px" height="15px">&nbsp; <span>${coment.getCocoment_count()}</span>
                                 </div>
                                 <hr>
                                 <div>
                                    <a href="#">좋아요</a>
                                 </div>
                              </div>         
                        </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </c:when>
               </c:choose>
               </div>
               <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching2" data-bs-slide="prev">
                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                   <span class="visually-hidden">Previous</span>
                 </button>
                 <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching2" data-bs-slide="next">
                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                   <span class="visually-hidden">Next</span>
                 </button>
           		 </div>
                </div>
               </div>  
					<hr>
			
				<div id="same_movie">
					<h4>비슷한 작품</h4>
				</div>
				<ul id="sm_ul">
					
					<li class="same_movie_list">
						<a  href="#">
							<img alt="없" src="data:image/jpeg;base64,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" width="80px" height="100px">
							<div>
								<div>아쿠아맨</div>
								<div>평균 ★ 3.2</div>
								<div>영화</div>
							</div>
						</a>
					</li>
				<c:forEach items="${same}" var="same" varStatus="status">
					
					<%--max 4개 li 영역 분리 --%>
					<c:if test="${status.index %4==0}">
						<br>
					</c:if>
					
					<li class="same_movie_list">
						<a title="" href="#">
							<div><img alt="없" src=""></div>
							<div>
								<div>${same.getname()}</div>
								<div>평균 ★ ${same.avgstar() }</div>
								<div>${same.movie_genre() }</div>
							</div>
						</a>
					</li>
				</c:forEach>
				</ul>
			
		
			
	
		</div>	
	</div><%-- 상세 페이지 끝 영역 --%>
	
	<!-- 미리보기 영상/갤러리 Div -->
	      <div id="cd_youtube">
         
         <%-- 동영상 재생 부분 --%>
      <div id="cd_youFirst">
          <iframe id="player" type="text/html" width="300" height="300" src="https://www.youtube.com/embed/9qQuoqpw7KA?autoplay=1&mute=1" frameborder="0"></iframe>
           
              <%-- 동영상 하단 div --%>
           <div id="cd_youCont">
              <div class="cd_youCont_div">
                 <h4>80일간의 세계 일주</h4>
                 <span>150년 후에도 모험은 계속된다!</span>
                 <div>
                    <img alt="없" src="${pageContext.request.contextPath }/image/contImg/wachaimg.png" width="20px" height="20px">
                    <span>왓챠 익스클루시브</span>
                 </div>
              </div>
              <div class="cd_youCont_div">
                 <button type="button" class="btn btn-danger" onclick="window.open('https://search.naver.com/search.naver?query=${mDto.getMovie_title()}');">더보기</button>
              </div>
           </div>   
        </div>
           
           
           <%-- 추가 갤러리 및 div  --%>
        <div id="galleryAndVedio">
              
              <div id="gallery">
                 <h5>갤러리</h5>
				<hr>
                 <div id="carouselExampleControlsNoTouching" class="mh-100 carousel slide" data-bs-touch="false" data-bs-interval="false">
					  <div class="carousel-inner align-middle">
					    <div class="carousel-item active">
					      <img class="d-block w-100 mh-100" alt="..." src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhYYGRgaHBoaGhoaGhgaGhgaGhocGhoaGBgcIS4lHB4rIRgaJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISGjQhISE0NDQxNDQ0NDExNDQ0NDQ0NDQ0NDQ0NDQ0MTQ0NDY0NDQ0NDQ0NDQ0NDQ0MTQ0NDQ0Mf/AABEIALcBEwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACAwABBAUGB//EADcQAAEDAgQDBgQGAgIDAAAAAAEAAhEDIQQSMUEFUXEiYYGRobETMsHwBkJS0eHxFGKCoiNywv/EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMEBf/EACERAQEBAQADAQACAwEAAAAAAAABAhEDITFBElEEQpEi/9oADAMBAAIRAxEAPwBPDcZk2XVw3Emz2l5tjloYuCxUrp4l/wAR/Z0XTw+HaBdcGhiC3QLbQxTiZJSsOOhWZcwLK8NQJkhKrV1swuK2ASNqw1CBJSa9zZM+PmN9E01WAGNUGT8QMElIxHEZByrHiKpcYBWPECEF0IoufJMrJUYQYBW2ljMohYnukynCPoPc3dPY4u1KyspkrRTYUqBvbNglmneFsosXV4LwoVana+RsF3fyb4+wKeZbeQx8E4C6oMxAa39RGv8A6jfqvRswtCgPlBcNzBd4TotdfEBggQIFhy/heJ4rxDtuM9L6rosz45/dX4vFd338dzG/iFo2jxXAx/HGVNgSNyYI6HXwXm8Zii8HN4/suRiMSNgQB33t4KJ5Lr1XTrwZzHo34zOTBmNRuOqfRevG0OIuDgQYGkuk+BO67eGx2duYW2I5H9lGsc9xzazx1366hZOJGGrG+qeay1XuOpUyM7SA0TK20KgdYLm1GlHgq+RyqwpeO/RptJBOqDiFb8oSxjmRJKyHFszSSokqrYNrYBtdBhKZJMrT/nsifRYWY8FxiyfsvRmKZlRYNhmUjG4ptjqsFTiThoUTNsK2ddzEYl/ygWWEPLSS5Iw3ETFysmJxWY62TmRa1nHt5KLm/HYor/inrswnMelgogUlCzI2VSEl4RsKA1f5B3W7DYyFxwbprTyU2G7LseUh1crKwosyXAY2oQZVVqhKW5yolPgAVbSo5yqUAfxyEYxZSnwqaEuBvo4owvc8EZ8Og0nV3bdz7WgjuEeq8BhG5ntb+pzW+Zhe++J2XGQ1t4mx/paeL1etM565+MxRJJv/AAvOcTqBxuY2hbsZiA3Rwd0MrhcSqTvAAnwB/pG713ePMjBiXbey4WNfK7mJcA15MSHmn0j+157EukoxPY8t9MrnLpcExMPDZsbH3Hr7rlPKbgnQ9p/2b7hbWdji09i6Emo1FKo3XMxY3tSajVreFmeFREuYUshaSUl7kAuVWUqw5C56ogOSHlE9xS0yXTfBVYkgmykK8qARlURqJ9Lj0YVkqmqnLM+mtdKhslsKMlCpVZrrQwJbIT2lBxcFG0lW1FlUmBygciLUACAhKEtVkK4QElWFCFRQHo+DHO5jHNGVhY5pAAILgCZIEntA6/tFfjHEvkUqbS7KNJAEm8uOtrKuBuINI3DRmc50WOU9lpOnf0C0Y3FtLi4ESZ19k831evQzmXlzPyf9eBxlPEteQXHsjMXQQ3uAJcc2vduIQ4Z9etLXHNnIDnHZsyQItsvQYzhNSs/UNbzn2AF1up8PbQpugyGtJnvIP7p3XZ8VMcvuvDY/GjO+xgvLh7fRc5+JBsB63UxAlx7ytDWtaCQ0Sd7+2i1zJJ7c+7q30wXPcm0BLmjvA9QlgxIR4eoWvDhEgg308VbPj17VHLJgsY+oHOfl+aBkY1gFhaGi+upk960yuazjHU/jeUDkohE9UEEWWpD6a15Uuo2yAxPpoIToQuaFXUsr2pcLS5qU5qZFwhITEDkwWorUQHow1QBNQxKgcLLbKwU3KgyoCmpjSUGVG1CoNj05tRJATWMSpxZJKogpzQrypGSiCtwUagKIQkJkqgEB3OA1m/DewkB2Ylo3MsIt0ym/f3rC8HNcb+CdwDD5qjj+hjj4mGgf9j5LpCmA8yJgTHMkgAeZU2dd/wDj6/8ALPRJJa2Q0XJJsBySPxVXDcOGgtkjtQdfv6LZj8KxzHsc6C7Ut2Pd3LxPF6Pw2spteXmHXcSdO4yQPFXnNa2z685cGdpTjuFmNQkQb+VukBMD9D4FbWOaWF1GJeeNU+qVu4bgHB8vbZt+4k6Qd+fgn/Lk9o3eXrp4SlkY1u416m5TQ5E4ICsHNb29U4IQic9CZKAouQPejLUOVMiCluT3hLKCrO9Kc1aXNQtCfSKaxC5q0gKnMR0MmVRaPhqJ9DuBWGoy1QNUmW4K2NRlqNoQchLmq2NTg1QNS6fEaE5gQAJzEqayEDk6EDwkCCqKMqiE+hQCLRCupw7glWt2gMrN3us0dP1Hp6Ikt+A7gDoFU9zB6u/ZaqlcDM7drZHXZbHUKTKJZTveXOPzPIESeQk2G3UlcA1AczTqR9UanLI7/Bnmfbm4jFYp2ZzWsyk9kEmY6aLzePxtUu7bIeJGg030tuvZ1GPc3LE7T9V5TitGoHGTPlMX5LTOp+xpqevrzxqCbyPBOnly9tED2AIC9a325PjRTZne1vMgeG69UQvPcDZmq5tmgnxNh6E+S9Isd33xlu9pcJbmrQ5LKlnwoNVwja1W5qAU0KyFYCohAJeEosWgtQ5UyZyxAwXWlzUki6EoQgKaAo5shAZs6iHIVFQelKgVAK3KFhcralhyLMgzgoQlZlRegHtTWrKxyZJSDRmEIDdKutuB4c95+Uho1JEcrCYk6aImbbyBlyrtcN/DNerBLcjP1OsT0bqfQd6dV46/DiGMp5RYEMLXWvmgzmHJxMk7K6P4zD4DnQTpGh8tI7yt54ee77E93nx2qHBcNhxLh8V/N2k/+unnK5nGeNl1ptsBp5LDj+J8nLhOeXOkrLevyend4vBme/rtYatOUbOkek+65fExlv8AmHr3SuvhGCAe8Ln8eZY+KzrefXOZx0FsTlO4tK4+NxuaTIvvrC5eOdDpWXEvaQC2x3ha5yx15OdgKxEys5co9LcuiOXVdv8AD+MY0ljoBcbOOlhYHl1716PPFl8/ld7hnF4AY+XAaRq3pzHcs9477iOdegL0p9RBqMzTmbzHsRsUp7SseJvYeKwRfGCxOagT4TcaoVfFCxlDKOBuzhA6sFjJQuKOFTn10DLlICfSfCfEngKig+Kra+UgS54URmion2B34UcUIKolQ0LcFGqiJRBMovKjZSJIDQSSQAAJJJsABuVAV7HgnDPgAPeJqkSAb5AbAR+ojU7ac1WM3V4L6JwH4SDQHV6mTQlrYJA/2cbDyK9NT4fhKDQTTaDAPaGd3W8+i4+Ox7aIkEOqGe0bwLmxXi+JcRL3OLjPOTuQco9PRdMxnP4XevoWI/EdFgJbF9LZfUAleP8AxTxtzm0yx7xLtnxmaGnPmFtDl13O2/ksXxWIgSPyzMHabLnNxMuzvMkxeeX0HJUHbqtcCC5wLnAbHbaSB6SNLpeQOJ0BPdBN7yOQk6+i57K2pJdfkLTtO5uU5lQkiJkaaCDrPKT2fAd4QZ1PEPZqZb3yWgdNW67LdR4g11ndg7Tof+S5j2OZcnILjQXiTYAja58Fi/yDNm2mYNgd5N7G2yjWM6+tMeXWflfRcA0tbciNZBBHgQVy+KYoukRC8k/ibqbQ6nmbJgghxZMDS/L6JD+PvOob6ifVYa8N/HVn/Iz9o+I4Rxk7ei4ZsYK6tTjri0tLG+Z/Zceo/MZWmM6k5WPl1m3samU5ErI/Va8Nj2tEFp6yFb2Zzma0xvpI8JTkvfhW5ufVZMqIAhdOgGMHbY6O8EesJo/x3ECSzckmwA1gauPIDVV7/pPJ/ZfBX1X1AykC57rRNo/32y9V6TjGMw3xWUMPL3gZX1GlxpvqAXyNcSQJHO82tBPmMTi3ZSym006R+bd1TkXHcmPlFh0ul4doYLS13PcC/TXn/aLiX6zuuu8SluKzUcWMsuDnRYlpbIAgXBgHUX57LpUsGKgzUntf/qYY/wAiY/7LG41CZFEVWi9hyvaWnkQR49O9LcoCiUMqOcqVJom3WmlTsgwzJWpghK0FZI2UhPcVle+TZIGqJWdRBOwCodFYCjgk0LARQqVygO1+HsGC41XfKwiB+p/5R4WPWOa9C/FZGFzjLz4+AGy5lOv8BjWTYCXDNHaI7U793l3Lk8U4jnu6W62vAGp9l2ePP8cs9UGPxRcTe5I9SV5PH4jW9jHiYEDr/K047GZtLCDMbAyDM8guS98kE+HcFdEVPOZ5/RVmPeB9PdLed/6VPfaylTV8SbNH1HP7+5NuLLJDRLjrJ0nnzN/dY2E/lM6A+J38ZRGhFt/a2uvTzQDXYo/mJM2vFgOUDvVvxJ0uRvbWDy8lmyOOnecvKOfn6LVwxrc4mSxgL3m0AMEmOYJt4oNfGHw9lLQU25nRb/yVAHO13AyjwWF9QQImR/XLqhY8vc97pl7i4+JmB5ow+5NiBsZuAM0jusbqacYpvYwL6oX780dZlyRMW8uaguBqSOe42+vNHT4QWXRspgmPuUOc3A3F+i0YakSQIJkxt5dUW8KTvxsw+GDmOiqGERbO4AyDJknLsErI9t3POWC6+V0juzTc9FryMDGiLmcwmIc2IkiOZtf9slfDOeCWwBbNJPnmjTeAJRnXfdGpz1AZ3OhzyZ02AA6D1P7Is8jQDxEyd/T1PNJpve3RrT0Lv/rryTMRXhwBaGOFiA6Q3rbWdpVpG2tGsSNNPMToeidh+IuZppyEWP7eSwveD9x3aJJekHqqXFczQKhzNNwLy2Rq0THLdLe8TYgjYjQjZeXD43PRbcBi8pg/Kde4/qH17lGsd9h2JVZlZCUsCrfg09wWTAFa3Kb9EKe46KgwJhgaqGCgByq0aiXT46jUL0wBLeUKAE/AxnaTo3tH/jf3geKRlUe/Ix7tNGydBN/PsqszupADE4sklxJk++v7ALnYrFBzbkDQa+vuB3HxSMTijGUNN9zYdx5karIRoTc7cvALt6jgKj8xj8vv/CWSNd/vTmo+fvp9+Syvf9/f31UmKo8pZege5Aw3QbdRZtJvBtJnTYamy1PpwA63UwYA3AGpKyYepe5jUSJm/RbKjiSDYNA/Lo7vF+n0TIgsJdpAjUxpGh++WqupiQKbmMbJeGh75uADJAGtyB4CIuhe3MQZtsPb36WS37gW6b/skGYVNOzp9/RU+oXGdIF45RB++9G4xyn7+/opVMMceeVv1sPD2S4fSBJixmw6/wAongNNpg+N4uPVLzEd/uPuyj3Gx++vVTZ1UvDqTATeDER36C67rMEW0XVNxoZNyCD2eZm37yvNMcZkEz9wvV4qs9lFgDcoLHAudmkguG0kjWJIgyBpdYeX+UuZP1t47m9t/HI/xahAlpaT+qxE/wCs9mSD72QVXZQGGYG/IzvN9/U2WRjydPmJ130MjvmfRLqnL9P36LeZv6yup+NNXFZAMsZzpH5RzP8At7T5YWff8oB36ohZaMzc1oPmkvKMnRLegJKjHJYKtIO/w+vmZG7fbZPc5cfhdSHxzBH1+i6zysNzmk1uwJstDnLFgdFscLLO/TgHlE1IgpxNkqcMzhRKhWp4p23FCSielByCGBy9NVvx+AYymGPbmf8AOYJGVxEBoJEGPG88pTuCYYFxqOjKzSdC/YeGvkudxHFEvmbdTzv8vhK6PDn/AGorz+Jo9ogNIE859d1jqtg+Hl1/ZdrENsTeB5+mn2bLl1Ga5Xa3i0C37yuhLnVnrG8rfXaZIFwec6/YXPqtUmW9yqk5A4qmG6DbWG3l+9lobVOgJtGsTrJjuWEOTm1tLDw+qCaGPkmeuvqQN7hIqfNIP9W/tAKmp32SXO6/eyYMqHnbxmUzFfJTbzDnnfU5W+jfVZmguIA1JA80eLrAvcWiGjstHJrbBAASkuKMvF+aW50pGtjiL9V6HFcce7DtoizdJNy4WNpHZ0iREjUbnzuay0Nfm0EaAAmwHcfD3UazNWdnxWdWSnMaA1zjYDfmbw0HnbwErA5xJk/0m4irmIaD2WzHfzdHegVoCVJUlCXJkJCSqLkMoCpRSglXKSmjBu7bOoXfleewfzt6ru5ll5Pqa6WAZZPes2DqANWoEOFlhfpz4jKdkLqTk1z4EK31yBop6fGeDyVoHYo8lSfs3cc5LJVZlTbkDmYQTu1K+TDsY27iJjvdck9AQPuVwXtcHSYJ12zE3iAbTyOnctmLxJc50ajsjWwbAiRzJKwPqH8zTykHQRrfzXZJycJWJq9nlt1jp5Ll9lzuR5iNeYO/qtGLeJIknc35rC1zWz7fwqJK7xBuIkxHdMrkYp11pxNQCwFgLfz4/d1zqjkjKKFpuoXKgUGfKIPSgiyEoC86FzleU8lfwzyQAteWkEGCNxslElG9sIcqAElHUZBjeLqU6RLmt5uaPMgfVOxLP/K8cnEXtpt6IJmhFSeRYHW1tb7DlKNwGu0evgfuENMAuJiwvbTWDfZBr+Ht9+arFQ05WmY1M77wgfU5f0EkIIUqShUKDEShcqlQlBIrCoK0Bs4Y2X9AT9PquuuPw50P6gj78l2CVjv6mm5+yulgPlXGLl2MD8iy18Vn6fUesvxS4rQ66zvsFEUS56iiioO24oqUZmk6SCegUUTz9hFl7mtbYaZte/osmJryDlkEzvuIFvMKKLsS5biZjvI8dSfVJ+LqToBAHvPjHkoog2Su6b6d330WCoVaiVBBRNUUQbRTT6Q3UUTJrqQGgxf6wuc55KiiCigP2RlkXPRRRIzsEyajbwA4XiYymTbcfykVO057jYlzj6klRRMkNI5SbieyBY8iOn8LOSALTyPImfbRRRTlVIKgCiiokcEKiiAoqBRRIlgKKKJmZTJBBGs2XcDmuALTNhNoh0dpo5xpO8KKLPfwr8WAuvg/lUUXPr4MilLqFUopVWN1UqKKLRHX/9k=">
					    </div>
					    <div class="carousel-item">
					      <img src="data:image/jpeg;base64,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" class="d-block w-100 mh-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXRET1Bw3h3QLrMX_qJv00P_91eNp0lq-X1A&usqp=CAU" class="d-block w-100 mh-100" alt="...">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
				</div>
                   <br/>
              
              </div>
           </div>
           
      </div>
      
      </div>
      
	</div>
	
	
	<jsp:include page="../include/user_bottom.jsp"/>
</body>
</html>