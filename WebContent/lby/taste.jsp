<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<title>Insert title here</title>
<script type="text/javascript">
	google.load('visualization', '1', {packages: ['corechart'],'language':'ko'});
	
	function drawVisualization(dataFromAjax) {
        var data = google.visualization.arrayToDataTable(dataFromAjax);

        new google.visualization.ColumnChart(document.getElementById('map')).
        draw(data, {fontName: "맑은 고딕, Malgon Gothic",
               fontSize: 11,
               forceIFrame: false}
//                vAxis: {maxValue: 10}}
          );
   }

	function drawInit()
    {
         var data = null;
         var table_data = null;


         $.ajax({
//              url:'/WatchaProject/lby/chart.jsp',
             url:'<%=request.getContextPath() %>/lby/chart.jsp',
             data: {member_Id : $("#chart").val()},
             success: function(res) {
                 table_data = eval("(" + res + ")");
                 drawVisualization(table_data);
             }
        });
    }
	
	google.setOnLoadCallback(drawInit);
</script>

<style type="text/css">
	

	.relative {
	    position: relative;
	    width: 800px;
	    height: 1600px;
	}
	
	#div1 {
		width: 800px;
		height: 250px;
		background-image: url("${pageContext.request.contextPath }/image/profile/취향분석2.png");
	}
	
	#div1 img {
		position: absolute;
		top: 200px;
		left: 30px;
	}
	#div1 h3 {
		position: absolute;
		top: 205px;
 		left: 100px; 
		color: white;
	}
	#div2 {
		width: 800px;
		height: 700px;
		border: 1px solid lightgray;
	}
	#div3 {
		width: 800px;
		height: 600px;
		border: 1px solid lightgray;
	}
	
	hr {
		width:95%;
	}
	
	h5 {
		position: absolute;
 		left: 20px; 
	}

	.p1 {
		position: absolute;
 		left: 50%; 
	}
	
	#test {
		position: absolute;
		left:37%;
		color: red;
	}
	#map2 {
		position: relative;
		height: 150px;
	}
	
	#map2 div {
		display: inline-block;
		width: 266px;
		height: 30px;
		float: left;
		
	}
	
	img {
		margin: 0 !important;
	}

</style>
</head>
<body>
	<jsp:include page = "../include/user_top.jsp" />
	
	<div align="center">
		<div class="relative">
			<br><br>
			<c:set var="dto2" value="${userProfile }"/>
			<div id="div1" align="left">
				<c:if test="${!empty dto2.getMember_image() }">
<%-- 				<img alt="프로필" src="${pageContext.request.contextPath }/image/profile/프로필_로고.png" width="50px" height="50px"> --%>
					<img alt="프로필" src="${pageContext.request.contextPath }/image/profileupload/${dto2.getMember_image()}" width="50px" height="50px">
				</c:if>
				<c:if test="${empty dto2.getMember_image() }">
					<img alt="프로필" src="${pageContext.request.contextPath }/image/profileupload/프로필_로고.png" width="50px" height="50px">
				</c:if>
				<h3 style="font-weight: bold;">${dto2.getMember_name() }</h3>
			</div>
			<br>
			<div id="div2">
				<br>
				
				<div>
					<h5><strong>평가수</strong></h5>
				</div>
				
					<br><br>
					
				<div>
					<c:set var="review_count" value ="${review_count }"/>
					<p class="p1">&nbsp;&nbsp;${review_count }</p>
					<br>
					<p class="p1">영화</p>
				</div>
				
					<br><br><br>
				<hr>

				<div>
					<div>
						<h5><strong>별점분포</strong></h5><br>
						<c:set var="member_Id" value ="${member_Id }"/>
						<input type="hidden" value="${member_Id }" id="chart">
						<c:if test="${review_count < 50}">
							<p class="p1" style="position:absolute; left: 40%; color: red;">평가가 너무 적어요 ㅠ.ㅠ</p>
							<br><br>
						</c:if>
					</div>
		            <div id="map" style="width: 600px; height: 300px; margin: -15px;">
					</div><br>
					<div id="map2">
						<div>
							<span style="font-weight: bold;"> 별점 평균 </span><br>
							<c:set var="star_avg" value ="${star_avg }"/>
							<span style="font-weight: lighter;"> ${star_avg } </span>
						</div>
						<div>
							<span style="font-weight: bold;"> 별점 개수 </span><br>
							<c:set var="star_count" value ="${star_count }"/>
							<span style="font-weight: lighter;"> ${star_count } </span>
						</div>
						<div>
							<span style="font-weight: bold;"> 많이 준 별점 </span><br>
							<c:set var="star_max" value ="${star_max }"/>
							<span style="font-weight: lighter;"> ${star_max } </span>
						</div>
					</div>
	            </div>
			</div>
			<br>
			<div id="div3">
				<br>
				
				<div>
					<h5><strong>영화선호국가</strong></h5>
				</div>
				
					<br><br>
				<c:set var="countrylist" value="${countryList }"/>
				<div style="display: inline-block;">
					<c:if test="${!empty countrylist }">
						<c:forEach items="${countrylist }" var="dto">
							<div style="display: inline-block; margin-left: 20px; ">
								<span style="font-weight: bold;">${dto.getMovie_country() }</span><br>
								<span style="font-weight: lighter;">${dto.getMovie_country_count() }편</span>
							</div>
						</c:forEach>
					</c:if>
				<c:if test="${empty countrylist }">
						<p class="p1">조회된 데이터가 없습니다.</p>
				</c:if>
				</div>
				<br><br><br>
				<hr>
			<c:set var="genrelist" value="${genreList }"/>	
				<div>
					<h5><strong>영화선호장르</strong></h5>
				</div>
					<br><br>
				<div style="display: inline-block;">
				<c:if test="${!empty genrelist }">
					<c:forEach items="${genrelist }" var="dto">
						<div style="display: inline-block; margin-left: 20px; ">
							<span style="font-weight: bold;">${dto.getMovie_genre() }</span><br>
							<span style="font-weight: lighter;">${dto.getMovie_genre_count() }편</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty genrelist }">
						조회된 데이터가 없습니다.
				</c:if>
				</div>
				<br><br><br><br>
				<hr>
				<div>
					<h5><strong>영화감상시간</strong></h5>
				</div>
				<br><br>
				<div>
					<c:set var="time_sum" value ="${time_sum }"/>
					<p class="p1">${time_sum }시간</p><br>
					<br>
					<c:if test="${time_sum < 60}">
						<p class="p1" style="position: absolute; left: 35%; color: red;">에이 설마 이것만 본 건 아닐 거에요..</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>	
	<br><br><br><br><br><br><br><br>
	<jsp:include page = "../include/user_bottom.jsp" />

</body>
</html>