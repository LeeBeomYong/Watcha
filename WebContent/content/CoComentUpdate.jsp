<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	int movie_num=Integer.parseInt(request.getParameter("Mn"));
	int coment_num=Integer.parseInt(request.getParameter("Cn"));
	int coment_num_son=Integer.parseInt(request.getParameter("Cns"));
	String member_Id ="";
	if(request.getParameter("member")!=null){
 		member_Id = request.getParameter("member");
 	}
 	
	System.out.println(movie_num+","+coment_num+","+coment_num_son+","+member_Id);
	
	ComentDAO coment_dao = ComentDAO.getInstance();
	
	coment_dao.likeThis(movie_num, coment_num, coment_num_son, member_Id);
	
%>