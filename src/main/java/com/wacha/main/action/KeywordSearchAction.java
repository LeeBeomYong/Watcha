package com.wacha.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;

import com.wacha.model.ComentDAO;
import com.wacha.model.ComentDTO;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;


public class KeywordSearchAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 검색어(keyword) 값을 받아 DB에서 해당 데이터 검색 후 view 페이지로 값 이동시키는 비지니스 로직
		
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String keyword = request.getParameter("keyword").trim();
		
		com.wacha.model.MovieDAO dao1 = MovieDAO.getInstance();
		
		List<MovieDTO> mlist = dao1.getMovieKeywordList(keyword);
		
		List<MovieDTO> dlist = dao1.getDirectorKeywordList(keyword);
		
		UserDAO dao2 = UserDAO.getInstance();
		
		List<UserDTO> ulist = dao2.getUserKeywordList(keyword);
		
		ImageDAO dao3 = ImageDAO.getInstance();
		
		List<ImageDTO> ilist = dao3.getImageKeywordList(keyword);
						
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("mList", mlist);
		
		request.setAttribute("dList", dlist);

		request.setAttribute("uList", ulist);
		
		request.setAttribute("iList", ilist);
				
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("search/search_list.jsp");
		
		return forward;
	}

}
