package com.wacha.profile.action;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.StarDAO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class ProfileOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
				
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.profileUpdate(member_Id);
		request.setAttribute("userProfile", dto);
		session.setAttribute("session_img", dto.getMember_image());
		
		StarDAO dao2 = StarDAO.getInstance();
		int star = dao2.reviewCheck(member_Id);
		request.setAttribute("review_count", star);
		
		int heart = dao2.heartCount(member_Id);
		request.setAttribute("heart_count", heart);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/profile.jsp");
		
		return forward;
	}

}
