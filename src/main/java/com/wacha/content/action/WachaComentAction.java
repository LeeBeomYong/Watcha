package com.wacha.content.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;
import com.wacha.model.ComentDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;
import com.wacha.model.StarDAO;
import com.wacha.model.StarDTO;

public class WachaComentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//coment_num=1 & movie_num=1
		
		int movie_num =Integer.parseInt(request.getParameter("movie_num"));
		int coment_num = Integer.parseInt(request.getParameter("coment_num"));
		//HttpSession session = request.getSession();
		String member_Id=request.getParameter("session_id");
		/*
		 * if(session.getAttribute("session_id")!=null) { member_Id =
		 * (String)session.getAttribute("session_id"); }
		 */
		
		
		System.out.println("데이터 넘겨받기\n"+movie_num);
		System.out.println(coment_num);
		System.out.println(member_Id+"\n========");
		
		ComentDAO coment_dao = ComentDAO.getInstance();
		ComentDTO coment_dto= coment_dao.getComentInfo(movie_num,coment_num);
		System.out.println(coment_dto == null);
		
		System.out.println("이거 출력한다 잘봐라");
		int[] id_hit=coment_dao.getComentInfo(movie_num,coment_num,member_Id);
		
		System.out.println("id hit 값들 : >>>>>"+ id_hit[0]+",  "+id_hit[1]);
		MovieDAO movie_dao = MovieDAO.getInstance();
		MovieDTO movie_dto = movie_dao.getContentInfo(movie_num);
		
		
		
		
		StarDAO star_dao = StarDAO.getInstance();
		StarDTO star_dto = star_dao.getStar(movie_num,member_Id);
		
		request.setAttribute("coment_dto", coment_dto);
		request.setAttribute("movie_dto", movie_dto);
		request.setAttribute("star_dto", star_dto);
		request.setAttribute("id_hit", id_hit);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("/content/ComentPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
