<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int movie_num = Integer.parseInt(request.getParameter("movieNum"));
	String member_Id = request.getParameter("memberId");
	int lookchk =0;
	if(request.getParameter("lookchk")!=null){
		lookchk= Integer.parseInt(request.getParameter("lookchk"));
	}
	// 새로운 회원이 만약 평점 또는 보고싶어요 보는중을 선택했을 때 요구사항
	StarDAO star_dao = StarDAO.getInstance();
		
	star_dao.chkId(movie_num,member_Id);
	
	System.out.println("보는중 메서드 >>> "+movie_num+", "+member_Id+", "+lookchk);
	
	star_dao.updateLooking(movie_num,member_Id,lookchk);
	System.out.println("보는중 메서드 업데이트");
	
	
%>