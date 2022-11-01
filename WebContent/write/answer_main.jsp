<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/write/write_css/answer_css.css" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script type="text/javascript">

	// 눌렀을때 나머지 내용이 나오게 하는 함수.
	$(function(){
		  // project ui 스크립트
		  project.init();
		})

	var project = {
	  init : function(){
	    project.faq();
	  },
	  
	  // 자주하는질문 
	  faq : function(){
	    $('.s1 ul li').on('click', function(){
	      var self = $(this),
	          speed = 400,
	          easing = 'easeInOutExpo';

	      project.moveScroll(this, -20 );
	      self.find('p').slideToggle(speed, easing);
	    })
	  },
	  
	  // target으로 스크롤 이동
	  moveScroll : function(tg,flex){
	    var speed = 400,
	        easing = 'easeInOutExpo',
	        oft = $(tg).offset().top;
	    $('body').stop().animate({scrollTop:oft + flex}, speed, easing);
	  }
	}

</script>
</head>
<body>
	<%-- 상단 include 바 --%>
	<jsp:include page="../include/user_top.jsp" />
	
	<%-- 전체 컨테이너 --%>
	<div class="container">
	
	<%-- section 1 부분!!! --%>
	  <section class="s1">
	    <div class="title-area">
	      <h2>자주하는질문</h2>
	    </div>
	
	    <p id="pp">· 원하시는 답변이 없으신가요 ? 그럼 문의Q&A를 이용해주세요. &nbsp;&nbsp;<button id="button"><a id="aa" href="<%=request.getContextPath()%>/inquiry_main.do">문의Q&A</a></button></p>
	
	    <nav>
	      <ul>
	        <li>
	          <%-- 첫번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 어떤 원리로 추천되나요? <span id="sp1">▼</span></h5>
	          
	          <p><br>
				1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾습니다. 누구나 영화 볼 때 자기만의 중요한 기준이 있습니다. 예를 들면, "난 영상미나 음악이 중요해… 아니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가 중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있습니다. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람들이 바로 나와 취향이 비슷한 사람들입니다.
				<br><br>
				2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 영화 별로 "내 예상 별점"을 만듭니다. 나와 취향이 비슷한 사람들이 개별 영화에 매긴 점수는, 아마도 내가 실제로 매길 점수와 아주 아주 유사할겁니다. 즉 영화를 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 영화에 몇 점을 줄지 미리 알수가 있는 것이죠. 왓챠피디아는 나와 취향이 비슷한 사람들의 평가를 종합해서, 자동으로 영화 별 "내 예상 별점"을 계산하고 즉시 보여줍니다.
				<br><br>
				3. "내 예상 별점"이 높은 영화들을 추천합니다. 이렇게 계산된 예상 별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높습니다. 따라서 이런 영화들을 나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천합니다.
				<br><br>
				왓챠피디아는 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 개선된답니다. 이제 영화 뭐볼지 고민하지 마세요!
	          </p>
	        </li>
	        <li>
	          <%-- 두번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 내 코멘트를 친구만 보게 하거나, 아무도 못 보게 하고 싶어요. <span id="sp2">▼</span></h5>
	          
	          <p><br>
	          '프로필 > 설정 > 공개범위'에서, 내 코멘트에 대한 공개범위를 설정하실 수 있습니다. ‘친구 공개’ 설정 시 회원님이 팔로우하는 유저에게만 공개되며, ‘비공개’ 설정 시 아무도 내 코멘트를 보지 못하게 됩니다.
	          </p>
	        </li>
	        <li>
	          <%-- 세번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 부적절한 댓글은 어떻게 신고하나요? <span id="sp3">▼</span></h5>
	          
	          <p><br>
	          “취향 존중의 원칙"에 부합하지 않는 코멘트/댓글은 우측 “...” 버튼 터치를 통해 신고가 가능합니다. 신고 기준은 “취향 존중의 원칙"에 기반하며, 다수의 신고를 받은 게시글은 보이지 않게 처리됩니다. 동시에, “취향 존중의 원칙"을 준수한 게시글임에도 특정한 의도를 갖고 반복적으로 신고하는 “허위 신고자"도 막을 수 있도록 노력하겠습니다.
	          </p>
	        </li>
	        <li>
	          <%-- 네번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 비밀번호를 찾고싶어요. <span id="sp4">▼</span></h5>
	          
	          <p><br>
	          로그인 > "비밀번호 찾기" 버튼 터치를 통해 비밀번호 찾기가 가능합니다. 이름이나 전화번호로 찾을 수 있습니다.
	          </p>
	        </li>
	        <li>
	          <%-- 다섯번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 새로운 콘텐츠를 찾고 싶어요. 혹은 찾고 싶은 콘텐츠가 없어요. <span id="sp5">▼</span></h5>
	          
	          <p><br>
	          메인 > 검색창에 콘텐츠를 키워드나 태그로 검색해보세요. 새로운 컨텐츠가 검색됩니다. 혹은 찾고 싶은 콘텐츠가 없다면 "1:1문의" 로 새로운 컨텐츠 추가 문의를 이용해보세요. 매일매일 새로운 컨텐츠가 업로드 됩니다. 
	          </p>
	        </li>
	        <li>
	          <%-- 여섯번째 질문 --%>
	          <h5>&nbsp;&nbsp;&nbsp;💬&nbsp;[WACHA]&nbsp; 왓챠피디아 "취향 존중의 원칙"을 소개합니다. <span id="sp6">▼</span></h5>
	          
	          <p><br>
			  왓챠피디아 “취향 존중의 원칙”이란 “내 취향 표현의 자유만큼이나, 나와 다른 취향에 대한 존중이 중요하다는 원칙" 입니다. 다음 질문을 스스로 물어보는 방법을 통해 이 원칙이 지켜지고 있는지 확인할 수 있다고 생각합니다 : “왓챠피디아 코멘트와 댓글을 통해 나를 표현하는 과정에서, 다른 취향을 가진 사람들이 공격적이거나 모욕적이라고 느껴지지 않도록 의식적으로 배려하고 있는가?”
			  <br>
			  왓챠피디아는 “취향 존중의 원칙"을 전제로 한 상대방 코멘트에 대한 공감 / 질문 / 반론을 권장합니다. 그러나 다음과 같은 상황은 “취향 존중의 원칙"이 지켜지지 않은 것이라고 생각합니다.
			  <br>- 글쓴이 취향 자체에 대한 공격
	          <br>- 글쓴이 취향의 표현 방식에 대한 공격
	          <br>- 특정 계층, 지역, 종교에 대한 공격
			  </p>
	        </li>
	      </ul>
	    </nav>
	  </section>
	  
	  <%-- section 2 부분 정확하게 하단바가 내려가지 않아서 임의로 조정해둠. --%>
	  <section style="height: 800px;">
	  
	  
	  </section>
	</div>

	<%-- 하단 include 부분 --%>
	<jsp:include page="../include/user_bottom.jsp" />
</body>
</html>
