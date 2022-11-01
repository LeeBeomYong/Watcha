<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.ComentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	int movie_num=Integer.parseInt(request.getParameter("movie_num"));
	int coment_num=Integer.parseInt(request.getParameter("coment_num"));
	
	System.out.println(movie_num);
	System.out.println(coment_num);
	
	ComentDAO coment_dao = ComentDAO.getInstance();
	
	String coComentList= coment_dao.getMoviecoComent(movie_num,coment_num);
	 
	
	PrintWriter writer = response.getWriter();
	writer.println(coComentList);
%>
