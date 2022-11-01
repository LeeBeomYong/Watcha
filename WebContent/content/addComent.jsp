<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int movie_num = Integer.parseInt(request.getParameter("movie_num"));
	int coment_num = Integer.parseInt(request.getParameter("coment_num"));
	String member_Id=request.getParameter("member_Id");
	String cocoment=request.getParameter("cocoment");
	
	System.out.println("movie_num "+movie_num);
	System.out.println("coment_num "+coment_num);
	System.out.println("member_Id "+member_Id);
	System.out.println("cocoment "+cocoment);
	
	ComentDAO coment_dao = ComentDAO.getInstance();
	coment_dao.addcoComent(movie_num,coment_num,member_Id,cocoment);
%>