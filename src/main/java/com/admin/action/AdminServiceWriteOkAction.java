package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ReplyDTO;
import com.wacha.model.WriteDAO;

public class AdminServiceWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		ReplyDTO dto = new ReplyDTO();
		
		String reply_cont = request.getParameter("reply_cont").trim();
		int write_num = Integer.parseInt(request.getParameter("write_num").trim());
		
		dto.setReply_cont(reply_cont);
		dto.setWrite_num(write_num);
		
		WriteDAO dao = WriteDAO.getInstance();
		
		int update = dao.insertReply(dto);
		
		request.setAttribute("Reply", update);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(update > 0 ) {
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
