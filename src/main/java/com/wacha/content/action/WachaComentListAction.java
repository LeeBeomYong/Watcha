package com.wacha.content.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;
import com.wacha.model.ComentDTO;

public class WachaComentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int movie_num=Integer.parseInt(request.getParameter("movie_num"));
		
		ComentDAO dao = ComentDAO.getInstance();
		List<ComentDTO> list= dao.getComentList(movie_num);
		
		request.setAttribute("list", list);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("/content/ComentListPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
