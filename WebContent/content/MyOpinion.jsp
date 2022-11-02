<%@page import="com.wacha.model.ComentDTO"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ComentDAO coment_dao = ComentDAO.getInstance();
	ComentDTO coment_dto =null;
	if(request.getParameter("member_Id")!=null){
		coment_dto =coment_dao.getComentInfo(Integer.parseInt(request.getParameter("movie_num")), request.getParameter("member_Id"));
		request.setAttribute("coment_dto", coment_dto);
	}
	
%>


    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">
	#Opdiv{
		margin-top: 10%;
	}
	
</style>
</head>
<body>
<div class="col-md-12" id="Opdiv">
		<div class="col-md-4" align="center">
		        <form action="<%=request.getContextPath()%>/wacha_coment_Ok.do" method="post">
		        	<input type="hidden" value="<%=request.getParameter("member_Id") %>" name="member_Id">
		        	<input type="hidden" value="<%=request.getParameter("movie_num")%>" name="movie_num">
		        	<input type="hidden" value="<%=request.getParameter("chk")%>" name="chk">
		        	
		            <div class="form-group">
		                <label for="author"> 작성자 </label>
		                <input type="text" class="form-control" id="author" value="<%=session.getAttribute("member_Id") %>" readonly="readonly">
		            </div>
		            <div class="form-group">
		                <label for="content"> 내용 </label>
		                <c:if test="${!empty coment_dto }">
		                <textarea class="form-control" name="content" placeholder="내용을 입력하세요"><%=coment_dto.getMovie_coment() %></textarea>
		                </c:if>
		                <c:if test="${empty coment_dto }">
		                <textarea class="form-control" name="content" placeholder="내용을 입력하세요"></textarea>
		                </c:if>
		                
		            </div>
		        <c:choose>
		        	<c:when test="${!empty coment_dto }">
		        		 <button type="submit" class="btn btn-danger" id="btn-save">수정</button>
		        	</c:when>
		        	<c:otherwise>
		        		<button type="submit" class="btn btn-danger" id="btn-save">등록</button>
		        	</c:otherwise>
		        </c:choose>
		        </form>
		</div>
</div>
</body>
</html>