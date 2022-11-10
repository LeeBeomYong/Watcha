package com.wacha.profile.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;
import com.wacha.model.UserDTO;

public class ProfileUpdateAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String saveFolder = "C:\\NCS\\workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\image\\profileupload";
//		C:\\myJSP\\wrokspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\image
		int fileSize = 10 * 1024 * 1024;  // 10MB 
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String user_name = multi.getParameter("pr_name").trim();
		String user_id = multi.getParameter("pr_id").trim();
		String user_pwd = multi.getParameter("pr_pwd").trim();
		String user_intro = multi.getParameter("pr_intro").trim();
		String user_birth = multi.getParameter("pr_birth").trim();
		String user_img = multi.getFilesystemName("pr_img");
		
		UserDTO dto = new UserDTO();
		
		dto.setMember_name(user_name);
		dto.setMember_id(user_id);
		dto.setMember_pwd(user_pwd);
		dto.setMember_profile(user_intro);
		dto.setMember_birth(user_birth);
		dto.setMember_image(user_img);
		
		UserDAO dao = UserDAO.getInstance();
		
		int result = dao.updateUser(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0 ) {
			forward.setRedirect(false);
			forward.setPath("profile.do");
			
		}else {
			out.println("<script>");
			out.println("alert('프로필 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
