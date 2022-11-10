package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ReplyDTO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class WriteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		UserDAO dao1 = UserDAO.getInstance();
		
		UserDTO dto1 = dao1.profileUpdate(member_Id);
		request.setAttribute("userProfile", dto1);		
		
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

