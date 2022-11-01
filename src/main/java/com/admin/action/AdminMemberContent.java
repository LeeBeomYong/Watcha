package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;

import com.wacha.model.ContentDTO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;
;

public class AdminMemberContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String member_id = request.getParameter("id").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO content = dao.UserContent(member_id);
	
		ComentDAO dao1 = ComentDAO.getInstance();
		
		List<ContentDTO> coment= dao1.userContentComentList(member_id);
		
		/*
		 * WriteDAO dao2 = WriteDAO.getInstance();
		 * 
		 * WriteDTO write = dao2.userContentWrite(member_id);
		 */
		
		request.setAttribute("UserContent", content);
		
		request.setAttribute("userComentList",coment);
		
		/* request.setAttribute("userWriteList", write); */
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_user_content.jsp");
		
		return forward;
	}

}
