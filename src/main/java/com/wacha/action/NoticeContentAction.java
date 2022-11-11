package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;
import com.wacha.model.NoticeDTO;
import com.wacha.model.WriteDAO;

public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 notice 테이블에서 데이터를 뽑아오자.
		
		int notice_no = Integer.parseInt(request.getParameter("no").trim());
		
		WriteDAO dao = WriteDAO.getInstance();
		
		// 조회수 증가
		dao.noticeHit(notice_no);
		
		NoticeDTO content = dao.noticeContent(notice_no);
		
		request.setAttribute("NCont", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("write/write_notice.jsp");
				
		return forward;
		
	}

}
