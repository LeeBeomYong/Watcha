<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">

.wrapper {
  height: 100vh;
  
  display: grid;
  place-items: center;
  background-color:#FDF5E6;
}

.typing-demo {
  width: 22ch;
  animation: typing 2s steps(22), blink .5s step-end infinite alternate;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;
  font-family: Georgia;
  font-size: 2em;
}

@keyframes typing {
  from {
    width: 0
  }
}
    
@keyframes blink {
  50% {
    border-color: transparent
  }
}

</style>
</head>

<body>
<jsp:include page="../include/admin_top.jsp" />

<div class="wrapper">
    <div class="typing-demo">
      환영합니다. admin님......
    </div>
</div>

<jsp:include page="../include/admin_bottom.jsp" />
</body>
</html>