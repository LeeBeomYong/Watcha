package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class AdminServiceDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		WriteDAO dao = WriteDAO.getInstance();
		
		int write_num = Integer.parseInt(request.getParameter("num").trim());
		
		WriteDTO dto = dao.writeContent(write_num);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		int res = dao.writeDelete(write_num);
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_service_answer.do");			
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}
}
