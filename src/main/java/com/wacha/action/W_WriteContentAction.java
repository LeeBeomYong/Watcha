package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;
import com.wacha.model.W_ReplyDTO;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class W_WriteContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		UserDAO dao1 = UserDAO.getInstance();
		
		UserDTO dto1 = dao1.profileUpdate(member_Id);
		request.setAttribute("userProfile", dto1);			
		
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
