<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 리뷰 플랫폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<style>
	#wrapper {
		margin: auto;
		width: 85%;
	}
	
	#searched {
		background-color: rgb(248, 248, 248);
		height: 35px;
		font-weight: bold;
		padding-left: 30px;
		color: rgba(100, 100, 100, 1);
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
	
	section {
		display: none;
		padding: 20px 0 0;
		border-top: 1px solid #ddd;
	}
	
	input[type="radio"]:checked + .tab_label  {
		color: #000;
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
	
	li a {
		text-decoration: none;
		color: black;
	}
	
	.ex_box_1 {
		font-size: 15px;
		font-weight: 500;
		margin-left: 15px;
	}
	
	.ex_box_2 {
		font-size: 13px;
		font-weight: 300;
		margin-left: 15px;
	}
	
	.column {
		list-style-type: none;
		-webkit-columns: 2;
    	-moz-columns: 2;
		columns: 2;
		list-style-position: inside;
	}
	
	.poster {
		border-radius: 5px;
		width: 210px;
		height: 300px;
	}
	
	.director {
		width: 70px;
		height: 70px;
		border-radius: 5px;
	}
	
	.user {
		width: 70px;
		height: 70px;
		border-radius: 70%;
	}
	
	.res {
		display: inline;
		
	}
	
	.row.row-cols-2 {
		list-style-type: none;
		margin: 5px 0;
		margin-left: -30px;
	}
	
	.row.row-cols-3 {
		list-style-type: none;
		margin: 5px 0;
	}
	
	.col {
		border-bottom: 1px solid rgb(240, 240, 240);
		width: 90%;
	}
	
	.more {
		border: none;
		border-radius: 30px;
		background-color: rgb(253, 217, 230);
		color: rgb(255, 53, 94);
		padding: 8px;
		width: 70px;
		font-size: 14px;
		margin-left: 70px;
	}
	
	.nothing {
		width: 100%;
		height: 70vh;
		text-align: center;
		vertical-align: middle;
	}
	
	.nothing img {
		width: 80px;
		height: 100px;
		border: none;
	}
</style>
<script>
	$("#k_search").keypress(function (e) {
		if(e.which == 13) {
			if($("#k_search").val()=='') {
				return false;
			}else {
				search.submit();
			}
		}
	});
</script>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	
	<c:set var="ilist" value="${iList}" />
	<c:set var="mlist" value="${mList}" />
	<c:set var="ulist" value="${uList}" />
	
	<div id="searched">
		<label>"${keyword }"의 검색결과</label>
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
			<section id="content1">
				
				<c:if test="${!empty mlist }">
				
					<ul class="row row-cols-4">
					
						<c:forEach items="${ilist }" var="list" varStatus="status">
							<li class="res">
								<a class="link" href="<%=request.getContextPath()%>/more_info.do?num=${mlist[status.index].movie_num}">
									<div>	
										<div>
									    	<img class="poster" src="${list.image_loc }" alt="영화 포스터 이미지" />
									    </div>
									    <div class="ex_box_1">
									    	${mlist[status.index].movie_title}
									    </div>
									    <div class="ex_box_2"> 
									    	${mlist[status.index ].movie_country}
									    </div>
								    </div>
							    </a>
							</li>					
						</c:forEach>
						
					</ul>
					
				</c:if>		
				
				<c:if test="${empty mlist }">
					
					<div class="nothing">
						<br />
						<img src="https://icon-library.com/images/null-icon/null-icon-3.jpg" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
					
				</c:if>
				
			</section>
			
			<%-- 인물 탭 : 감독 이름, 감독 사진 --%>
			<section id="content2">
			
				<c:if test="${!empty mlist }">
				
					<ul class="row row-cols-2">
					
						<c:forEach items="${ilist }" var="list" varStatus="status">
							<li class="res">
								<a class="link" href="#">
									<div class="col">	
										
										<ul class="row row-cols-2">
											<li class="col-2">
												<img class="director" src="${list.director_image} " alt="감독 이미지" />
											</li>										
											<li class="col-5">
												<div class="ex_whole">
													<div class="ex_box_1">
												    	${mlist[status.index].movie_director}
												    </div>
												    <div class="ex_box_2"> 
												    	영화 감독
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
						<img src="https://icon-library.com/images/null-icon/null-icon-3.jpg" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
				</c:if>
			
			</section>
			
			<%-- 유저 탭 : 유저 이미지, 유저 이름 --%>
			<section id="content3">
			
				<c:if test="${!empty ulist }">
					
						<ul class="row row-cols-2">
						
							<c:forEach items="${ulist }" var="list" >
								<li class="res">
									<div class="col">
										
										<ul class="row row-cols-3">
											<li class="col-2">
												<img class="user" src="${list.member_image} " alt="유저 이미지" />
											</li>										
											<li class="col-5">
												<div class="ex_whole">
													<div class="ex_box_1">
												    	${list.member_name}
												    </div>
												    <div class="ex_box_2"> 
												    	${list.member_profile }...
												    </div>
											    </div>
											</li>
											<li>
												<input class="more" type="button" value="더보기" onclick="location.href='member_page.do?member_id=${list.member_id}'" />
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
						<img src="https://icon-library.com/images/null-icon/null-icon-3.jpg" alt="null" />
						<br />
						<p>해당하는 검색 결과가 없습니다. 다른 검색어를 입력해보세요.</p>
					</div>
				</c:if>
			
			</section>
		
		</div>
		
	</div>
	
	
	<jsp:include page="../include/user_bottom.jsp" />

</body>
</html>