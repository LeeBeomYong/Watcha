package com.wacha.content.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;

public class WachaComentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String member_Id="";
		HttpSession session = request.getSession();
		if(session.getAttribute("session_id")!=null) {
			member_Id = (String)session.getAttribute("session_id");
		}
		String content=request.getParameter("content");
		String chk="";
		
		if(request.getParameter("chk")!=null) {
			chk=request.getParameter("chk");
		}
		
		
		int movie_num = Integer.parseInt(request.getParameter("movie_num"));
		
		System.out.println("와챠 게시글 서블릿 : "+member_Id+", "+content+", "+chk+", "+movie_num);
		
		ComentDAO coment_dao = ComentDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		int count = coment_dao.addComent(member_Id,content,movie_num);
		ActionForward forward = new ActionForward();
		
		if(chk.equals("")) {
			out.println("<script>"
					+ "window.close();"
					+ "window.opener.location.href=\"wacha_coment.do?movie_num="+movie_num+"&coment_num="+count+"&member_Id="+member_Id+"\""
					+ "</script>");
			forward.setPath("wacha_coment.do?movie_num="+movie_num+"&coment_num="+count+"&session_id="+member_Id);
			forward.setRedirect(true);
		}else {
			forward.setPath("wacha_content.do?movie_num="+movie_num);
			forward.setRedirect(true);
		}
		
		
		
		return forward;
	}

}
