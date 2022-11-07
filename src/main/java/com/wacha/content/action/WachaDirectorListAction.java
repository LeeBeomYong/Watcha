package com.wacha.content.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieAndStarDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class WachaDirectorListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String director = request.getParameter("director");
		int movie_num=0;
		if(request.getParameter("movie_num")!=null) {
			movie_num = Integer.parseInt(request.getParameter("movie_num"));
		}
		
		MovieDAO movie_dao = MovieDAO.getInstance();
		
		
		List<MovieAndStarDTO> movie_list=movie_dao.getMovieList(director);
		
		ImageDAO image_dao = ImageDAO.getInstance();
		
		ImageDTO image_dto= image_dao.getImageKeywordList(director).get(0);
		ActionForward forward = new ActionForward();
		
		
		request.setAttribute("movie_dto", movie_list.get(0));
		request.setAttribute("movie_list", movie_list);
		request.setAttribute("image_dto", image_dto);
		
		forward.setPath("content/DirectorPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
