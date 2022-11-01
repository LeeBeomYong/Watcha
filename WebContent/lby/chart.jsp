<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.wacha.model.StarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_Id = (String)session.getAttribute("member_Id");

	StarDAO dao = StarDAO.getInstance();
	JSONArray jsonArray = dao.getUserStar(member_Id);
	//out.println(jsonArray);
	
// 	PrintWriter writer = response.getWriter();
// 	writer.println(jsonArray);
%>
<%=jsonArray %>
