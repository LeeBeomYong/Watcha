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
    background-color:#3fa46a;
    font-family: arial
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

.box ul:before{
    content: "";
    display: block;
    width: 0;
    height: 100%;
    border:1px dashed #fff;
    position: absolute;
    top:0;
    left:30px
}

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

</style>
</head>
<body>
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
                        <span>JUN, 17<sup>th</sup></span>
                        <span>12:00 AM</span>
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
                        <span>JUN, 29<sup>th</sup></span>
                        <span>11:36 AM</span>
                    </div>
                </li>
                 </c:forEach>
                </c:if>
     <!--            <li>
                    <span></span>
                    <div class="title">comment #02</div>
                    <div class="info">the best animation , the best toturials you would ever see . what about canvas ?? do you like it ..</div>
                    <div class="name">- dr. ahmed -</div>
                    <div class="time">
                        <span>FEB, 2<sup>nd</sup></span>
                        <span>02:00 PM</span>
                    </div>
                </li> -->
                </ul>

           
               
            
            
        </div>
</body>
</html>