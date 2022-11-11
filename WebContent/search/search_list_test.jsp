<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 플랫폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<style>
	#wrapper {
		margin: auto;
		width: 85%;
		background-color: #fff;
	}

	.searched {
		background-color: rgb(248, 248, 248);
		height: 40px;
		font-weight: bold;
		padding-top: 7px;
		color: rgba(100, 100, 100, 1);
		width: 85%;
		margin: auto;
	}
	
	
	.result_area {
		background-color: rgb(248, 248, 248);
		height: 40px;
	}
	
	
	.bg1, .bg2, .bg3 {
		background-color: #fff;
		display: none;
		padding: 20px 0 0;
		border-top: 1px solid #ddd;
		
	}
	
	input[type="radio"] {
		display: none;
	}
	
	.tab_label {
		display: inline-block;
		text-align: center;
		border: transparent;
		font-weight: 300;
		padding: 15px 25px;
	}
	
	.tab_label:hover {
		cursor: pointer;
	}
	
	
	
	input[type="radio"]:checked + .tab_label  {
		
		font-weight: bold;
		border-bottom: 2px solid rgb(41, 42, 50);
	}
	
	#tab1:checked ~ #content1,
	#tab2:checked ~ #content2,
	#tab3:checked ~ #content3 {
		display: block;
	}
	
	.tab1_cont {
		list-style: none;
		text-decoration: none;
		display: inline-block;
		margin: 20px;
	}
	
	.bref, .star {
		margin-left: 15px;
	}
	
	.tab2_conts, .tab3_conts {
		list-style: none;
		padding: 0px;
		display: flex;
		flex-flow: row wrap;
		align-items: flex-start;
	}
	
	.tab2_conts_* > a {
		text-decoration: none;
	}
	
	.tab2_cont, .tab3_cont {
		box-sizing: border-box;
	    width: 100%;
	    margin: 20px;
	}
	
	.more {
		border: none;
		border-radius: 30px;
		background-color: rgb(253, 217, 230);
		color: rgb(255, 53, 94);
		padding: 5px;
	}
	
	.row {
		padding: 0;
	}
	
	li a {
		text-decoration: none;
		color: #000;
	}
	
	.ex_box_1 {
		font-size: 16px;
		font-weight: 500;
		margin-top: 5px;
	}
	
	.ex_box_2 {
		font-size: 13px;
		font-weight: 300;
	}
	
	.column {
		list-style-type: none;
		-webkit-columns: 2;
    	-moz-columns: 2;
		columns: 2;
		list-style-position: inside;
	}
	
	.cols {
		width: 80%;
		margin: auto;
		padding-left: 10%;
	}
	
	.poster {
		border-radius: 5px;
		width: 70px;
		height: 100px;
	}
	
	.director {
		width: 100%;
		height: 100px;
		border-radius: 5px;
	}
	
	.user {
		width: 100%;
		height: 100%;
		border-radius: 70%;
	}
	
	.col-2 {
		padding: 0;
	}
	
	.res {
		display: inline;
		margin-bottom: 1%;
	}
	
	.row.row-cols-2 {
		list-style-type: none;
		padding: 1%;
		margin-left: 0.1%;
		width: 85%;
		margin: auto;
	}
	
	.row.row-cols-3 {
		list-style-type: none;
		margin: auto;
		width: 75%;
		padding-bottom: 3%;
	}
	
	.col {
		
		width: 95%;
	}
	
	.more {
		border: none;
		border-radius: 30px;
		background-color: rgb(253, 217, 230);
		color: rgb(255, 53, 94);
		padding: 8px;
		width: 70px;
		font-size: 14px;
		margin-left: 20%;
	}
	
	.nothing {
		width: 100%;
		height: 70vh;
		text-align: center;
		vertical-align: middle;
		background-color: #fff;
	}
	
	.non {
		width: 80px;
		height: 100px;
		border: none;
		margin-bottom: 5%;
	}
	.col-3 {
		width: 25%;
		margin: auto;
	}
	
	.col-9 {
		border-bottom: 1px solid rgb(240,240,240);
	}
	.s1_d {
		font-size: 13px;
		border-radius: 5px;
		background-color: rgb(240,240,240);
		display: inline-block;
		padding: 1%;
		margin-top: 2%;
	}
	
</style>
<script>
	$(function() {
		
		let allResults = 0;
		
		let startIndex = 1;	// 인덱스 초기값
		let searchStep = 0;	// 9개씩 로딩
		
		// 페이지 로딩 시 첫 실행
		searchResult(startIndex);
		
		// 더보기 클릭 시
		$("#result_more").click(function() {
			startIndex += searchStep;
			searchResult(startIndex);
		});
		
		// 더보기 실행 함수
		function searchResult(index) {
		
			let endIndex = index + searchStep - 1;	// endIndex 설정
			
			$.ajax({
				
				type: "post",
				url: /check/searchResult.jsp,
				dataType: "jsp",
				data: {
					startIndex: index,
					endIndex: endIndex
				},
				success: function(data, textStatus) {
					
				}
				
			});
			
		}
		
		
		
	});
	
