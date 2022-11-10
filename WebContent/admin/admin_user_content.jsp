<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>(ㄱ-)</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <style type="text/css">
        
        
        
        *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}


body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
  clear: both;
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
textarea{
 font-family: 'Nunito', sans-serif;
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

.can-1{
margin-left: 80px
}
.can-1,.can1-1,.can-3{
float: left;

}

.can-2{
clear: both;
}

.can1-1-1{
margin-top: 100px;
float: left;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 900px;
  }

}
/*코멘트 게시판리스트 게시판 리스트 */
 table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%; 
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
width:70px;

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
  font-size: 5px;
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
.th-4{
width:200px;
text-align: center;
}
.pagination {
		justify-content: center;
		color: green;
	}
.start{
align-items: center;
margin: 100px;
}
.rot-135:hover {
  filter: hue-rotate(135deg); 
        </style>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    
    <body>
      
      <c:set var="dto" value="${UserContent}" /> 
	<jsp:include page="../include/admin_top.jsp" />
	<br><br><br>
      <form enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_userDelete_ok.do?id=${dto.getMember_id()}&pwd=${dto.getMember_pwd()}" method="post">
  		<input type="hidden" name="member_num" value="${dto.getMember_num() }">
        <h1>회원상세 페이지</h1>
	<div class="start">
       <div  class="can-1">
          <fieldset>
           <legend><span class="number">1</span>회원프로필사진</legend>
             <label for="image"></label>
  
             <img src="<%=request.getContextPath()%>/image/${dto.getMember_image()}" width="150" height="200" > 
             	
    			<div id="image_container"></div>
          </fieldset>
        </div>
        
        
                <div class="can-1" >
        <fieldset >
          <legend><span class="number">2</span>회원이름</legend>
          <label for="name"></label>
          <input type="text" id="name" name="member_name"  value="${dto.getMember_name() }" readonly>
        </fieldset>
        
	        <div class="can-1-1">
	          <fieldset >
	          <legend><span class="number">3</span>회원아이디</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="member_id" value="${dto.getMember_id() }" readonly>	
        	</fieldset>
        	</div>
        	
        	     <div class="can-1-1">
	          <fieldset >
	          <legend><span class="number" >4</span>회원비밀번호</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="member_pwd" value="${dto.getMember_pwd() }" readonly>	
        	</fieldset>
        	</div>
        	
        </div>
	</div>
        <div class="can-2">
        <fieldset>
          <legend><span class="number">5</span>회원프로필</legend>
          
          <textarea id="bio" name="member_profile" rows="8" cols="25" readonly>${dto.getMember_profile() }</textarea>
        </fieldset>
     	</div>
     <div class="start">          
	            <div  class="can-1">
       	<div style="float: left;">
        <fieldset >
          <legend><span class="number" >6</span>회원생년월일</legend>
          <label for="name"></label>
          <input type="text" id="name" name="member_birth"  value="${dto.getMember_birth() }" readonly>
 
    			<div id="image_container"></div>
          </fieldset>
        </div>
        
        
                <div class="can-1">
        <fieldset >
          <legend><span class="number" >7</span>회원가입일</legend>
          <label for="name"></label>
          <input type="text" id="name" name="member_regdate"  value="${dto.getMember_regdate() }"readonly>
        </fieldset>
        	</div>
        </div>
        
</div>






	
   <br><br>
        <button type="submit">Delete</button>
        
      </form>
      <jsp:include page="../include/admin_bottom.jsp" />
    </body>
</html>