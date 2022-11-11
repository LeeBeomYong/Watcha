package com.wacha.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;

public class R_ResultListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		WriteDAO dao = WriteDAO.getInstance();
		
		String id = request.getParameter("id");
		
		List<W_WriteDTO> list = dao.getW_WriteList(id);
		
		request.setAttribute("RList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("write/write_result.jsp");
		
		return forward;
		
		
		
	}

}
