<%@page import="com.wacha.model.UserDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("paramId");
	String email = request.getParameter("paramEmail");
	String pwd = request.getParameter("paramPwd");
	String nn = request.getParameter("paramNickName");
	
	UserDAO dao = UserDAO.getInstance();
	
	int res = dao.checkMemberId(id);
	
	out.println(res);
	
	System.out.println(res);
	
	

	
%>