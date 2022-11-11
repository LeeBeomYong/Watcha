<%@page import="com.wacha.model.ComentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.wacha.model.ComentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ComentDAO coment_dao = ComentDAO.getInstance();

	List<ComentDTO> coment_list= coment_dao.getComentListPage(Integer.parseInt(request.getParameter("page")));
	int count = coment_dao.getComentListCount() / 10 +1;
	String res="";
	/* String button="<tr><td colspan=\"5\" align=\"center\">";
	for(int i=1; i<=count;i++){
		button+="<button class=\"coment_btn\" value=\""+i+"\">"+i+"</button>";
	}
	button+="</td></tr>";
	 */
	int cnt=(Integer.parseInt(request.getParameter("page"))-1)*10+1;
	for(ComentDTO coment : coment_list){
		res+="<tr><td>"+coment.getMovie_num()+"</td><td id=\"coment"+cnt+"\">"+coment.getComent_num()+"</td><td>"+coment.getMember_id()+"</td><td><a href=\"wacha_coment.do?coment_num="+coment.getComent_num()+"&movie_num="+coment.getMovie_num()+"&session_id="+coment.getMember_id()+"\">"+coment.getMovie_coment()+"</a></td><td><button class=\"delete_btn\" value=\""+cnt+"\">삭제</button></td></tr>";
		cnt++;
	}
	
	out.print(res);

%>