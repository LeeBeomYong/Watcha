<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>고객센터 답변해주는 페이지</title>
        	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
        	
 <style type="text/css">
 
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}


body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
  resize: none;
}



select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
 
button{
  background:#4bc970;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
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
th,
td {

  padding: 6px 15px;
}
th {

  background: #3fa46a;
  color: #fff;
}
table 
{
  border-collapse: separate;
  border-spacing: 0;
  width: 46%; 
}


@media screen and (min-width: 480px) {

  form {
    max-width: 800px;
  }

}
        
        </style>
        <script type="text/javascript">
    	let noimage =
    		  "https://ami-sni.com/wp-content/themes/consultix/images/no-image-found-360x250.png";

    		function readURL(input) {
    		  console.log(input.files);
    		  if (input.files && input.files[0]) {
    		    var reader = new FileReader();
    		    reader.onload = function (e) {
    		      $("#img-preview").attr("src", e.target.result);
    		    };

    		    reader.readAsDataURL(input.files[0]);
    		  } else {
    		    $("#img-preview").attr("src", noimage);
    		  }
    		}
        
        
        </script>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    
    <body>
	<jsp:include page="../include/admin_top.jsp" />
	<br><br>
	<section>
  <div class="tbl-header">
	<c:set var="dto" value="${write }"/>
	<h1>1:1 답변요청</h1>
	<table>
	  <thead align="center">
	    <tr>
	      <th>#</th>
	      <th>아이디</th>
	      <th class="th-6">작성자</th>
	<!--       <th>작성일자</th>
	      <th>조회수</th> -->
	    </tr>
	  </thead>
		  <tbody >
		    <tr>
		      <td align="center">${dto.getW_num() }</td>
		  
		      <td>${dto.getW_id() }</td>
			 <td align="center">${dto.getW_date() }</td>
		<%--       <td align="center" class="th-5">${dto.getW_hit() }</td> --%>
		    </tr>
  		 </tbody>
  		 <tr>
  		 	<th colspan="5">글 내용</th>
  		 </tr>
  		 <tr>
  		 	<td colspan="5"><textarea readonly style="color: #000;">${dto.getW_cont() }</textarea></td>
  		 </tr>
	</table>
  </div>
</section>
<br>
      <form action="<%=request.getContextPath() %>/admin_service_w_write_ok.do" method="post">
        <h1>1:1답변글 작성</h1>
      <input type="hidden" name="w_writenum" value="${dto.getW_num() }"> 
        <fieldset>
          <legend><span class="number">1</span>답변 내용</legend>
         
          <textarea id="bio" name="reply_w_cont" rows="8" cols="25" ></textarea>
        </fieldset>
     
        
   
        <button type="submit">Send!</button>
      </form>
      <jsp:include page="../include/admin_bottom.jsp" />
    </body>
</html>