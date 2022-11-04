package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class AdminMemberContentWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		/*String member_id =request.getParameter("id").trim();*/
		
		int write_num= Integer.parseInt(request.getParameter("num").trim());
		
		WriteDAO dao = WriteDAO.getInstance();
		
		WriteDTO write= dao.writeContent(write_num);
				
		request.setAttribute("WriteContent", write);
		return null;
	}

}