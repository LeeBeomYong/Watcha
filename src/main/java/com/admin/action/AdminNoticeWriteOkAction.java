package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;
import com.wacha.model.NoticeDTO;

public class AdminNoticeWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		NoticeDTO dto = new NoticeDTO();
		
		String notice_title= request.getParameter("title").trim();
		
		String notice_content= request.getParameter("content").trim();
		
		dto.setNotice_title(notice_title);
		
		dto.setNotice_content(notice_content);
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		int res = dao.isertNotice(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			forward.setRedirect(true);
			
			forward.setPath("admin_service_notice.do");
		}else {
			out.println("<script>");
			out.println("alert('공지글 저장실패')");
			out.println("history.back()");
			out.println("</script>");
			 
		}
		
		return forward;
	}

}
