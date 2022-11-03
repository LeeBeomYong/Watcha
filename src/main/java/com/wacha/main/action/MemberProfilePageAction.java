package com.wacha.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;


public class MemberProfilePageAction implements Action {


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String member_id = request.getParameter("member_id").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO memProfile = dao.getMemberProfile(member_id);
		
		request.setAttribute("profile", memProfile);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("lby/profile.jsp");
		
		return forward;
		
	}

}
