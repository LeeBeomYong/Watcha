<%@page import="com.wacha.controller.ActionForward"%>
<%@page import="com.wacha.model.UserDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.wacha.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String id = request.getParameter("paramId");
	String email = request.getParameter("paramEmail");
	String name = request.getParameter("paramNickName");
	
	System.out.println("아이디"+id);
	//System.out.println(email);
	//System.out.println(name);
	
	if(email == null) {
		email = "";
	}
	
	UserDAO dao = UserDAO.getInstance();
	
	// 아이디 확인
	int chk = dao.checkMemberId(id);
	
	ActionForward forward= new ActionForward();
		
	if(chk > 0) {	// 아이디 존재
		
		System.out.println(chk);
	
		System.out.println("if chk > 0 : "+id);
		
		UserDTO dto = dao.getMember(id);
		
		HttpSession session3 = request.getSession();
		
		session3.setAttribute("session_id", dto.getMember_id());
		
		session3.setAttribute("session_name", dto.getMember_name());
		
		session3.setAttribute("session_img", dto.getMember_image());
		
		System.out.println("session id : " + dto.getMember_id());
		System.out.println("session name : " + dto.getMember_name());
		System.out.println("session img : " + dto.getMember_image());
		
		forward.setRedirect(true);
		
		forward.setPath("main.jsp");	
		
	}else {
		int res = dao.autoSignUp(id, email, name);
		
		System.out.println(chk);
		
		System.out.println(id);
		
		UserDTO dto = dao.getMember(id);
		
		HttpSession session4 = request.getSession();
		
		session4.setAttribute("session_id", dto.getMember_id());
		
		session4.setAttribute("session_name", dto.getMember_name());
		
		session4.setAttribute("session_img", dto.getMember_image());
		
		forward.setRedirect(false);
		
		forward.setPath("main.jsp");	
	}
	
	
	
%>
