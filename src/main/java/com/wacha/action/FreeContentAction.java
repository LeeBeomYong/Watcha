package com.wacha.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeReplyDTO;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class FreeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		UserDAO dao1 = UserDAO.getInstance();
		
		UserDTO dto1 = dao1.profileUpdate(member_Id);
		request.setAttribute("userProfile", dto1);
		
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
