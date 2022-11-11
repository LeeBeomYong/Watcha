package com.wacha.profile.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;

public class ProfileLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session =  request.getSession();
		
		//현재 사용중인 모든 세션을 종료시키는 메서드.
		session.invalidate();
		
		ActionForward forward = new ActionForward();	
		forward.setRedirect(true);
		forward.setPath("main.jsp");
		return forward;
}

}
