package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieDAO;

public class WachaDirectorListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String director = request.getParameter("director");
		int movie_num=0;
		if(request.getParameter("movie_num")!=null) {
			movie_num = Integer.parseInt(request.getParameter("movie_num"));
		}
		
		MovieDAO movie_dao = MovieDAO.getInstance();
		
		movie_dao.getMovieList(director);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("movie_num", movie_num);
		forward.setPath("content/DirectorPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
