package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;

import com.wacha.model.ContentDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;
;

public class AdminMemberContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		

		
		String member_id = request.getParameter("id").trim();

	
		ComentDAO dao = ComentDAO.getInstance();
		
		WriteDAO dao2 = WriteDAO.getInstance();
		
		
		UserDAO dao1 = UserDAO.getInstance();
		
		UserDTO content = dao1.UserContent(member_id);
		
		
		
		
		int num_son=dao.getComentcount(member_id);
		
		List<ContentDTO> coment= dao.userContentComentList(member_id );
		  
		List<WriteDTO> write = dao2.userContentWrite(member_id);
		
		
		request.setAttribute("num_son", num_son);
		
		request.setAttribute("UserContent", content);
		
		request.setAttribute("userComentList",coment);
		
		request.setAttribute("userWriteList", write); 
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_user_content.jsp");
		
		return forward;
	}

}
