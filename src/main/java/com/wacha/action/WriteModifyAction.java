package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class WriteModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int write_num = Integer.parseInt(request.getParameter("num").trim());
		
		WriteDAO dao = WriteDAO.getInstance();
		
		WriteDTO dto = dao.writeContent(write_num);
		
		request.setAttribute("Modify", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("write/write_modify.jsp");
		
		return forward;
		
		
	}

}
