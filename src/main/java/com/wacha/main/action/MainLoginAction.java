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


public class MainLoginAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String member_id = request.getParameter("memId").trim();
		String member_pwd = request.getParameter("memPwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		int res = dao.LoginCheck(member_id, member_pwd);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {	// 회원
			UserDTO sdto = dao.getMember(member_id);
			
			HttpSession session1 = request.getSession();
						
			session1.setAttribute("session_id", sdto.getMember_id());
			
			session1.setAttribute("session_name", sdto.getMember_name());
			
			session1.setAttribute("session_img", sdto.getMember_image());
			
			forward.setRedirect(false);
			
			forward.setPath("main.jsp");	
		}else if(res == 2) {	// 관리자
			
			UserDTO sdto = dao.getMember(member_id);
			
			HttpSession session2 = request.getSession();
			
			session2.setAttribute("session_id", sdto.getMember_id());
			
			session2.setAttribute("session_name", sdto.getMember_name());
			
			session2.setAttribute("session_img", sdto.getMember_image());
			
			forward.setRedirect(false);
			
			forward.setPath("admin/admin_main.jsp");
			
		}else {	// 비밀번호 틀림
			
			out.println("<script> alert('비밀번호가 틀립니다.'); history.back(); </script>");
			
		}
		
		return forward;
	}

}
