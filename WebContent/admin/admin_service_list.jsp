<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 리스트 페이지</title>
<style type="text/css">
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
a{
color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;

}

table 
{
  border-collapse: separate;
  border-spacing: 0;
  width: 80%; 
}
th,
td {

  padding: 6px 15px;
}
th {

  background: #3fa46a;
  color: #fff;

  
}
.th-4{
width:40px;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}

  .b-blue, .b-blue:before {
    background: rgba(5,118,255,1);
    background: -moz-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(5,118,255,1)), color-stop(100%, rgba(36,248,255,1)));
    background: -webkit-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -o-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0576ff', endColorstr='#24f8ff', GradientType=1 );
  }

.button {
  display: inline-block;
  position: relative;
  border-radius: 3px;
  text-decoration: none;
  padding: .5em;
  margin: .5em;
  font-size: 9px;
  font-weight: bold;
  transition: all .5s;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color: red;
}
.button:hover {
  text-shadow: 0px 0px 0px rgba(255, 255, 255, .75);
}
.button:hover:after {
  left: 100%;
  top: 100%;
  bottom: 100%;
  right: 100%;
}
.button:before {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  border-radius: 5px;
  transition: all .5s;
}

.button2 {
  display: inline-block;
  font-size: 13px;
  margin: .5em;
  padding: .5em;
  border-radius: 5px;
  transition: all .5s;
  filter: hue-rotate(0deg);
  color: #FFF;
  text-decoration: none;
}
.button3 {
  display: inline-block;
  font-size: 9px;
  margin: .5em;
  padding: .5em;
  border-radius: 5px;
  transition: all .5s;
  filter: hue-rotate(0deg);
  color: #FFF;
  text-decoration: none;
}
/*END BASE BUTTON*/
/*ROTATE*/

.rot-135:hover {
  filter: hue-rotate(135deg);

/*END ROTATE*/
}
.th-5{
	width: 70px;
}
.th-6{
	width: 100px;
}
</style>


</head>

<body>
		<jsp:include page="../include/admin_top.jsp" />
		
		<section>
	  <!--for demo wrap-->
	  <h1>고객센터</h1>
	  <div class="tbl-header">
	<table>
	
	  <thead align="center">
	    <tr>
	      <th>#</th>
	      <th>글제목</th>
	      <th class="th-6">작성자</th>
	      <th>작성일자</th>
	      <th>조회수</th>
	      <th class="th-4">답변</th>
	      <th class="th-4">삭제</th>
	    </tr>
	  </thead>
	  <c:set var="list" value="${List }"  />
			<c:forEach items="${list }" var="dto">
	  <tbody>
	    <tr>
	      <td align="center">${dto.getWrite_num() }</td>
	      <td>${dto.getWrite_title() }</td>
	      <td>${dto.getMember_id() }</td>
		 <td align="center">${dto.getWrite_date().substring(0,10) }</td>
	      <td align="center" class="th-5">${dto.getWrite_hit() }</td>
	      <td>
	      	<c:if test="${dto.getWrite_reply() ne 1 }">
		      	<a href="<%=request.getContextPath() %>/admin_service_write.do?num=${dto.getWrite_num()}" class="button3 b-blue rot-135">답변</a>      	
	      	</c:if>
	      	<c:if test="${dto.getWrite_reply() eq 1 }">
		      	<a class="button3 b-blue rot-135" onclick="alert('이미 답변 완료한 문의입니다.')" style="filter: hue-rotate(135deg);">완료</a>      	      		
	      	</c:if>
	      </td>
	      <td><a href="<%=request.getContextPath() %>/admin_service_delete.do?num=${dto.getWrite_num() }" onclick="return confirm('정말 삭제 하시겠습니까 ?')" class="button3 b-blue rot-135" >삭제</a></td>
	    </tr>
	    
	  </tbody>
	  </c:forEach>
	  
	</table>
	
		
	  </div>
	</section>




	<section>
	  <!--for demo wrap-->
	  <h1>1:1 고객센터</h1>
	  <div class="tbl-header">
	<table>
	
	  <thead align="center">
	    <tr>
	      <th>#</th>
	      <th class="th-6">작성자</th>
	      <th>작성일자</th>
	      <th>파일</th>
	      <th class="th-4">답변</th>
	      <th class="th-4">삭제</th>
	    </tr>
	  </thead>
	  <c:set var="list_1" value="${List_1 }"  />
			<c:forEach items="${list_1 }" var="dto_1">
	  <tbody>
	    <tr>
	      <td align="center">${dto_1.getW_num() }</td>
	      <td>${dto_1.getW_id() }</td>
		 <td align="center">${dto_1.getW_date().substring(0,10) }</td>
	      <td align="center" class="th-5">${dto_1.getW_file() }</td>
	      <td>
	      	<c:if test="${dto_1.getW_reply() ne 1 }">
		      	<a href="<%=request.getContextPath() %>/admin_service_write.do?num=${dto_1.getW_num()}" class="button3 b-blue rot-135">답변</a>      	
	      	</c:if>
	      	<c:if test="${dto_1.getW_reply() eq 1 }">
		      	<a class="button3 b-blue rot-135" onclick="alert('이미 답변 완료한 문의입니다.')" style="filter: hue-rotate(135deg);">완료</a>      	      		
	      	</c:if>
	      </td>
	      <td><a href="<%=request.getContextPath() %>/admin_service_delete1.do?num=${dto_1.getW_num() }" onclick="return confirm('정말 삭제 하시겠습니까 ?')" class="button3 b-blue rot-135" >삭제</a></td>
	    </tr>
	    
	  </tbody>
	  </c:forEach>
	  
	</table>
	
		
	  </div>
	</section>

	
		

	<jsp:include page="../include/admin_bottom.jsp" />
</body>

</html>