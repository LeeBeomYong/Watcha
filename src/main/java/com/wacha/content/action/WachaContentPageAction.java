package com.wacha.content.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;
import com.wacha.model.ComentDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;
import com.wacha.model.MovieImageDTO;
import com.wacha.model.StarDAO;
import com.wacha.model.StarDTO;

public class WachaContentPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int movie_num=Integer.parseInt(request.getParameter("movie_num"));
		System.out.println("영화 번호 : "+ movie_num);
		// Movie 정보
		MovieDAO movie_dao = MovieDAO.getInstance();
		MovieDTO mDto = movie_dao.getContentInfo(movie_num);
		
		List<MovieImageDTO> same = movie_dao.getMovie_genre(mDto.getMovie_genre());
		
		// Movie Coment 정보
		ComentDAO coment_dao = ComentDAO.getInstance();
		List<ComentDTO> clist= coment_dao.getComentList(movie_num);
		
		System.out.println("clist 길이 : "+clist.size());
		
		
		
		
		// 해당 영화 평점 출력
		StarDAO star_dao =StarDAO.getInstance();
		double avgStar = star_dao.getStar(movie_num);
		int count = star_dao.getMovieStarcount(movie_num);
		int coment_count=clist.size();
		
		
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("session_id")!=null) {
			StarDTO star_dto=star_dao.getStar(movie_num, (String)session.getAttribute("session_id"));
			
			ComentDTO coment_dto =coment_dao.getComentInfo(movie_num, (String)session.getAttribute("session_id"));
			
			request.setAttribute("coment_dto", coment_dto);
			request.setAttribute("star_dto", star_dto);
			request.setAttribute("heart", star_dto.getMovie_heart());
			System.out.println("찜 >>>>"+ star_dto.getMovie_heart());
			request.setAttribute("watch", star_dto.getMovie_watch());
			System.out.println("보는중 >>>>"+ star_dto.getMovie_watch());
			
		}
		request.setAttribute("chk", 1);
		request.setAttribute("mDto", mDto);
		request.setAttribute("clist", clist);
		request.setAttribute("avgStar", avgStar);
		request.setAttribute("count", count);
		request.setAttribute("coment_count", coment_count);
		request.setAttribute("same", same);
		
		ActionForward forward = new ActionForward();
		
		
		forward.setRedirect(false);
		forward.setPath("/content/ContentPage.jsp");
		
		return forward;
	}

}
