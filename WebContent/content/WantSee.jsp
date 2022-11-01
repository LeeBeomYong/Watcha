<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	int movie_num = Integer.parseInt(request.getParameter("movieNum"));
    	String member_Id = request.getParameter("memberId");
    	int countchk = Integer.parseInt(request.getParameter("countchk"));
    	
    	
    	// 새로운 회원이 만약 평점 또는 보고싶어요 보는중을 선택했을 때 요구사항
    	StarDAO star_dao = StarDAO.getInstance();
    		
    	star_dao.chkId(movie_num,member_Id);
    	
    	
    	star_dao.updateWantSee(movie_num,member_Id,countchk);
    	System.out.println("보고싶어요 메서드 업데이트");
    
    %>