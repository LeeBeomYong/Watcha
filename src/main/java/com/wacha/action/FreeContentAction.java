package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		int free_num = Integer.parseInt(request.getParameter("num").trim());
		
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		FreeWriteDTO dto = dao.getFreeContent(free_num);
		dao.freeHit(free_num);

		request.setAttribute("Cont", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("write/free_cont.jsp");
		
		
		return forward;
	}

}
