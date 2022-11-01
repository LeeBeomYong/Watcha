package com.wacha.profile.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;

public class ProfileDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String member_Id = (String)session.getAttribute("member_Id");
		
		// 비밀번호 가져오기
		String user_pwd = request.getParameter("pwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		
		// star테이블 탈퇴한 유저꺼 삭제하는 메서드
		dao.starDelete(member_Id, user_pwd);
		// reply테이블 탈퇴한 유저꺼 삭제하는 메서드
		//dao.replyDelete(member_Id, user_pwd);
		// write테이블 탈퇴한 유저꺼 삭제하는 메서드 
		dao.writeDelete(member_Id, user_pwd);
		// w_write테이블 탈퇴한 유저꺼 삭제하는 메서드
		dao.w_writeDelete(member_Id, user_pwd);
		// coment테이블 탈퇴한 유저꺼 삭제하는 메서드
		dao.comentDelete(member_Id, user_pwd);
		
		
		
		
		
		// 유저 삭제하는 메서드
		int result = dao.userDelete(member_Id, user_pwd);

		PrintWriter out = response.getWriter();
		
		if(result>0) {			
			out.println("<script>");
			out.println("window.close();");
			out.println("window.opener.location.href=\"main2.jsp\"");
			out.println("</script>");
			
		}else if( result == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('탈퇴에 실패했습니다..')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
