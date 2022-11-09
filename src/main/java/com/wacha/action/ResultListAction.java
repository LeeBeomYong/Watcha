package com.wacha.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ReplyDTO;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class ResultListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		
		WriteDAO dao = WriteDAO.getInstance();
		
		List<WriteDTO> list = dao.getWriteList1(id);
		
		List<W_WriteDTO> rlist = dao.getW_WriteList(id);
		
		request.setAttribute("List", list);
		request.setAttribute("RList", rlist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);

		forward.setPath("write/write_result.jsp");
		
		return forward;
		
		
	}

}
