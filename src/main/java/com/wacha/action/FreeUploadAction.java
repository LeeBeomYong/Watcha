package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 
		
		FreeWriteDTO dto = new FreeWriteDTO();
		
		String member_id = request.getParameter("member_id").trim();
		String free_title = request.getParameter("free_title").trim();
		String free_cont = request.getParameter("free_cont").trim();
		String free_file = request.getParameter("free_file");
		
		dto.setMember_id(member_id);
		dto.setFree_title(free_title);
		dto.setFree_cont(free_cont);
		dto.setFree_file(free_file);
		
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int res = dao.insertFreeUpload(dto);
		
		request.setAttribute("Upload", res);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("free_main.do");
		}else {
			out.println("<script>");
			out.println("alert('추가 실퓨ㅐ.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return forward;
		
		
	}

}
