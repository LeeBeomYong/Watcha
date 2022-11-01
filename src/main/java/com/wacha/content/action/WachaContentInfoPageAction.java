package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class WachaContentInfoPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int movie_num = Integer.parseInt(request.getParameter("movie_num"));
		
		MovieDAO dao = MovieDAO.getInstance();
		
		MovieDTO dto= dao.getContentInfo(movie_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("content/MovieInfo.jsp");
		
		return forward;
	}

}
