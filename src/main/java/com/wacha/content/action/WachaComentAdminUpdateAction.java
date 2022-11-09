package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;

public class WachaComentAdminUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int coNum=0;
		if(request.getParameter("coment_num")!=null) {
			coNum = Integer.parseInt(request.getParameter("coment_num"));
		}
		
		ComentDAO coment_dao = ComentDAO.getInstance();
		
		coment_dao.Adminupdate(coNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("admin_review_list.do");
		forward.setRedirect(true);
		return forward;
	}

}
