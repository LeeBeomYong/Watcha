package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ComentDAO;
import com.wacha.model.ComentDTO;

public class AdminComent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int coment_num =Integer.parseInt(request.getParameter("num").trim());
		
		String member_id= request.getParameter("id").trim();
		
		int movie_num=Integer.parseInt(request.getParameter("no").trim());
		
		/* int coment_num_son= Integer.parseInt(request.getParameter("su").trim()); */
		
		ComentDAO dao = ComentDAO.getInstance();
		
		List<ComentDTO>list= dao.getComentcontent(coment_num,member_id,movie_num);
		
		List<ComentDTO>list1= dao.getComentcontentson(coment_num,member_id,movie_num);
		request.setAttribute("comentList", list);
		request.setAttribute("comentsonList", list1);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_coment_content.jsp");
		
		return forward;
	}

}
