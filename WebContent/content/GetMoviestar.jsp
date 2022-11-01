<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.StarDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	StarDAO star_dao = StarDAO.getInstance();

	int movie_num = Integer.parseInt(request.getParameter("movieNum"));
	
	double star=star_dao.getStar(movie_num);	
	
	PrintWriter writer =response.getWriter();
	
	writer.print(star);
%>