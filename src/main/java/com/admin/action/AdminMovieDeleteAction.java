package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieDAO;

public class AdminMovieDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int movie_num= Integer.parseInt(request.getParameter("num").trim());
		
		MovieDAO dao = MovieDAO.getInstance();
		
		int check = dao.deleteMovie(movie_num);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		return null;
	}

}
