<%@page import="com.wacha.controller.ActionForward"%>
<%@page import="com.wacha.model.ComentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	int movie_num=Integer.parseInt(request.getParameter("movieNum"));
	ComentDAO coment_dao = ComentDAO.getInstance();
	List<ComentDTO> clist =  coment_dao.getComentList(movie_num);
	
%>