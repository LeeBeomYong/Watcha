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
		
		String k_id = request.getParameter("k_id");
		
		String access_token = request.getParameter("access_token");
		
		UserDAO dao = UserDAO.getInstance();
		
		int res = dao.kakaoLogin(k_id);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			
			UserDTO dto = dao.getMember(k_id);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("session_id", dto.getMember_id());
			
			session.setAttribute("session_img", dto.getMember_image());
			
			request.setAttribute("ac_token", access_token);
			
			forward.setRedirect(false);
			forward.setPath("main.jsp");
		}else {
			out.println("<script> history.back(); alert('가입하지 않은 아이디입니다. 회원가입을 진행해주세요.'); </script>");
			
		}
		
		
		return forward;
	}

}
