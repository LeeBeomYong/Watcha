package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDAO;
import com.wacha.model.NoticeDTO;

public class AdminNoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 공지사항 리스트를 불러오는 액션
		NoticeDAO dao = NoticeDAO.getInstance();
		
		
		List<NoticeDTO>noticeList= dao.getnoticeList();
		
		request.setAttribute("NoticeList", noticeList);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice_list.jsp");
		System.out.println("forward>>>>>>>>>>"+forward);
		return forward;
		
	}

}
