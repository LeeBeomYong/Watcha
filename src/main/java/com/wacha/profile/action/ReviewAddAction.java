package com.wacha.profile.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieTitleStarDTO;
import com.wacha.model.StarDAO;

public class ReviewAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		StarDAO dao = StarDAO.getInstance();		
		
		//평가한 영화 목록 보여주기
		List<MovieTitleStarDTO> img_list = dao.movieTitleStar(member_Id);
		request.setAttribute("img_List", img_list);
		
		//평가한 영화 목록 별점순으로 보여주기
		List<MovieTitleStarDTO> star_list = dao.movieTitleStar2(member_Id);
		request.setAttribute("star_list", star_list);
		//평가한 영화 목록 제목순으로 보여주기
		List<MovieTitleStarDTO> title_list = dao.movieTitleStarTitle(member_Id);
		request.setAttribute("title_list", title_list);
		//평가한 영화 목록 년도순으로 보여주기
		List<MovieTitleStarDTO> year_list = dao.movieTitleStarYear(member_Id);
		request.setAttribute("year_list", year_list);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/detail.jsp");
		return forward;
	}

}
