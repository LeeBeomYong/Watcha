package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_ReplyDTO;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class W_WriteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		int w_write_num = Integer.parseInt(request.getParameter("num").trim());
		
		WriteDAO dao = WriteDAO.getInstance();
		
		W_WriteDTO rcontent = dao.w_writeContent(w_write_num);
		W_ReplyDTO rcont = dao.w_replyContent(w_write_num);
		
		request.setAttribute("RCont", rcontent);
		request.setAttribute("RRCont", rcont);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("write/w_write_content.jsp");
		
		return forward;	
		
		
		
	}

}
