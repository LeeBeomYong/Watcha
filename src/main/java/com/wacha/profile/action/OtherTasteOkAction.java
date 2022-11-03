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

public class OtherTasteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("member_Id");
		
		String member_Id2 = request.getParameter("member_id");
		request.setAttribute("member_Id2", member_Id2);
		
				
		StarDAO dao = StarDAO.getInstance();
		UserDAO dao2 = UserDAO.getInstance();
		//
		
		UserDTO dto2 = dao2.profileUpdate(member_Id2);
		request.setAttribute("userProfile", dto2);
		
		int result = dao.reviewCheck(member_Id2);
		request.setAttribute("review_count", result);
		
		//dao.starCheck(member_Id);
		
		List<MovieAndStarDTO> country_list = dao.countryCheck(member_Id2);
		request.setAttribute("countryList", country_list);
		
		List<MovieAndStarDTO> genre_list = dao.genreCheck(member_Id2);
		request.setAttribute("genreList", genre_list);
		
		int sum = dao.timeCheck(member_Id2);
		request.setAttribute("time_sum", sum);
		System.out.println(sum);
		
		double avg = dao.starAvg(member_Id2);
		request.setAttribute("star_avg", avg);
		
		int count = dao.starCount(member_Id2);
		request.setAttribute("star_count", count);
		
		int max = dao.starMax(member_Id2);
		request.setAttribute("star_max", max);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/othertaste.jsp");
		return forward;
		//select count(distinct movie_num) from star group by member_id having member_id='test1';
	}

}
