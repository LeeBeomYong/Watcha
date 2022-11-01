package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;
import com.wacha.model.NoticeDTO;

public class AdminNoticeModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		
		
		String notice_title  = request.getParameter("title").trim();
		
		String notice_content= request.getParameter("content").trim();
		
	
		int notice_num= Integer.parseInt(request.getParameter("notice_num").trim());
		
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNotice_num(notice_num);
		
		dto.setNotice_title(notice_title);
		
		dto.setNotice_content(notice_content);
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out= response.getWriter();
		
		
		int res =dao.updateNotice(dto);
		if(res>0) {
			out.println("<script>");
			out.println("alert('게시판 정보 수정')");
			out.println("</script>");
			
			
			forward.setRedirect(true);
			forward.setPath("admin_service_notice.do");
		}else {
			out.println("<script>");
			out.println("alert('게시판 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return forward;
	}

}
