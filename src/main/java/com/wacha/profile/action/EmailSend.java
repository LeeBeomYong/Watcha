package com.wacha.profile.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class EmailSend implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO profile_list = dao.profileUpdate(member_Id);
		request.setAttribute("profileList", profile_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/delete.jsp");
		
		return forward;
		
	}

}
