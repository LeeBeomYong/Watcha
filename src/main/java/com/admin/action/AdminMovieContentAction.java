package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class AdminMovieContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		
		int movie_num = Integer.parseInt(request.getParameter("num").trim());
		
		MovieDAO dao = MovieDAO.getInstance();
		
		ImageDAO dao1 = ImageDAO.getInstance();
		
		MovieDTO content = dao.movieContent(movie_num);
		
		ImageDTO image= dao1.movieImage(movie_num);
		
		request.setAttribute("Content", content);
		
		request.setAttribute("image", image);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_movie_content.jsp");
		
		return forward;
	}

}
