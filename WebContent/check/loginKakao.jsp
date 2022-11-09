<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("paramId");
	String email = request.getParameter("paramEmail");
	String nn = request.getParameter("paramNickName");
	
	UserDAO dao = UserDAO.getInstance();
	
	int res = dao.signUpKakao(id, email, nn);

	
	out.println(res);



%>