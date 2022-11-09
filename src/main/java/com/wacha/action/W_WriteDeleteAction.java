package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;

public class W_WriteDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		WriteDAO dao = WriteDAO.getInstance();
		
		int w_num = Integer.parseInt(request.getParameter("num").trim());
		
		W_WriteDTO dto = dao.w_writeContent(w_num);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		int res = dao.w_writeDelete(w_num);
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("write_result.do");
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
		
	}

}
