<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	int movie_num=Integer.parseInt(request.getParameter("movieNum"));
	StarDAO star_dao = StarDAO.getInstance();
	
	int res = star_dao.getMovieStarcount(movie_num);
	
	out.print(res);
	System.out.println("res 값 >>> "+res);
%>