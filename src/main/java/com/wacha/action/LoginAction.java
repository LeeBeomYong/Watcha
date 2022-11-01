package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDTO;
import com.wacha.model.WriteDAO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		
		String member_id = request.getParameter("member_id").trim();
		String write_pwd = request.getParameter("write_pwd").trim();
		
		WriteDAO dao = WriteDAO.getInstance();
		
		int check = dao.loginCheck(member_id, write_pwd);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			UserDTO dto = dao.getMember(member_id);

			HttpSession session = request.getSession();
			
			session.setAttribute("member_id", dto.getMember_id());
			session.setAttribute("member_pwd", dto.getMember_pwd());
			
			forward.setRedirect(true);
			forward.setPath("main_ok.do");
			
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인 요망')");
			out.println("history.back()");
			out.println("</script>");	
		}else {
			// 회원이 아닌 경우(아이디가 없거나 아이디가 틀린 경우)
			out.println("<script>");
			out.println("alert('없는 아이디 입니다. 확인 요망')");
			out.println("history.back()");
			out.println("</script>");	
		}
		return forward;
	}

}
