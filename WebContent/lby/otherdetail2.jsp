<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$("#selectBox option:selected").val();
	
	$(document).ready(function() {
		  $('#selectBox').change(function() {
		    var result = $('#selectBox option:selected').val();
		    if(result==0) {
		    	$('#div0').show();
		    	$('#div1').hide();
		    	$('#div2').hide();
		    }else if(result==1){
		    	$('#div0').hide();
		    	$('#div1').show();
		    	$('#div2').hide();
		    }else if(result==2) {
		    	$('#div0').hide();
		    	$('#div1').hide();
		    	$('#div2').show();
		    }
		  }); 
		}); 
</script>
<style type="text/css">
	
/* 	#root { */
/* 		height: 600px;	 */
/* 	} */
	
	#sub {
		margin-left: 20px;
		margin-right: 20px;
	}
	li {
		
		list-style-type : none;
	}
	
	.hh {
		display: inline-block;
	}
	.img1:hover{
		opacity: 50%;
	}
	#star {
		color: orange;
		font-size: 12px;
	}
	#div1, #div2 {
		display: none;
	}
</style>
</head>
<body>

	<jsp:include page = "../include/user_top.jsp" />

	<div id="root">
		<div id ="sub">
			<div class="review">
				<br>
				<h1><strong>보고싶어요</strong></h1>
			</div>
			<br>
			<div>
			<select id="selectBox" class="form-select" aria-label="Default select example">
			  <option value="0" selected><span style="color: gray;">▼ 정렬</span></option>
			  <option value="1">제목 순(오름차순)</option>
			  <option value="2">년도 순(내림차순)</option>
			</select>
			</div>
		</div>
		<br><br><br>
		<div id="div0">
			<c:set var="list" value="${img_List }"/>
			<c:if test="${!empty img_List }">
				<ul>
				<c:forEach items="${list }" var="dto">
				<c:set var="count" value="${count + 1 }" />
					<li class="hh">
						<a href="<%=request.getContextPath() %>/wacha_content.do?movie_num=${dto.getMovie_num()}"><img class="img1" src="${pageContext.request.contextPath }/image/profile/${dto.getImage_loc()}" width="175px" height="260px"></a><br>
						<h5 >&nbsp;${dto.getMovie_title() }</h5>
 						<p id="star">&nbsp;&nbsp;평가함&nbsp;★${dto.getMovie_star() }</p>
					</li>
					<c:if test="${count % 10 == 0 }">
						<li>
						</li>
					</c:if>
				</c:forEach>
				</ul>
			</c:if>
			<c:if test="${empty img_List }">
				<div align="center">
				<h3><strong>보고싶은 영화가 없습니다.</strong></h3>
				</div>
			</c:if>
		</div>
		<div id="div1">
			<c:set var="list2" value="${title_list }"/>
			<c:if test="${!empty title_list }">
				<ul>
				<c:forEach items="${list2 }" var="dto2">
				<c:set var="count2" value="${count2 + 1 }" />
					<li class="hh">
						<a href="<%=request.getContextPath() %>/wacha_content.do?movie_num=${dto2.getMovie_num()}"><img class="img1" src="${pageContext.request.contextPath }/image/profile/${dto2.getImage_loc()}" width="175px" height="260px"></a><br>
						<h5 >&nbsp;${dto2.getMovie_title() }</h5>
							<p id="star">&nbsp;&nbsp;평가함&nbsp;★${dto2.getMovie_star() }</p>
					</li>
					<c:if test="${count2 % 10 == 0 }">
						<li>
						</li>
					</c:if>
				</c:forEach>
				</ul>
			</c:if>
			<c:if test="${empty title_list }">
				<div align="center">
				<h3><strong>보고싶은 영화가 없습니다.</strong></h3>
				</div>
			</c:if>
		</div>
		<div id="div2">
			<c:set var="list3" value="${year_list }"/>
			<c:if test="${!empty year_list }">
				<ul>
				<c:forEach items="${list3 }" var="dto3">
				<c:set var="count3" value="${count3 + 1 }" />
					<li class="hh">
						<a href="<%=request.getContextPath() %>/wacha_content.do?movie_num=${dto3.getMovie_num()}"><img class="img1" src="${pageContext.request.contextPath }/image/profile/${dto3.getImage_loc()}" width="175px" height="260px"></a><br>
						<h5 >&nbsp;${dto3.getMovie_title() }</h5>
 							<p id="star">&nbsp;&nbsp;평가함&nbsp;★${dto3.getMovie_star() }</p>
					</li>
					<c:if test="${count3 % 10 == 0 }">
						<li>
						</li>
					</c:if>
				</c:forEach>
				</ul>
			</c:if>
			<c:if test="${empty year_list }">
				<div align="center">
				<h3><strong>보고싶은 영화가 없습니다.</strong></h3>
				</div>
			</c:if>
		</div>
	</div>
	<br><br><br><br><br>
	<jsp:include page = "../include/user_bottom.jsp" />
</body>
</html>