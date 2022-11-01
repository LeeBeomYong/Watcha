package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;
import com.wacha.model.NoticeDTO;



public class AdminNoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		int notice_num= Integer.parseInt(request.getParameter("num").trim());
		
		NoticeDAO dao = NoticeDAO.getInstance();
		//조회수 증가 		
		dao.noticeHit(notice_num);
		
		NoticeDTO content=dao.noticeContent(notice_num);
		
		request.setAttribute("NoticeContent", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice_content.jsp");
		
		return forward;
	}

}
