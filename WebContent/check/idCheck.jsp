<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String userId = request.getParameter("paramId").trim();
	
	UserDAO dao = UserDAO.getInstance();
	
	int res = dao.checkMemberId(userId);
	
	out.println(res);
	

%>    
