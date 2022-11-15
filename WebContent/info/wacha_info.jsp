<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>왓챠피디아 소개 페이지</title>
<script type="text/javascript">


	onload = function(){
		
		let button1 = document.getElementById("btn1");
		let button2 = document.getElementById("btn2");
		
		button1.onclick = function(){
			let btn1 = document.getElementById("btn1");
			let btn2 = document.getElementById("btn2");
			btn1.style.backgroundColor = "#FF2059";
			btn1.style.color = "white";
			btn2.style.backgroundColor = "white";
			btn2.style.color = "#FF2059";
		}
		
		button2.onclick = function(){
			let btn1 = document.getElementById("btn1");
			let btn2 = document.getElementById("btn2");
			btn1.style.backgroundColor = "white";
			btn1.style.color = "#FF2059";
			btn2.style.backgroundColor = "#FF2059";	
			btn2.style.color = "white"
		}
	}

</script>
<style type="text/css">
	

	.img{
		width: 800px;
		height: 400px;
	}
	
	header{
		margin-top: 30px;
	}

	#container{
		margin-left: 30%;
	}

	
	#hh{
		font-family: 맑은고딕;
		font-weight: 900;
	}
	
	#btn1,
	#btn2{
		border-radius: 5px;
		border: solid 1px #FF2059;
		color: #FF2059;
	}
	
	#boo{
		margin-left: 20%;
	}
	
</style>
</head>
<body>

	<jsp:include page="../include/user_top.jsp" />
	<div id="container">
		<header>
			<h2 id="hh">왓챵 WATCHA PEDIA</h2>
		</header>	
		<br>
		
		<p>
			<img class="img" src="https://images.watcha.net/updatable_images/2590/original/d7eb9109d3d48bd6daea0b3ef77ee3faae9f6bfc.png">
		</p>

		<h5 style="font-size: 20px; font-weight: bold;">
			세상의 모든 취향을 내 손 안에
		</h5>
		<p>
			왓챠피디아는 6억개 이상의 평가 데이터에 기반한 영화, 드라마, 도서, 웹툰 추천 서비스입니다.
		</p>
		<br>
		<hr width="60%">
		
		<h5>🎬 영화, 드라마, 책 그리고 웹툰 까지</h5>
		<p>
			인생 영화부터 틈만 나면 정주행하는 웹툰까지, 기록하고 평가하며 나만의 콘텐츠 여정을 만들어 보세요.
		</p>
		
		<br>
		
		<h5>✅ 뭘 봐야 하지? 왓챠피디아와 함께라면 걱정 마세요.</h5>
		<p>
		내 취향에 딱 맞는 콘텐츠를, 6억 개 이상의 평가 데이터에 기반해 정확하게 찾아드립니다.<br> 찾아낸 콘텐츠를 어디서 감상할 수 있는지도 바로 안내해 드려요.
		</p>
		
		<br>
		
		<h5>💌 콘텐츠의 여운을 함께 즐겨요.</h5>
		<p>
		'찐'으로 콘텐츠를 즐기는 사람은 결국 왓챠피디아에서 만난다! 소소한 생각부터 진지한 평론까지,<br> 좀비 영화부터 정주행 추천 웹툰 까지. 리뷰를 읽고 쓰고 컬렉션을 만들어 공유해 보세요.
		</p>
		
		<br>
		
		<hr width="60%">
		
		<br>
		
		<div id="boo">
			<p>
				도움이 되었나요 ?
			</p>
			<input type="button" id="btn1" value="예" style="width: 80px; background-color: white">
			<input type="button" id="btn2" value="아니요" style="width: 80px; background-color: white">
		</div>
		
		<br>
		<br>
		<hr width="60%">
		
	</div>
		<br>
		<br>
	<jsp:include page="../include/user_bottom.jsp" />
	
</body>
</html>