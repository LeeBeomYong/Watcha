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
	            	
					$("#avgs").html("평균 ★"+data+"점 (<fmt:formatNumber value="${count}"/>명)");
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
				if(star_chk==0){
					star(this);
					star_chk=1;
					curent_star=this;	
				}else if(star_chk != 0 && curent_star == this){
					star_chk=0;
					$("label").css("text-shadow", "0 0 0 #f0f0f0");
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
						<span id="avgs">평균 ★${avgStar}점 (<fmt:formatNumber value="${count}"/>명)</span>
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
							<a href="<%=request.getContextPath()%>/wacha_director_list.do?director=${mDto.getMovie_director()}&movie_num=${mDto.getMovie_num()}" ><img alt="없" width="30px" height="30px" id="direcImg" src="${pageContext.request.contextPath }/image/contImg/black_adam_director.jpg"></a>
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
				<ul>
					
					<li class="same_movie_list">
						<a title="" href="#">
							<div><img alt="없" src=""></div>
							<div>
								<div>아쿠아맨</div>
								<div>평균 ★ 3.2</div>
								<div>영화</div>
							</div>
						</a>
					</li>
				<c:forEach items="${same}" var="same" varStatus="status">
					
					<%--max 4개 li 영역 분리 --%>
					<c:if test="${status.index %4==0}">3
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
					      <img class="d-block w-100 mh-100" alt="..." src="data:image/jpeg;base64,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">
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