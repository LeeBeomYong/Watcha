
package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num").trim());
		
		FreeWriteDTO dto = dao.getFreeContent(num);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		int res = dao.freeDelete(num);
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("free_main.do");
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}

