package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.SingoDAO;
import com.wacha.model.SingoDTO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class AdminreviewAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ComentDAO coment_dao = ComentDAO.getInstance();
		
		FreeWriteDAO free_dao = FreeWriteDAO.getInstance();
		
		UserDAO user_dao = UserDAO.getInstance();
		
		SingoDAO singo_dao = SingoDAO.getInstance();
		List<SingoDTO> singo_list =  singo_dao.getList();
		
		request.setAttribute("coment_size", coment_dao.getComentListCount());
		request.setAttribute("free_size", free_dao.getFreeCount());
		request.setAttribute("singo_list", singo_list);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("admin/AdminReview.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
