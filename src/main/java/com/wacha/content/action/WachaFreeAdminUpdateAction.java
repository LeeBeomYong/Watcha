package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;

public class WachaFreeAdminUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int freeNum=0;
		if(request.getParameter("free_num")!=null) {
			freeNum = Integer.parseInt(request.getParameter("free_num"));
		}
		FreeWriteDAO free_dao = FreeWriteDAO.getInstance();
		free_dao.updateWriteToAdmin(freeNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("admin_review_list.do");
		forward.setRedirect(true);
		return forward;
	}

}
