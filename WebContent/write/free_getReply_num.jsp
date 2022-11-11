<%@page import="com.wacha.model.FreeWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int reply_no = Integer.parseInt(request.getParameter("rno1").trim());

	FreeWriteDAO dao = FreeWriteDAO.getInstance();
	
	String str = dao.getReplyNum(reply_no);
	
	out.println(str);
%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>