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

public class ReviewOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("session_id");
		
		//String member_Id2 = request.getParameter("member_id");
		
	
		StarDAO dao = StarDAO.getInstance();		
		
		
		int result = dao.reviewCheck(member_Id);
		request.setAttribute("review_count", result);
		
		int heart = dao.heartCount(member_Id);
		request.setAttribute("heart_count", heart);
		
		int watch = dao.watchCount(member_Id);
		request.setAttribute("watch_count", watch);
		
		List<MovieTitleStarDTO> img_list = dao.movieTitleStar(member_Id);
		request.setAttribute("img_List", img_list);
		
		
		
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/review.jsp");
		return forward;
		
	}

}
