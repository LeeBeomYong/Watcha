<%@page import="com.wacha.model.FreeWriteDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.FreeWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	FreeWriteDAO free_dao = FreeWriteDAO.getInstance();
	List<FreeWriteDTO> free_list= free_dao.getFreeList(Integer.parseInt(request.getParameter("page")));

	String res="";
	
	int cnt=(Integer.parseInt(request.getParameter("page"))-1)*10+1;
	
	for(FreeWriteDTO free : free_list){
		res+="<tr><td id=\"free"+cnt+"\">"+free.getFree_num()+"</td><td>"+free.getMember_id()+"</td><td>"+free.getFree_cont()+"</td><td><button class=\"delete_btn2\" value=\""+cnt+"\">삭제</button></td></tr>";
		cnt++;
	} 
	
	out.print(res);
%>