package com.wacha.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;
import com.wacha.model.StarDAO;
import com.wacha.model.StarDTO;

public class SelectGenreAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String genre = request.getParameter("genre");
		
		//System.out.println(genre);
			
		ImageDAO dao1 = ImageDAO.getInstance();
		List<ImageDTO> ilist = dao1.selectGenre_com(genre);
		List<ImageDTO> ilist2 = dao1.selectGenre_star(genre);
		List<ImageDTO> ilist3 = dao1.selectGenre_heart(genre);
		List<ImageDTO> ilist4 = dao1.selectGenre_now(genre);
				
		MovieDAO dao2 = MovieDAO.getInstance();
		List<MovieDTO> mlist = dao2.selectGenre_com(genre);
		List<MovieDTO> mlist2 = dao2.selectGenre_star(genre);
		List<MovieDTO> mlist3 = dao2.selectGenre_heart(genre);
		List<MovieDTO> mlist4 = dao2.selectGenre_now(genre);
		
		StarDAO dao3 = StarDAO.getInstance();
		List<StarDTO> slist = dao3.selectGenre_com(genre);
		List<StarDTO> slist2 = dao3.selectGenre_star(genre);
		List<StarDTO> slist3 = dao3.selectGenre_heart(genre);
		List<StarDTO> slist4 = dao3.selectGenre_now(genre);
		
		request.setAttribute("ilist", ilist);
		request.setAttribute("mlist", mlist);
		request.setAttribute("slist", slist);
		
		request.setAttribute("ilist2", ilist2);
		request.setAttribute("mlist2", mlist2);
		request.setAttribute("slist2", slist2);
		
		request.setAttribute("ilist3", ilist3);
		request.setAttribute("mlist3", mlist3);
		request.setAttribute("slist3", slist3);
		
		request.setAttribute("ilist4", ilist4);
		request.setAttribute("mlist4", mlist4);
		request.setAttribute("slist4", slist4);
		
		int[] number = {1,2,3,4,5,6,7,8,9,10};
		
		request.setAttribute("num", number);
		
		request.setAttribute("genre", genre);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("genre/main_genre.jsp");
		
		return forward;
	}

}
