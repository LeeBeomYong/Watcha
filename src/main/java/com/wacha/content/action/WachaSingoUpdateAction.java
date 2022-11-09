package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.SingoDAO;

public class WachaSingoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//댓글 단 아이디
		String member_id = request.getParameter("member_id");
		int coment_num = Integer.parseInt(request.getParameter("coment_num"));
		int moive_num = Integer.parseInt(request.getParameter("movie_num"));
		String coment_id = request.getParameter("coment_id");
		HttpSession session = request.getSession();
		
		String sessionId = (String)session.getAttribute("session_id");
		
		SingoDAO singo_dao = SingoDAO.getInstance();
		singo_dao.updateSingo(member_id,sessionId);
		
		ActionForward forward = new ActionForward();
		forward.setPath("wacha_coment.do?coment_num="+coment_num+"&movie_num="+moive_num+"&session_id="+coment_id);
		forward.setRedirect(true);
		return forward;
	}

}
