package com.wacha.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;


public class MovieContentPageAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int movie_num = Integer.parseInt(request.getParameter("num"));
		
		MovieDAO dao = MovieDAO.getInstance();
		
		MovieDTO content = dao.getMovie_info(movie_num);
		
		request.setAttribute("cont", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("wacha_content.do?movie_num="+movie_num);
		
		return forward;
		
	}

}
