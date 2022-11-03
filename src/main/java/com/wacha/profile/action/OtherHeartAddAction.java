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

public class OtherHeartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("member_Id");
		
		String member_Id2 = request.getParameter("member_id");
		
		StarDAO dao = StarDAO.getInstance();
		
		//보고싶어요 등록한 영화 목록 보여주는 메서드
		List<MovieTitleStarDTO> img_list = dao.movieTitleHeart(member_Id2);
		request.setAttribute("img_List", img_list);
		
		//보고싶어요 등록한 영화 목록 제목순으로 보여주는 메서드
		List<MovieTitleStarDTO> title_list = dao.movieTitleHeartTitle(member_Id2);
		request.setAttribute("title_list", title_list);
		
		//보고싶어요 등록한 영화 목록 년도순으로 보여주는 메서드
		List<MovieTitleStarDTO> year_list = dao.movieTitleHeartYear(member_Id2);
		request.setAttribute("year_list", year_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("lby/otherdetail2.jsp");
		return forward;
	}

}
