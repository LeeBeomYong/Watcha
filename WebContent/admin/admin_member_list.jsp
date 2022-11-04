<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(ʃ⌣́,⌣́ƪ)(ʃ⌣́,⌣́ƪ)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
a{
color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;

}

table {
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
.th-3{
width:140px;
}

.th-4{
width:180px;
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

.button:after {
  background: #2c3e50;
}
.ctn {
  display: block;
  margin: auto;
  text-align: center;
}

/*END BODY*/

/*GRADIENTS*/
  /*GREEN*/
  .b-green, .b-green:before {
    background: rgba(73,155,234,1);
    background: -moz-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(73,155,234,1)), color-stop(100%, rgba(26,188,156,1)));
    background: -webkit-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -o-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#499bea', endColorstr='#1abc9c', GradientType=1 );
  }
  /*PINK*/
  .b-pink, .b-pink:before {
    background: rgba(231,72,234,1);
    background: -moz-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(231,72,234,1)), color-stop(100%, rgba(75,26,188,1)));
    background: -webkit-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -o-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e748ea', endColorstr='#4b1abc', GradientType=1 );
  }
  /*RED*/
  .b-red, .b-red:before {
    background: rgba(234,110,72,1);
    background: -moz-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(234,110,72,1)), color-stop(100%, rgba(188,26,99,1)));
    background: -webkit-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -o-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ea6e48', endColorstr='#bc1a63', GradientType=1 );
  }
  /*ORANGE*/
  .b-orange, .b-orange:before {
    background: rgba(255,193,7,1);
    background: -moz-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(255,193,7,1)), color-stop(100%, rgba(255,87,34,1)));
    background: -webkit-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -o-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffc107', endColorstr='#ff5722', GradientType=1 );
  }
  /*BLUE*/
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
/*END GRADIENTS*/
/*BASE BUTTON*/
.button {
  display: inline-block;
  position: relative;
  border-radius: 3px;
  text-decoration: none;
  padding: .5em;
  margin: .5em;
  font-size: 10px;
  font-weight: bold;
  transition: all .5s;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
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
.button:after {
  content: '';
  display: block;
  position: absolute;
  left: 2px;
  top: 2px;
  bottom: 2px;
  right: 2px;
  z-index: -1;
  border-radius: 5px;
  transition: all .5s;
}
.button2 {
  display: inline-block;
  font-size: 10px;
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
.rot-360-noscoop:hover {
  filter: hue-rotate(360deg);
  transform: rotate(360deg);
}
.rot-135:hover {
  filter: hue-rotate(135deg);
}
.rot-90:hover {
  filter: hue-rotate(90deg);
}
/*END ROTATE*/
	.pagination {
		justify-content: center;
		color: green;
}
.custom-btn{
color:aqua; 
}

</style>

</head>

<body>
	<jsp:include page="../include/admin_top.jsp" />
	<section>
  <!--for demo wrap-->
  <h1>회원리스트</h1>
  <br><br>
  <div class="tbl-header">
<table>

  <thead align="center">
    <tr>
      <th></th>
      <th>유저번호</th>
      <th>유저이름</th>
      <th>유저ID</th>
      <th>생년월일</th>
      <th>유저가입일</th>
      <th>유저상태</th>
      <th class="th-3">상세정보</th>
      
    </tr>
  </thead>
  <c:set var="userlist" value="${userList}" />
			<c:if test="${!empty userlist}">
				<c:forEach items="${userlist }" var="dto">
  <tbody >
    <tr>
    	<td align="center"><input type="checkbox"></td>
    	
      <td align="center">${dto.getMember_num() }</td>

     <td align="center">${dto.getMember_name() }</td>
		  
      <td align="center">${dto.getMember_id() }</td>
      
      <td align="center">${dto.getMember_birth() }</td>
      
      <td align="center">${dto.getMember_regdate() }</td>
      <td class="now" align="center">
							<%-- 게시글 번호랑 가지고 있는 게시글 번호랑 같고, 내용이 있을때 나와라. --%>
							<c:if test="${dto.getMember_use() ne '1'}">
								<button class="bu1">탈퇴</button>
							</c:if>
							<c:if test="${dto.getMember_use() eq '1' }">
								<button class="bu2">유저</button>
							</c:if>
						</td>
      
      <td class="th-3" align="center"><a href="<%=request.getContextPath() %>/admin_member_content.do?id=${dto.getMember_id()}" class="button2 b-orange rot-135">상세정보</a></td>
     
      
    </tr>
    
  </tbody>
  </c:forEach>
  </c:if>
  <c:if test="${empty userlist}">
  	<tr>
			 	<td colspan="9" align="center">
			 	<h3>회원 리스트가 없습니다..</h3>
		 	</tr>
  </c:if>
 
 </table>
 <br>
 	
		  <ul class="pagination">
		
		    <c:forEach begin="${startBlock }"
	       				end="${endBlock }" var="i">
		      
		      <c:if test="${i == page }">
		         <li class="page-item active" aria-current="page">
		           <a class="page-link" href="admin_member_list.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	      
		      <c:if test="${i != page }">
		         <li class="page-item">
		           <a class="page-link" href="admin_member_list.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	   		</c:forEach>
		    
		    <c:if test="${endBlock < allPage }">
		      
		       <li class="page-item">
		      	<a class="page-link" href="admin_member_list.do?page=${page + 1 }">Next</a>
		      </li>
		      
		      
		      <li class="page-item">
		      	<a class="page-link" href="admin_member_list.do?page=${allPage }">End</a>
		      </li>
		    </c:if>
		  </ul>
		
		
  	</div>
</section>
	<jsp:include page="../include/admin_bottom.jsp" />
</body>

</html>