<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int movie_num = Integer.parseInt(request.getParameter("movieNum"));
	System.out.println(movie_num);
	System.out.println();
	StarDAO star_dao = StarDAO.getInstance();
	
	String starlist = star_dao.getEachStar(movie_num);


	PrintWriter writer = response.getWriter();
	writer.println(starlist);
%>