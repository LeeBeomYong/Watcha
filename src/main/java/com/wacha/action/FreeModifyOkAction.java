package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//
		FreeWriteDTO dto = new FreeWriteDTO();
		
		String free_title = request.getParameter("free_title").trim();
		
		String free_cont = request.getParameter("free_cont").trim();
		
		int free_num = Integer.parseInt(request.getParameter("free_num").trim());
		
		dto.setFree_title(free_title);
		dto.setFree_cont(free_cont);
		dto.setFree_num(free_num);
		
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int res = dao.freeModify(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("free_content.do?num="+free_num);
			out.println("<script>");
			out.println("alert('수정완료')");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정시류ㅐ')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
		
	}

}
