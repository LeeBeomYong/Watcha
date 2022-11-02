<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.UserDTO"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memId = request.getParameter("paramId").trim();

	System.out.println(memId);

	UserDAO dao = UserDAO.getInstance();
	
	String test = dao.findIdforPwd(memId);
	
	System.out.println(test);
	
	PrintWriter writer = response.getWriter();
	if(!test.equals("")){
		writer.print(test);
	}
	
%>