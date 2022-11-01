package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ReplyDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class WriteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int write_num = Integer.parseInt(request.getParameter("num").trim());
		
		WriteDAO dao = WriteDAO.getInstance();
		
		// 조회수 증가
		dao.writeHit(write_num);
		
		WriteDTO content = dao.writeContent(write_num);
		ReplyDTO reply = dao.writeReply(write_num);
		
		request.setAttribute("Cont", content);
		request.setAttribute("Reply", reply);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("write/write_content.jsp");
		
		return forward;
	}

}