</script>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	

	<div class="result_area">
		<div class="searched">
			<label>"${keyword }"의 검색결과</label>
		</div>		
	</div>

	<div id="wrapper">
	
		<div class="tab">
					
			<input type="radio" id="tab1" name="tabs" checked />
			<label class="tab_label" for="tab1">콘텐츠</label>
			
			<input type="radio" id="tab2" name="tabs" />
			<label class="tab_label" for="tab2">인물</label>
			
			<input type="radio" id="tab3" name="tabs" />
			<label class="tab_label" for="tab3">유저</label>
			
			<%-- 콘텐츠 탭 : 영화 포스터, 영화 제목, 나라 --%>
			<section id="content1" class="bg1">
				
				<c:if test="${!empty mlist }">
				
					<ul class="row row-cols-2">
					
						<c:forEach items="${ilist }" var="list" varStatus="status">
						
							<li class="res">
								<a class="link" href="more_info.do?num=${mlist[status.index].movie_num}">
									<div class="col">	
										
										<ul class="row row-cols-2">
											<li class="col-3">
												<img class="poster" src="${list.image_loc} " alt="영화 포스터" />
											</li>										
											<li class="col-9">
												<div class="ex_whole">
													<div class="ex_box_1">
												    	${mlist[status.index].movie_title}
												    </div>
												    <div class="ex_box_2"> 
												    	${mlist[status.index].movie_date }ㆍ${mlist[status.index].movie_country}
												    </div>
												    <div class="s1_d">
												    	${mlist[status.index].movie_director }
												    </div>
											    </div>
											</li>
										</ul>
										
								    </div>
							    </a>
							</li>		
								
						</c:forEach>
						
					</ul>
					
				</c:if>		
				
				<c:if test="${empty mlist }">
					
					<div class="nothing">
						<br />
						<img class="non" src="./image/null.png" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
					
				</c:if>
				
			</section>
			
			<%-- 인물 탭 : 감독 이름, 감독 사진 --%>
			<section id="content2" class="bg2">
			
			
				<c:if test="${!empty dlist }">
				
					<ul class="row row-cols-2">
					
						<c:forEach items="${dlist }" var="list" varStatus="status">
						
							<li class="res">
								<a class="link" href="wacha_director_list.do?director=${list.movie_director}">
									<div class="col">	
										
										<ul class="row row-cols-2">
											<li class="col-3">
												<img class="director" src="${ilist[status.index].director_image}" alt="감독 이미지" />
											</li>										
											<li class="col-9">
												<div class="ex_whole">
													<div class="ex_box_1">
												    	${list.movie_director}
												    </div>
												    <div class="ex_box_2"> 
												    	영화 감독
												    </div>
												    <div class="s1_d">
												    	${list.movie_title }
												    </div>
											    </div>
											</li>
										</ul>
										
								    </div>
							    </a>
							</li>
												
						</c:forEach>
						
					</ul>
				
				</c:if>	
				
				<c:if test="${empty dlist }">

					<div class="nothing">
						<br />
						<img class="non" src="./image/null.png" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
				</c:if>
			
			</section>
			
			<%-- 유저 탭 : 유저 이미지, 유저 이름 --%>
			<section id="content3" class="bg3">
			
				<c:if test="${!empty ulist }">
					
						<ul class="row row-cols-2">
						
							<c:forEach items="${ulist }" var="list" >
								<li class="res">
									<div class="col">
										
										<ul class="row row-cols-3">
											<li class="col-2">
												<img class="user" src="./image/profileupload/${list.member_image} " alt="이미지" />
											</li>										
											<li class="col-7">
												<div class="ex_whole">
													<div class="ex_box_1">
												    	${list.member_name}
												    </div>
												    <div class="ex_box_2"> 
												    	${list.member_profile.substring(0,10) }...
												    </div>
											    </div>
											</li>
											<li class="col-3">
												<input class="more" type="button" value="더보기" onclick="location.href='otherprofile.do?member_id=${list.member_id}'" />
											</li>
										</ul>
										
									</div>
								</li>					
							</c:forEach>
							
						</ul>
					
				</c:if>	
				
				<c:if test="${empty ulist }">
					<div class="nothing">
						<br />
						<img class="non" src="./image/null.png" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
				</c:if>
			
			</section>
		
		</div>
		
		
		
	</div>
	
	<jsp:include page="../include/user_bottom.jsp" />
<%-- 	<jsp:include page="${pageContext.request.contextPath }/include/user_bottom.jsp" /> --%>
<%-- 	<jsp:include page="<%=request.getContextPath() %>/include/user_bottom.jsp" /> --%>
	
</body>
</html>