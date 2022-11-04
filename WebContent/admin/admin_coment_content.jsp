<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

<script type="text/javascript">


</script>
<style type="text/css">
body{
    margin: 0;
    padding: 0;
    background-color:#BDB76B;
    font-family: arial;
    
}

.box{
    margin:0 10%;
    height: 630px;
    overflow: hidden;
    padding: 10px 0 40px 60px
}

.box ul{
    list-style-type: none;
    margin: 0;
    padding: 0;
    position: relative;
    transition: all 0.5s linear;
    top:0
}

.box ul:last-of-type{top:80px}

/* .box ul:before{
    content: "";
    display: block;
    width: 0;
    height: 100%;
    border:1px dashed #fff;
    position: absolute;
    top:0;
    left:30px
} */

.box ul li{
    margin: 20px 60px 60px;
    position: relative;
    padding: 10px 20px;
    background:rgba(255, 255, 255, 0.3);
    color:#fff;
    border-radius: 10px;
    line-height: 20px;
    width: 35%
}


.box ul li > span{
    content: "";
    display: block;
    width: 0;
    height: 100%;
    border:1px solid #fff;
    position: absolute;
    top:0;
    left:-30px
}

.box ul li > span:before,.box ul li > span:after{
    content: "";
    display: block;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background:#ff6d6d;
    border:2px solid #fff;
    position: absolute;
    left:-7.5px
}

.box ul li > span:before{top:-10px}
.box ul li > span:after{top:95%}

.box .title{
    text-transform: uppercase;
    font-weight: 700;
    margin-bottom: 5px
}

.box .info:first-letter{text-transform: capitalize;line-height: 1.7}

.box .name{
    margin-top: 10px;
    text-transform: capitalize;
    font-style: italic;
    text-align: right;


}
.box .tie{

     margin-top: 10px;
    text-transform: capitalize;
    font-style: italic;
    text-align: right;
 
   
} 
.box .time span{
    position: absolute;
    left: -100px;
    color:#fff;
    font-size:80%;
    font-weight: bold;
}
.box .time span:first-child{top:-16px}
.box .time span:last-child{top:94%}


.arrow{
    position: absolute;
    top: 105%;
    left: 22%;
    cursor: pointer;
  height:20px;
  width:20px
}

.arrow:hover{
    -webkit-animation: arrow 1s linear infinite;
       -moz-animation: arrow 1s linear infinite;
         -o-animation: arrow 1s linear infinite;
            animation: arrow 1s linear infinite;
}

.box ul:last-of-type .arrow{
    position: absolute;
    top: 105%;
    left: 22%;
    transform: rotateX(180deg);
    cursor: pointer;
}

svg{
    width: 20px;
    height: 20px
}

@keyframes arrow{
    0%,100%{
        top:105%
    }
    50%{
        top:106%
    }
}

@-webkit-keyframes arrow{
    0%,100%{
        top:105%
    }
    50%{
        top:106%
    }
}

@-moz-keyframes arrow{
    0%,100%{
        top:105%
    }
    50%{
        top:106%
    }
}

@-o-keyframes arrow{
    0%,100%{
        top:105%
    }
    50%{
        top:106%
    }
}

.btn {
  flex: 1 1 auto;
  margin: 10px;
  padding: 30px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 200% auto;
  color: white;
 /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;
  text-decoration: none;

 }
.btn:hover {
  background-position: right center; 
}
.btn-5 {
  background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 51%, #ffecd2 100%);
    font-family: 'Montserrat', sans-serif;
    font-size: 30px;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-wrap: wrap;
  width: 80vw;
  margin: 0 auto;
  min-height: 100vh;
}
</style>
</head>
<body>
<jsp:include page="../include/admin_top.jsp" />
<div class="box">
            <ul id="first-list">
            <c:set var="comentList" value="${comentList }"/>
            	<c:if test="${!empty comentList }">
            		<c:forEach items="${comentList }" var="dto">
                <li>
                    <span></span>
                    <div class="title">코맨트번호${dto.getComent_num() }</div>
                    <div class="info">${dto.getMovie_coment() }</div>
                  <div class="tie">
                    ${dto.getComent_hit() }
                    ${dto.getComent_nohit() }
                    ${dto.getMember_id() }
                    </div> 
                    
                    <div class="time">
                        <span><sup></sup></span>
                        <span></span>
                    </div>
                </li>
                </c:forEach>
                </c:if>
                <c:set var="comentsonList" value="${comentsonList }"/>
                <c:if test="${!empty comentsonList }">
            		<c:forEach items="${comentsonList }" var="dto1">
   
                <li>
                    <span></span>
                    <div class="title">${dto1.getComent_num_son() }</div>
                    <div class="info"> ${dto1.getMovie_coment() }</div>
        
                      <div class="tie">
                    ${dto1.getComent_hit() }
                    ${dto1.getComent_nohit() }
                    ${dto1.getMember_id() }
                    </div> 
                    
                    <div class="time">
                        <span><sup></sup></span>
                        <span></span>
                    </div>
                </li>
                 </c:forEach>
                </c:if>
  
                </ul>

            
        </div>
        <div class="container">
         <a class="btn btn-5" href="javascript:window.history.back();">돌아가기</a>
               
        </div>
        <jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>