package com.wacha.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		
		System.out.println(id);
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.getMember(id);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("session_id", dto.getMember_id());
		
		session.setAttribute("session_img", dto.getMember_image());
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("main.jsp");
		
		return forward;
	}

}
