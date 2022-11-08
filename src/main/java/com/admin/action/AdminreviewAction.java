package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;

public class AdminreviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("admin/AdminReview.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
