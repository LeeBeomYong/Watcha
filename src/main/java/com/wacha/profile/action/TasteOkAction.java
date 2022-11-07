package com.wacha.profile.action;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieAndStarDTO;
import com.wacha.model.StarDAO;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class TasteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		session.setAttribute("member_Id", member_Id);
				
		StarDAO dao = StarDAO.getInstance();
		UserDAO dao2 = UserDAO.getInstance();
		//
		
		UserDTO dto2 = dao2.profileUpdate(member_Id);
		request.setAttribute("userProfile", dto2);
		
		int result = dao.reviewCheck(member_Id);
		request.setAttribute("review_count", result);
		
		//dao.starCheck(member_Id);
		
		List<MovieAndStarDTO> country_list = dao.countryCheck(member_Id);
		request.setAttribute("countryList", country_list);
		
		List<MovieAndStarDTO> genre_list = dao.genreCheck(member_Id);
		request.setAttribute("genreList", genre_list);
		
		int sum = dao.timeCheck(member_Id);
		request.setAttribute("time_sum", sum);
		
		double avg = dao.starAvg(member_Id);
		request.setAttribute("star_avg", avg);
		
		int count = dao.starCount(member_Id);
		request.setAttribute("star_count", count);
		
		int max = dao.starMax(member_Id);
		request.setAttribute("star_max", max);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/taste.jsp");
		return forward;
		//select count(distinct movie_num) from star group by member_id having member_id='test1';
	}

}
