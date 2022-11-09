package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class AdminServiceListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		
		
		WriteDAO dao = WriteDAO.getInstance();
		
		List<WriteDTO> list = dao.getWriteList2();
		List<W_WriteDTO> list_1 = dao.getW_WriteList2();
		
		request.setAttribute("List", list);
		request.setAttribute("List_1", list_1);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_service_list.jsp");
		
		return forward;
	}

}


