<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 임시 세션 로그인 -->

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
	if('<%=session.getAttribute("session_id")%>' != "null" ){
		count=<%=request.getAttribute("heart")%>;
		look = <%=request.getAttribute("watch")%>;
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
					session_id : '<%=session.getAttribute("session_id")%>'
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
			if('<%=session.getAttribute("session_id")%>' !="null"){
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
			if('<%=session.getAttribute("session_id")%>' !="null" ){
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
							memberId : '<%=session.getAttribute("session_id")%>',
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
			if('<%=session.getAttribute("session_id")%>' != "null" ){
			if(look==0){	
				look=1;
				$("#img3").attr("src","${pageContext.request.contextPath}/image/contImg/eye.png");	
				$.ajax({
					type : "post",
					url : "/WatchaProject/content/Looking.jsp",
					data : {
							movieNum : ${mDto.getMovie_num()},
							memberId : '<%=session.getAttribute("session_id")%>',
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
							memberId : '<%=session.getAttribute("session_id")%>',
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
		$(".btn-open-popup2").on("click",function(){  
			if('<%=session.getAttribute("session_id")%>' != "null"){
				$(".modal_body2").css("display","block");
		    	$(".modal2").css("display","block");
			}else{
				alert("로그인 부터 ㅠㅠ");
			}
	    	
	    });
		
		$(".btn-close").on("click",function(){
	    	$(".modal_body2").css("display","none");
	    	$(".modal2").css("display","none");
	    });

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
		    const url = "${pageContext.request.contextPath}/content/MyOpinion.jsp?movie_num=${mDto.getMovie_num()}&session_id=${sessionScope.session_id}";
		       
		    //등록된 url 및 window 속성 기준으로 팝업창을 연다.
		    window.open(url, "hello popup", windowStatus);
		}else{
			alert("로그인 부터 ㅠㅠ");
		}
	}
	
    $(document).mouseup(function (e){
		if($(".modal2").has(e.target).length === 0) {
			$(".modal_body2").css("display","none");
	    	$(".modal2").css("display","none");
		}
    });
    


</script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/contjs/contJs.js" defer="defer"></script>

</head>

<body>
	<jsp:include page="../include/user_top.jsp"/>
	
	
	
	<!-- 임시 로그인 세션 값  -->
	<input type="hidden" value="${mDto.getMovie_num() }" id="croll">
	<div id="topImg">
			<div id="imgT">
			<%-- 상단 예매 순위 / 개봉 날짜 / 평균 별점 --%>
			<img id="imgT_img" alt="${images[0]}" src="">
			<div id="topShow">
				<div id="topDiv_img">
					<img alt="이미지 없음" src="${pageContext.request.contextPath }/image/contImg/black_adam_content_sub.jpg" width="150px">
				</div>
			<div id="topDiv_cont">
				<ul>
					<li>순위 ${rank} 위 /</li>
					<li>개봉일 ${mDto.getMovie_date()} 일 /</li>
					<li>왓챠 평점 ${avgStar}점</li>
				</ul>
			</div>
				
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
								<div class="cont3_btn btn-open-popup2">
									<img alt="없음" src="${pageContext.request.contextPath }/image/contImg/pen.png" width="20px" height="20px" >
									<span class="cont2_btn_span">코멘트</span>
									
								</div>

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
						<button id="topDiv_cont2_btn4" data-bs-toggle="dropdown" aria-expanded="false">
							<div class="cont3_btn">
					   			<img alt="" src="${pageContext.request.contextPath}/image/contImg/more.png" width="20px" height="20px" class=" btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
							  	<span>더보기</span>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								  	<li><a class="dropdown-item" href="#">관심없어요</a></li>
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
		<div>
			<c:if test="${!empty coment_dto}">
				<div id="cd_hiden">
					<div>
						 <img alt="" width="50px" height="50px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
						 <span>${coment_dto.getMovie_coment()}</span>
					</div>
					<div>
					 	<button  class="btn btn-danger" onclick="javascript:showPopUp()">수정</button>&nbsp;&nbsp;|&nbsp;&nbsp;
					 	<button  class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>/wacha_coment_delete.do?movie_num=${coment_dto.getMovie_num()}&coment_num=${coment_dto.getComent_num() }'">삭제</button>
					</div> 
				</div>	
			</c:if>
		<div id="cd_data">
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
					<a href="<%=request.getContextPath()%>/wacha_director_list.do?director=${mDto.getMovie_director()}" >
						<li class="director_actor">
							<img alt="없" width="40px" height="40px" id="direcImg" src="${pageContext.request.contextPath }/image/contImg/black_adam_director.jpg">
							<div>
								<span>${mDto.getMovie_director()}<br>감독</span>
								
							</div>
						</li>
					</a>
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
            <div>     
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
                  <div id="carouselExampleControlsNoTouching2" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
					  <div class="carousel-inner2">
					    <div class="coment_div carousel-item active">
							<ul>
								<li class="flex_li">
										<c:forEach items="${clist}" var="coment" begin="0" end="2">
		                     				 <div id="coment_on">
		                     				 <div class="coment_top">
		                                          <div>
		                                             <img alt="" width="40px" height="40px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
		                                             <span>${coment.getMember_id() }</span>
		                                          </div>
		                                          <div>
		                                            	<span>★ ${coment.getMember_star() }</span>
		                                          </div>
		                                       </div>
		                                       <hr>
		                                       <%--게시글 중단 --%>
		                                       <a href="<%=request.getContextPath()%>/wacha_coment.do?coment_num=${coment.getComent_num() }&movie_num=${coment.getMovie_num()}&session_id=${coment.getMember_id()}">
			                                       <div class="coment_midle">
			                                          <span>
			                                             ${coment.getMovie_coment() }
			                                          </span>
			                                       </div>
		                                       </a>
		                                       <hr>
		                                       <%--게시글 하단 --%>
		                                       <div class="coment_bottom">
		                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/likeIt.png" width="15px" height="15px">&nbsp; <span>${coment.getComent_hit()}</span>
		                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/talk.png" width="15px" height="15px">&nbsp; <span>${coment.getCocoment_count()}</span>
		                                       </div>
		                     				</div>
		                     			</c:forEach>
								</li>
							</ul>
					    </div>
					    <c:forEach begin="1" end="${fn:length(clist)/3 }"  varStatus="i">
						    <div class="carousel-item">
						      	<ul>
									<li class="flex_li">
										<c:if test="${(((i.count-1)/3)+3)*3 < fn:length(clist)/3}">
											<c:set var="end" value="${fn:length(clist)/3 }"/>
										</c:if>
										<c:if test="${(((i.count-1)/3)+3)*3 > fn:length(clist)/3}">
											<c:set var="end" value="${(((i.count-1)/3)+3)*3}"/>
										</c:if>
											<c:forEach items="${clist}" var="coment" begin="${(((i.count-1)/3)+1)*3}" end="${end}" varStatus="k">
			                     				 <div id="coment_on">
			                     				 <div class="coment_top">
			                                          <div>
			                                             <img alt="" width="40px" height="40px" id="idImg" src="${pageContext.request.contextPath }/image/contImg/defualtImg.png">
			                                             <span>${coment.getMember_id() }</span>
			                                          </div>
			                                          <div>
			                                            	<span>★ ${coment.getMember_star() }</span>
			                                          </div>
			                                       </div>
			                                       <hr>
			                                       <%--게시글 중단 --%>
			                                       <a href="<%=request.getContextPath()%>/wacha_coment.do?coment_num=${coment.getComent_num() }&movie_num=${coment.getMovie_num()}&session_id=${coment.getMember_id()}">
				                                       <div class="coment_midle">
				                                          <span>
				                                             ${coment.getMovie_coment() }
				                                          </span>
				                                       </div>
			                                       </a>
			                                       <hr>
			                                       <%--게시글 하단 --%>
			                                       <div class="coment_bottom">
			                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/likeIt.png" width="15px" height="15px">&nbsp; <span>${coment.getComent_hit()}</span>
			                                          <img alt="" src="${pageContext.request.contextPath }/image/contImg/talk.png" width="15px" height="15px">&nbsp; <span>${coment.getCocoment_count()}</span>
			                                       </div>
			                     				</div>
			                     				<c:if test="${k.index % 3 == 0  }">
			                     				</li>
			                     				<li class="flex_li">
			                     				</c:if>
			                     			</c:forEach>
			                     		</li>
								</ul>
						    </div>
					    </c:forEach>
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
               </div>  
					<hr>
			
				<div id="same_movie">
					<h4>비슷한 작품</h4>
				</div>
				<div id="rediv">
					<ul id="sm_ul">
						<%--max 4개 li 영역 분리 --%>
						<c:if test="${status.index %4==0}">
							<br>
						</c:if>
					<c:forEach items="${same}" var="same" varStatus="status">
						<li class="same_movie_list">
							<a title="" href="<%=request.getContextPath()%>/wacha_content.do?movie_num=${same.getMovie_num() }">
								<div><img alt="없음" src="${same.getMovie_imgloc()}" width="130px" height="100px"></div>
								<div>
									<div>${same.getMovie_title()}</div>
									<div>평균 ★ ${same.getMovie_avgstar() }</div>
									<div>${same.getMovie_genre() }</div>
								</div>
							</a>
						</li>
						
						
					</c:forEach>
					</ul>
				</div>
		
			
	
		</div>	
		
	</div><%-- 상세 페이지 끝 영역 --%>
	</div>
	

	
	<!-- 미리보기 영상/갤러리 Div -->
	      <div id="cd_youtube">
         
         <%-- 동영상 재생 부분 --%>
      <div id="cd_youFirst">
          <iframe id="player" type="text/html" width="300" height="300" src="https://www.youtube.com/embed/9qQuoqpw7KA?autoplay=1&mute=1" frameborder="0"></iframe>
           
              <%-- 동영상 하단 div --%>
           <div id="cd_youCont">
              <div class="cd_youCont_div">
                 <h5>80일간의 세계 일주</h5>
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
					      <img class="d-block w-100 mh-100" alt="${images[1]}" src="">
					    </div>
					    <div class="carousel-item">
					      <img alt="${images[2]}" src="">
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
					<!-- 코멘트 말록 영역 -->
		<div class="modal2">
		      <div class="modal_body2">
		      	<form action="<%=request.getContextPath()%>/wacha_coment_Ok.do">
		      		<input type="hidden" value="${sessionScope.session_id}" name="session_id">
		        	<input type="hidden" value="${mDto.getMovie_num()}" name="movie_num">
		        	<input type="hidden" value="${chk}" name="chk">
		      		
		      		<div id="modal_be">
		      			<span>${mDto.getMovie_title()}</span>
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