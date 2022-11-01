<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	
	.tab2_conts_d  a {
		text-decoration: none;
		border-bottom: 1px solid #ddd;
	}
	
	.tab2_cont, .tab3_cont {
		box-sizing: border-box;
	    width: 100%;
	    margin: 20px;
	    padding-right: 15px;
    	padding-left: 15px;
	}
	
	.more {
		border: none;
		border-radius: 30px;
		background-color: rgb(253, 217, 230);
		color: rgb(255, 53, 94);
		padding: 8px;
		width: 70px;
	}
	
</style>
<script>
	
</script>
</head>
<body>

	<jsp:include page="./include/user_top.jsp" />
	
	<div id="searched">
		<label>""의 검색결과</label>
	</div>

	<div id="wrapper">
	
		<div class="tab">
					
			<input type="radio" id="tab1" name="tabs" checked />
			<label class="tab_label" for="tab1">콘텐츠</label>
			
			<input type="radio" id="tab2" name="tabs" />
			<label class="tab_label" for="tab2">인물</label>
			
			<input type="radio" id="tab3" name="tabs" />
			<label class="tab_label" for="tab3">유저</label>
			
			<section id="content1">
			
				<ul class="tab1_conts">
					<li class="tab1_cont">
						<a href="#">
							<div class="poster">
								<img src="https://www.adobe.com/express/create/media_104b5f1f25bd4d236d5cefc971e8192c7fe6f9318.jpeg?width=400&format=jpeg&optimize=medium" alt="포스터" width="200" height="300"/>
							</div>
							<div class="bref">
								제목 <%-- ${dto.getMovie_title() } --%>
							</div>
							<div class="star">
								평균 별점  <%-- ${dto.getMember_star() } --%>
							</div>
						</a>
					</li>			
					<li class="tab1_cont">
						<a href="#">
							<div class="poster">
								<img src="https://awsimages.detik.net.id/community/media/visual/2022/07/22/poster-hemat-energi-1.png?w=700&q=90" alt="포스터" width="200" height="300" />
							</div>
							<div class="bref">
								제목 <%-- ${dto.getMovie_title() } --%>
							</div>
							<div class="star">
								평균 별점  <%-- ${dto.getMember_star() } --%>
							</div>
						</a>
					</li>
					<li class="tab1_cont">
						<a href="#">
							<div class="poster">
								<img src="https://static-cse.canva.com/blob/567649/MusicFestStudentCouncilPoster.jpg" alt="포스터" width="200" height="300" />
							</div>
							<div class="bref">
								제목 <%-- ${dto.getMovie_title() } --%>
							</div>
							<div class="star">
								평균 별점  <%-- ${dto.getMember_star() } --%>
							</div>
						</a>
					</li>
					<li class="tab1_cont">
						<a href="#">
							<div class="poster">
								<img src="https://cdn-magazine.notefolio.net/files/18/17718-6044-43_cont" alt="포스터" width="200" height="300" />
							</div>
							<div class="bref">
								제목 <%-- ${dto.getMovie_title() } --%>
							</div>
							<div class="star">
								평균 별점  <%-- ${dto.getMember_star() } --%>
							</div>
						</a>
					</li>
					<li class="tab1_cont">
						<a href="#">
							<div class="poster">
								<img src="http://kiramonthly.com/wp-content/uploads/2020/02/3.jpg" alt="포스터" width="200" height="300" />
							</div>
							<div class="bref">
								제목 <%-- ${dto.getMovie_title() } --%>
							</div>
							<div class="star">
								평균 별점  <%-- ${dto.getMember_star() } --%>
							</div>
						</a>
					</li>
				</ul>
			
			</section>
			
			<section id="content2">
			
				<ul class="tab2_conts">
				
					<div class="tab2_conts_d">
						<a href="#">
							<li class="tab2_cont">
								<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
								<span>감독 이름</span>
							</li>
						</a>
					</div>
					
					<div class="tab2_conts_d">
						<a href="#">
							<li class="tab2_cont">
								<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
								<span>감독 이름</span>
							</li>
						</a>
					</div>
					
					<div class="tab2_conts_d">
						<a href="#">
							<li class="tab2_cont">
								<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
								<span>감독 이름</span>
							</li>
						</a>
					</div>
					
					<div class="tab2_conts_d">
						<a href="#">
							<li class="tab2_cont">
								<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
								<span>감독 이름</span>
							</li>
						</a>
					</div>
				
				</ul>
			
			</section>
			
			<section id="content3">
			
				<ul class="tab3_conts">
				
					<div class="tab3_conts_1">
						<li class="tab3_cont">
							<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
							<span>유저 이름</span>
							<input class="more" type="button" value="더보기" onclick="location.href=''" />
						</li>
					</div>
					
					<div class="tab3_conts_2">
						<li class="tab3_cont">
							<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
							<span>유저 이름</span>
							<input class="more" type="button" value="더보기" onclick="location.href=''" />
						</li>
					</div>
					
					<div class="tab3_conts_3">
						<li class="tab3_cont">
							<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
							<span>유저 이름</span>
							<input class="more" type="button" value="더보기" onclick="location.href=''" />
						</li>
					</div>
					
					<div class="tab2_conts_4">
						<li class="tab3_cont">
							<img src="https://image.cine21.com/resize/cine21/person/2019/0612/11_02_44__5d005d448734b[X252,310].jpg" alt="감독이미지" width="50" height="50" />
							<span>유저 이름</span>
							<input class="more" type="button" value="더보기" onclick="location.href=''" />
						</li>
					</div>
				
				</ul>
			
			</section>
		
		</div>
		
		<div id="tab1">
			
		</div>
	
	</div>
	
	<div id="tab2">
	
	</div>
	
	<div id="tab3">
	
	</div>
	
	<jsp:include page="./include/user_bottom.jsp" />

</body>
</html>