package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;

public class AdminServiceW_WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int w_write_num = Integer.parseInt(request.getParameter("num"));
		
		WriteDAO dao= WriteDAO.getInstance();
		
		W_WriteDTO w_write = dao.w_writeContent(w_write_num);
		
		request.setAttribute("write", w_write);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_service_w_write.jsp");
		
		return forward;
	}

}
