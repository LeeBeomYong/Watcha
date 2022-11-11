package com.wacha.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;



public class NaverLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 네이버 로그인 아이디 와 이름
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		// 등록
		UserDAO user_dao = UserDAO.getInstance();
		
		// 아이디 확인
		int chk = user_dao.checkMemberId(id);
		
		ActionForward forward = new ActionForward();
		
		//user_dao.insertMember(name, id, "1234", id);
		
		if(chk > 0) {	// 아이디 존재
			
			System.out.println(chk);
		
			System.out.println("if chk > 0 : "+id);
			
			UserDTO dto = user_dao.getMember(id);
			
			HttpSession session3 = request.getSession();
			
			session3.setAttribute("session_id", dto.getMember_id());
			
			session3.setAttribute("session_name", dto.getMember_name());
			
			session3.setAttribute("session_img", dto.getMember_image());
			
			System.out.println("session id : " + dto.getMember_id());
			System.out.println("session name : " + dto.getMember_name());
			System.out.println("session img : " + dto.getMember_image());
			
			forward.setRedirect(true);
			
			forward.setPath("main.jsp");	
			
		}else {
			int res = user_dao.autoSignUp(id, id, name);
			
			System.out.println(chk);
			
			System.out.println(id);
			
			UserDTO dto = user_dao.getMember(id);
			
			HttpSession session4 = request.getSession();
			
			session4.setAttribute("session_id", dto.getMember_id());
			
			session4.setAttribute("session_name", dto.getMember_name());
			
			session4.setAttribute("session_img", dto.getMember_image());
			
			forward.setRedirect(false);
			
			forward.setPath("main.jsp");	
		}
		
		/*
		 * // 등록 후 로그인 하기
		 * 
		 * UserDTO sdto = user_dao.getMember(id);
		 * 
		 * HttpSession session1 = request.getSession();
		 * 
		 * HttpSession session2 = request.getSession();
		 * 
		 * session1.setAttribute("session_id", sdto.getMember_id());
		 * 
		 * session2.setAttribute("session_img", sdto.getMember_image());
		 * 
		 * forward.setRedirect(true);
		 * 
		 * forward.setPath("main.jsp");
		 */

		return forward;
	}

}
