package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;

public class WachaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int movie_num=Integer.parseInt(request.getParameter("movie_num"));
		int coment_num=Integer.parseInt(request.getParameter("coment_num"));
		
		
		ComentDAO coment_dao = ComentDAO.getInstance();
		
		//coment_dao.deleteComent(movie_num,coment_num);
		ActionForward forward = new ActionForward();
		
		forward.setPath("wacha_content.do?movie_num="+movie_num);
		forward.setRedirect(true);
		
		return forward;
	}

}
