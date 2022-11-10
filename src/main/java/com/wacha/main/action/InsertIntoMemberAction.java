package com.wacha.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;

public class InsertIntoMemberAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String member_name = request.getParameter("memName");
		String member_id = request.getParameter("memId");
		String member_pwd = request.getParameter("memPwd");
		String member_email = request.getParameter("memEmail");
		
		UserDAO dao = UserDAO.getInstance();
		
		int res = dao.insertMember(member_name, member_id, member_pwd, member_email);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script> alert('회원가입이 완료되었습니다.'); </script>");
			forward.setRedirect(false);
			forward.setPath("main.jsp");
		}else {
			out.println("<script> alert('오류 발생. 다시 시도해주세요'); history.back(); </script>");
		}
		
		return forward;
	}

}
