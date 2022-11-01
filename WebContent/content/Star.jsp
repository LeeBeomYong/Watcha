<%@page import="com.wacha.model.StarDAO"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int movieNum =Integer.parseInt(request.getParameter("movieNum"));
	String memberId = request.getParameter("member_Id");
	int star=0; 
	if(request.getParameter("star") != null){
		star = Integer.parseInt(request.getParameter("star"));
	}
	
	// 새로운 회원이 만약 평점 또는 보고싶어요 보는중을 선택했을 때 요구사항
	StarDAO star_dao = StarDAO.getInstance();
	
	star_dao.chkId(movieNum,memberId);
	
	
	
	
	
	PrintWriter printWriter= response.getWriter();
	
	StarDAO dao = StarDAO.getInstance();
	
	// 회원별 해당 영화 평점 업데이트 
	dao.updateStar(memberId, movieNum, star);
	
	printWriter.println(star);
	printWriter.println(movieNum);
	printWriter.println(memberId);
%>    
