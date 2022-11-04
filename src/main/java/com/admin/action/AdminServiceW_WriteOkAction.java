package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_ReplyDTO;
import com.wacha.model.WriteDAO;

public class AdminServiceW_WriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		W_ReplyDTO dto = new W_ReplyDTO();
		
		String w_cont =request.getParameter("reply_w_cont").trim();
		
		int w_wum=Integer.parseInt(request.getParameter("w_writenum").trim());
		
		dto.setR_cont(w_cont);
		
		dto.setW_num(w_wum);
		
		WriteDAO dao = WriteDAO.getInstance();
		
		int check = dao.insertw_reply(dto);
		
		request.setAttribute("w_reply", check);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0 ) {
			forward.setRedirect(true);
			forward.setPath("admin_service_answer.do");
		}else {
			out.println("<script>");
			out.println("alert('답변 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
