package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.SingoDAO;

public class FreeReplySingoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("session_id");		
		
		String r_free_id = request.getParameter("si_id").trim();
		
		SingoDAO dao = SingoDAO.getInstance();
		
		dao.updateSingo(r_free_id, session_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		forward.setPath("free_main.do");
		return forward;		

		
		
	}

}
