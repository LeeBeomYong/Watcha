package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;

public class AdminNoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		int notice_no=Integer.parseInt(request.getParameter("num").trim());
		
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		int check = dao.deleteNotice(notice_no);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_service_notice.do");
		}else {
			out.println("<script>");
			out.println("alert('공지사항삭제')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
