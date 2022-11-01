<%@page import="com.wacha.model.UserDTO"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memId = request.getParameter("paramId").trim();

	UserDAO dao = UserDAO.getInstance();
	
	UserDTO dto = dao.findIdforPwd(memId);
	
%>