package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;

public class AdminDeleteOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//유저상세페이지에서 삭제버튼 누를시 
		String member_id =	request.getParameter("id").trim();
		
		String member_pwd = request.getParameter("pwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		int check =dao.userDelete(member_id, member_pwd);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_member_list.do");
		}else {
			out.println("<script>");
			out.println("alert(유저삭제')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
